#define PACKETBUF_SIZE 128
#define PACKETBUF_NUM_ATTRS 8
#define PACKETBUF_NUM_ADDRS 2
#define PACKETBUF_ADDR_FIRST 2

/* Type definitions */
typedef PacketBufAttr {
    int val
};

typedef PacketBufAddr {
    byte addr[2]
};

/* Global variables */
byte packetbuf[PACKETBUF_SIZE];
PacketBufAttr packetbuf_attrs[PACKETBUF_NUM_ATTRS];
PacketBufAddr packetbuf_addrs[PACKETBUF_NUM_ADDRS];
int buflen = 0;
int bufptr = 0;
int hdrlen = 0;

ltl buffer_size_check { []((buflen + hdrlen) <= PACKETBUF_SIZE) }
ltl buffer_consistency { [](buflen >= 0 && hdrlen >= 0 && bufptr >= 0) }

proctype packetbuf_clear() {
    atomic {
        buflen = 0;
        bufptr = 0;
        hdrlen = 0;
        int i = 0;
        do
        :: i < PACKETBUF_NUM_ATTRS ->
            packetbuf_attrs[i].val = 0;
            i++
        :: else -> break
        od;
        
        i = 0;
        do
        :: i < PACKETBUF_NUM_ADDRS ->
            packetbuf_addrs[i].addr[0] = 0;
            packetbuf_addrs[i].addr[1] = 0;
            i++
        :: else -> break
        od
    }
}


proctype packetbuf_copyfrom() {
    atomic {
        int length;
       length=10;

        int l;
        buflen = 0;

        if
        :: (PACKETBUF_SIZE <length) -> 
            l = PACKETBUF_SIZE;
        :: else -> 
            l =length;
        fi;

        int i = 0;
        do
        :: (i < l) -> 
            packetbuf[i] = 0;
            i++;
        :: (i >= l) -> 
            break;
        od;


        buflen = l;
    }
}


proctype packetbuf_hdralloc() {
    atomic {
        int size = 5; /* Example size */
        if
        :: (size + buflen + hdrlen <= PACKETBUF_SIZE) ->
            int i = buflen - 1;
            do
            :: i >= 0 ->
                packetbuf[i + size] = packetbuf[i];
                i--
            :: else -> break
            od;
            hdrlen = hdrlen + size
        :: else -> skip
        fi
    }
}

proctype packetbuf_hdrreduce() {
    atomic {
        int size = 3;
        if
        :: (buflen >= size) ->
            bufptr = bufptr + size;
            buflen = buflen - size
        :: else -> skip
        fi
    }
}

proctype packetbuf_set_attr() {
    atomic {
        int type = 0;
        int val = 42;
        if
        :: (type >= 0 && type < PACKETBUF_NUM_ATTRS) ->
            packetbuf_attrs[type].val = val
        :: else -> skip
        fi
    }
}

proctype packetbuf_attr() {
    atomic {
        int type = 0;
        if
        :: (type >= 0 && type < PACKETBUF_NUM_ATTRS) ->
            int val = packetbuf_attrs[type].val;
            assert(val >= 0)
        :: else -> skip
        fi
    }
}

proctype packetbuf_set_addr() {
    atomic {
        int type = PACKETBUF_ADDR_FIRST;
        if
        :: (type >= PACKETBUF_ADDR_FIRST && type < PACKETBUF_ADDR_FIRST + PACKETBUF_NUM_ADDRS) ->
            packetbuf_addrs[type - PACKETBUF_ADDR_FIRST].addr[0] = 1;
            packetbuf_addrs[type - PACKETBUF_ADDR_FIRST].addr[1] = 1
        :: else -> skip
        fi
    }
}

proctype packetbuf_addr() {
    atomic {
        int type = PACKETBUF_ADDR_FIRST;
        if
        :: (type >= PACKETBUF_ADDR_FIRST && type < PACKETBUF_ADDR_FIRST + PACKETBUF_NUM_ADDRS) ->
            assert(type - PACKETBUF_ADDR_FIRST >= 0)
        :: else -> skip
        fi
    }
}

init {
    atomic {
        /* Initialize */
        buflen = 0;
        bufptr = 0;
        hdrlen = 0;
        
        /* Run all processes */
        run packetbuf_clear();
        run packetbuf_copyfrom();
        run packetbuf_hdralloc();
        run packetbuf_hdrreduce();
        run packetbuf_set_attr();
        run packetbuf_attr();
        run packetbuf_set_addr();
        run packetbuf_addr()
    }
}
