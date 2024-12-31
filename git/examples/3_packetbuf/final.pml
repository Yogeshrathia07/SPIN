#define PACKETBUF_SIZE 128
#define PACKETBUF_NUM_ATTRS 16
#define PACKETBUF_NUM_ADDRS 8
#define PACKETBUF_ADDR_FIRST 0
#define PACKETBUF_ADDR_RECEIVER 1
#define MAX_PACKETS 10  // Added to define maximum packet count

/* Global variables with added error tracking */
byte packetbuf[PACKETBUF_SIZE];
int buflen = 0;
int bufptr = 0;
int hdrlen = 0;
int packet_count = 0;
bool error_overflow = false;

/* Attribute and Address Structures */
typedef Attribute {
    int val;
}

typedef Address {
    int addr;
    bool is_null;
}

Attribute packetbuf_attrs[PACKETBUF_NUM_ATTRS];
Address packetbuf_addrs[PACKETBUF_NUM_ADDRS];

/* Utility Proctype for Clear Operation */
proctype packetbuf_attr_clear() {
    atomic {
        /* Clear attributes */
        int i = 0;
        do
        :: (i < PACKETBUF_NUM_ATTRS) ->
            packetbuf_attrs[i].val = 0;
            i++;
        :: else -> break;
        od;

        /* Clear addresses */
        i = 0;
        do
        :: (i < PACKETBUF_NUM_ADDRS) ->
            packetbuf_addrs[i].addr = 0;
            packetbuf_addrs[i].is_null = true;
            i++;
        :: else -> break;
        od;
    }
}

/* Packet Buffer Clear Operation */
proctype packetbuf_clear() {
    atomic {
        buflen = 0;
        bufptr = 0;
        hdrlen = 0;
        run packetbuf_attr_clear();
    }
}

/* Copy From External Source with Overflow Checking */
proctype packetbuf_copyfrom() {
    byte from[PACKETBUF_SIZE];
    int ln = 50;  /* Example length */
    int l;

    atomic {
        if
        :: (packet_count >= MAX_PACKETS) ->
            error_overflow = true;
            goto done;
        :: else ->
            run packetbuf_clear();

            /* Determine copy length */
            if
            :: (ln <= PACKETBUF_SIZE) -> l = ln;
            :: else -> l = PACKETBUF_SIZE;
            fi;

            if
            :: (buflen + l > PACKETBUF_SIZE) ->
                error_overflow = true;
                goto done;
            :: else ->
                int i = 0;
                do
                :: (i < l) ->
                    packetbuf[i] = from[i];
                    i = i + 1;
                :: else -> break;
                od;
                buflen = l;
                packet_count++;
            fi;
        fi;
    done:
        skip;
    }
}

/* Copy To Destination with Safety Checks */
proctype packetbuf_copyto() {
    byte to[PACKETBUF_SIZE];
    int result;

    atomic {
        if
        :: (hdrlen + buflen > PACKETBUF_SIZE) ->
            error_overflow = true;
            result = 0;
        :: else ->
            int i = 0;
            /* Copy header */
            do
            :: (i < hdrlen) ->
                to[i] = packetbuf[i];
                i = i + 1;
            :: else -> break;
            od;

            /* Copy data */
            int j = 0;
            do
            :: (j < buflen) ->
                to[i] = packetbuf[hdrlen + j];
                i = i + 1;
                j = j + 1;
            :: else -> break;
            od;

            result = hdrlen + buflen;
        fi;
    }
}

/* Header Allocation with Overflow Prevention */
proctype packetbuf_hdralloc() {
    int size = 10;
    int result;

    atomic {
        int i;
        if
        :: (hdrlen + buflen + size > PACKETBUF_SIZE) ->
            error_overflow = true;
            result = 0;
        :: else ->
            /* Shift data to the right */
            i = hdrlen + buflen - 1;
            do
            :: (i >= 0) ->
                packetbuf[i + size] = packetbuf[i];
                i = i - 1;
            :: else -> break;
            od;

            hdrlen = hdrlen + size;
            result = 1;
        fi;
    }
}

/* Header Reduction */
proctype packetbuf_hdrreduce() {
    int size = 5;
    int result = 0;

    atomic {
        if
        :: (buflen >= size) ->
            bufptr = bufptr + size;
            buflen = buflen - size;
            result = 1;
        :: else ->
            result = 0;
        fi;
    }
}

/* Initialization Process */
init {
    atomic {
        run packetbuf_clear();
        run packetbuf_copyfrom();
        run packetbuf_copyto();
        run packetbuf_hdralloc();
        run packetbuf_hdrreduce();
    }
}

/* LTL Properties */
ltl packet_flow_safety {
    []((packet_count <= MAX_PACKETS) && (!error_overflow))
}

ltl buffer_size_invariant {
    [](buflen <= PACKETBUF_SIZE)
}

ltl no_continuous_overflow {
    [](!error_overflow)
}