/* Promela model for packet buffer verification */

/* Constants */
#define PACKETBUF_SIZE 128
#define PACKETBUF_NUM_ATTRS 8
#define PACKETBUF_NUM_ADDRS 2
#define PACKETBUF_ADDR_FIRST 2

/* Type definitions */
typedef PacketBufAttr {
  int val
};

typedef PacketBufAddr {
  byte addr[2] /* Simplified address representation */
};

/* Global variables */
byte packetbuf[PACKETBUF_SIZE];
PacketBufAttr packetbuf_attrs[PACKETBUF_NUM_ATTRS];
PacketBufAddr packetbuf_addrs[PACKETBUF_NUM_ADDRS];
int buflen;
int bufptr;
int hdrlen;

/* Properties */
ltl buffer_size_check { []((buflen + hdrlen) <= PACKETBUF_SIZE) }
ltl buffer_consistency { [](buflen >= 0 && hdrlen >= 0 && bufptr >= 0) }

/* Processes for different functionalities */
proctype func1() {
    atomic {
        buflen = 0;
        bufptr = 0;
        hdrlen = 0;
        int i = 0;
        do
        :: i < PACKETBUF_NUM_ATTRS ->
            packetbuf_attrs[i].val = 0;
            i++
        :: i >= PACKETBUF_NUM_ATTRS ->
            break
        od
    }
}

proctype func2() {
    atomic {
        int i = 0;
        do
        :: i < PACKETBUF_NUM_ADDRS ->
            packetbuf_addrs[i].addr[0] = 0;
            packetbuf_addrs[i].addr[1] = 0;
            i++
        :: i >= PACKETBUF_NUM_ADDRS ->
            break
        od
    }
}

proctype func3() {
    atomic {
        int size = 5; /* Example size */
        if
        :: (size + buflen + hdrlen <= PACKETBUF_SIZE) ->
            int i = buflen - 1;
            do
            :: i >= 0 ->
                packetbuf[i + size] = packetbuf[i];
                i--
            :: i < 0 ->
                break
            od;
            hdrlen = hdrlen + size
        :: else -> 
            skip
        fi
    }
}

proctype func4() {
    atomic {
        int type = 0;
        int val = 42;
        if
        :: (type >= 0 && type < PACKETBUF_NUM_ATTRS) ->
            packetbuf_attrs[type].val = val
        :: else ->
            skip
        fi
    }
}

proctype func5() {
    atomic {
        int type = 0;
        if
        :: (type >= 0 && type < PACKETBUF_NUM_ATTRS) ->
            int val = packetbuf_attrs[type].val;
            assert(val >= 0)
        :: else ->
            skip
        fi
    }
}

init {
    atomic {
        buflen = 0;
        bufptr = 0;
        hdrlen = 0;
        run func1();
        run func2();
        run func3();
        run func4();
        run func5()
    }
}