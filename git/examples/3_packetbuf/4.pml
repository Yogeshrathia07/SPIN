/* Constants */
#define PACKETBUF_SIZE 128
#define PACKETBUF_NUM_ATTRS 8
#define PACKETBUF_NUM_ADDRS 2
#define PACKETBUF_ADDR_FIRST 2
#define PACKETBUF_ADDR_RECEIVER 2
#define MAX_HEADER_SIZE 32

/* Global variables */
byte packetbuf[PACKETBUF_SIZE];
short buflen = 0;
short bufptr = 0;
byte hdrlen = 0;

/* Structure to represent attributes */
typedef Attr {
  short val;
};

/* Structure to represent address */
typedef Addr {
  byte addr[8];  /* Simplified address representation */
};

/* Global arrays for attributes and addresses */
Attr packetbuf_attrs[PACKETBUF_NUM_ATTRS];
Addr packetbuf_addrs[PACKETBUF_NUM_ADDRS];
Addr linkaddr_null;

/* Properties to verify */
ltl buffer_size_valid { []((buflen + hdrlen) <= PACKETBUF_SIZE) }
ltl header_size_valid { [](hdrlen <= MAX_HEADER_SIZE) }

/* Helper inline functions */
inline linkaddr_copy(dst, src) {
  byte i;
  i = 0;
  do
  :: i < 8 -> 
     dst.addr[i] = src.addr[i];
     i++
  :: i >= 8 -> break
  od
}

inline linkaddr_cmp(addr1, addr2) {
  byte i;
  bool equal;
  i = 0;
  equal = true;
  do
  :: i < 8 ->
     if
     :: addr1.addr[i] != addr2.addr[i] -> equal = false
     :: else -> i++
     fi
  :: i >= 8 -> break
  od
}

/* Individual processes for each operation */
proctype packetbuf_clear() {
  byte i;
  do
  :: atomic {
       buflen = 0;
       bufptr = 0;
       hdrlen = 0;
       
       /* Clear attributes */
       i = 0;
       do
       :: i < PACKETBUF_NUM_ATTRS ->
          packetbuf_attrs[i].val = 0;
          i++
       :: i >= PACKETBUF_NUM_ATTRS -> break
       od;
       
       /* Clear addresses */
       i = 0;
       do
       :: i < PACKETBUF_NUM_ADDRS -> 
          linkaddr_copy(packetbuf_addrs[i], linkaddr_null);
          i++
       :: i >= PACKETBUF_NUM_ADDRS -> break
       od
     }
  od
}

proctype packetbuf_copyfrom() {
  byte data[PACKETBUF_SIZE];
  short len;
  byte i;
  do
  :: atomic {
       len = 0;
       do
       :: len <= PACKETBUF_SIZE ->
          i = 0;
          do
          :: i < len ->
             packetbuf[i] = data[i];
             i++
          :: i >= len -> break
          od;
          buflen = len;
          break
       :: else -> break
       od
     }
  od
}

proctype packetbuf_hdralloc() {
  short size;
  short i;
  do
  :: atomic {
       if
       :: (size + buflen + hdrlen) <= PACKETBUF_SIZE ->
          i = buflen + hdrlen - 1;
          do
          :: i >= 0 -> 
             packetbuf[i + size] = packetbuf[i];
             i = i - 1
          :: i < 0 -> break
          od;
          hdrlen = hdrlen + size
       :: else -> skip
       fi
     }
  od
}

proctype packetbuf_hdrreduce() {
  short size;
  do
  :: atomic {
       if
       :: buflen >= size ->
          bufptr = bufptr + size;
          buflen = buflen - size
       :: else -> skip
       fi
     }
  od
}

proctype packetbuf_set_attr() {
  byte type;
  short val;
  do
  :: atomic {
       if
       :: type < PACKETBUF_NUM_ATTRS ->
          packetbuf_attrs[type].val = val
       :: else -> skip
       fi
     }
  od
}

proctype packetbuf_attr() {
  byte type;
  short result;
  do
  :: atomic {
       if
       :: type < PACKETBUF_NUM_ATTRS ->
          result = packetbuf_attrs[type].val
       :: else -> skip
       fi
     }
  od
}

proctype packetbuf_set_addr() {
  byte type;
  Addr addr;
  do
  :: atomic {
       if
       :: (type >= PACKETBUF_ADDR_FIRST && 
           type < (PACKETBUF_ADDR_FIRST + PACKETBUF_NUM_ADDRS)) ->
          linkaddr_copy(packetbuf_addrs[type - PACKETBUF_ADDR_FIRST], addr)
       :: else -> skip
       fi
     }
  od
}

proctype packetbuf_addr() {
  byte type;
  Addr result;
  do
  :: atomic {
       if
       :: (type >= PACKETBUF_ADDR_FIRST && 
           type < (PACKETBUF_ADDR_FIRST + PACKETBUF_NUM_ADDRS)) ->
          linkaddr_copy(result, packetbuf_addrs[type - PACKETBUF_ADDR_FIRST])
       :: else -> skip
       fi
     }
  od
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