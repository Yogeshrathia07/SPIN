/* Detailed Promela Model for Packet Buffer Management */

#define PACKETBUF_SIZE 128
#define PACKETBUF_NUM_ATTRS 16
#define PACKETBUF_NUM_ADDRS 8

/* Enum-like definitions for attribute and address types */
#define PACKETBUF_ATTR_FIRST 0
#define PACKETBUF_ADDR_FIRST 0
#define PACKETBUF_ADDR_RECEIVER 1

/* Packet buffer state structure */
typedef PacketBuffer {
    byte buffer[PACKETBUF_SIZE];  /* Actual packet data */
    int buflen;                   /* Current data length */
    int bufptr;                   /* Current buffer pointer */
    int hdrlen;                   /* Header length */
}

/* Attribute structure */
typedef Attribute {
    int val;
}

/* Address structure */
typedef Address {
    int addr;  /* Simplified address representation */
    bool is_null;  /* Flag to represent null address */
}

/* Global variables */
PacketBuffer packetbuf;
Attribute packetbuf_attrs[PACKETBUF_NUM_ATTRS];
Address packetbuf_addrs[PACKETBUF_NUM_ADDRS];

/* Utility process for packet buffer operations */
proctype PacketBufferUtilities() {
    /* Temporary variables for operations */
    int temp_val, temp_size, temp_addr;
    int result;

    /* Function: packetbuf_clear */
    proc_packetbuf_clear:
        atomic {
            int i;
            packetbuf.buflen = 0;
            packetbuf.bufptr = 0;
            packetbuf.hdrlen = 0;
            
            /* Clear attributes */
            for (int i = 0; i < PACKETBUF_NUM_ATTRS; i++) {
                packetbuf_attrs[i].val = 0;
            }

            /* Clear addresses */
            for (int i = 0; i < PACKETBUF_NUM_ADDRS; i++) {
                packetbuf_addrs[i].addr = 0;
                packetbuf_addrs[i].is_null = 1;
            }
            goto choose_operation;
        }





    /* Function: packetbuf_copyfrom */
    proc_packetbuf_copyfrom:
        atomic {
            /* Ensure size doesn't exceed buffer */
            temp_size = (temp_size > PACKETBUF_SIZE) -> PACKETBUF_SIZE : temp_size;
            
            /* Clear buffer first */
            packetbuf.buflen = 0;
            packetbuf.bufptr = 0;
            packetbuf.hdrlen = 0;
            
            /* Simulate copy */
            packetbuf.buflen = temp_size;
            result = temp_size;
            goto choose_operation;
        }

    /* Function: packetbuf_copyto */
    proc_packetbuf_copyto:
        atomic {
            result = 0;
            if
            :: (packetbuf.hdrlen + packetbuf.buflen <= PACKETBUF_SIZE) ->
                result = packetbuf.hdrlen + packetbuf.buflen;
            :: else ->
                skip;
            fi
            goto choose_operation;
        }

    /* Function: packetbuf_hdralloc */
    proc_packetbuf_hdralloc:
        atomic {
            result = 0;
            if
            :: (packetbuf.hdrlen + packetbuf.buflen + temp_size <= PACKETBUF_SIZE) ->
                packetbuf.hdrlen = packetbuf.hdrlen + temp_size;
                result = 1;
            :: else ->
                skip;
            fi
            goto choose_operation;
        }

    /* Function: packetbuf_hdrreduce */
    proc_packetbuf_hdrreduce:
        atomic {
            result = 0;
            if
            :: (packetbuf.buflen >= temp_size) ->
                packetbuf.bufptr = packetbuf.bufptr + temp_size;
                packetbuf.buflen = packetbuf.buflen - temp_size;
                result = 1;
            :: else ->
                skip;
            fi
            goto choose_operation;
        }

    /* Function: packetbuf_set_attr */
    proc_packetbuf_set_attr:
        atomic {
            packetbuf_attrs[temp_val].val = temp_addr;
            goto choose_operation;
        }

    /* Function: packetbuf_set_addr */
    proc_packetbuf_set_addr:
        atomic {
            int index = temp_val - PACKETBUF_ADDR_FIRST;
            packetbuf_addrs[index].addr = temp_addr;
            packetbuf_addrs[index].is_null = (temp_addr == 0);
            goto choose_operation;
        }

    /* Choose operation */
    choose_operation:
        if
        :: goto proc_packetbuf_clear;
        :: goto proc_packetbuf_copyfrom;
        :: goto proc_packetbuf_copyto;
        :: goto proc_packetbuf_hdralloc;
        :: goto proc_packetbuf_hdrreduce;
        :: goto proc_packetbuf_set_attr;
        :: goto proc_packetbuf_set_addr;
        fi
}

/* Init process to start the utilities */
init {
    run PacketBufferUtilities();
}

/* Verification properties */
ltl BufferSizeInvariant {
    [] (packetbuf.buflen + packetbuf.hdrlen <= PACKETBUF_SIZE)
}

ltl PositiveLengths {
    [] (packetbuf.buflen >= 0 && packetbuf.hdrlen >= 0)
}