/* Promela model for packet buffer verification */

/* Constants */
#define PACKETBUF_SIZE 128
#define PACKETBUF_NUM_ATTRS 8
#define PACKETBUF_NUM_ADDRS 2
#define PACKETBUF_ADDR_FIRST 2
#define MIN(a,b) ((a) < (b) ? (a) : (b))

/* Type definitions */
typedef PacketBufAttr {
  int val;
};

typedef PacketBufAddr {
  byte addr[2]; /* Simplified address representation */
};

/* Global variables */
byte packetbuf[PACKETBUF_SIZE];
PacketBufAttr packetbuf_attrs[PACKETBUF_NUM_ATTRS];
PacketBufAddr packetbuf_addrs[PACKETBUF_NUM_ADDRS];
int buflen = 0;
int bufptr = 0;
int hdrlen = 0;

/* Helper inline functions */
inline packetbuf_clear() {
  atomic {
    buflen = 0;
    bufptr = 0;
    hdrlen = 0;
    /* Clear attributes */
    int i;
    for(i : 0 .. PACKETBUF_NUM_ATTRS-1) {
      packetbuf_attrs[i].val = 0;
    }
    /* Clear addresses */
    for(i : 0 .. PACKETBUF_NUM_ADDRS-1) {
      packetbuf_addrs[i].addr[0] = 0;
      packetbuf_addrs[i].addr[1] = 0;
    }
  }
}

inline packetbuf_copyfrom(from, lena) {
  atomic {
    packetbuf_clear();
    int l = MIN(PACKETBUF_SIZE, lena);
    /* Simplified memcpy */
    int i;
    for(i : 0 .. l-1) {
      packetbuf[i] = from[i];
    }
    buflen = l;
  }
}

inline packetbuf_hdralloc(size) {
  atomic {
    if
    :: (size + buflen + hdrlen <= PACKETBUF_SIZE) ->
       /* Shift data right */
       int i;
       for(i : buflen-1 .. 0) {
         packetbuf[i + size] = packetbuf[i];
       }
       hdrlen = hdrlen + size;
       return 1;
    :: else -> 
       return 0;
    fi;
  }
}

inline packetbuf_set_attr(type, val) {
  atomic {
    assert(type >= 0 && type < PACKETBUF_NUM_ATTRS);
    packetbuf_attrs[type].val = val;
  }
}

inline packetbuf_get_attr(type) {
  atomic {
    assert(type >= 0 && type < PACKETBUF_NUM_ATTRS);
    return packetbuf_attrs[type].val;
  }
}

/* Safety properties */
ltl buffer_size_check {
  []((buflen + hdrlen) <= PACKETBUF_SIZE)
}

ltl buffer_consistency {
  [](buflen >= 0 && hdrlen >= 0 && bufptr >= 0)
}

/* Example process showing usage */
active proctype packet_handler() {
  byte data[10];
  int result;
  
  /* Test packet buffer operations */
  packetbuf_clear();
  assert(buflen == 0 && hdrlen == 0);
  
  packetbuf_copyfrom(data, 5);
  assert(buflen == 5);
  
  result = packetbuf_hdralloc(3);
  assert(result == 1);
  assert(hdrlen == 3);
  
  packetbuf_set_attr(0, 42);
  assert(packetbuf_get_attr(0) == 42);
}