/* Comprehensive Packet Buffer Verification Model */
#define PACKETBUF_SIZE 128
#define PACKETBUF_NUM_ATTRS 16
#define PACKETBUF_NUM_ADDRS 8

/* Global state tracking */
bool copy_initiated = false;
bool header_allocated = false;
bool copy_completed = false;
bool header_reduced = false;
bool error_detected = false;

/* State Exploration Enhancement */
short operation_sequence = 0;
short max_sequence_depth = 5;

/* Type Definitions */
typedef Attribute {
    int val;
}

typedef Address {
    int addr;
    bool is_null;
}

/* Global variables */
byte packetbuf[PACKETBUF_SIZE];
int buflen = 0;
int bufptr = 0;
int hdrlen = 0;

Attribute packetbuf_attrs[PACKETBUF_NUM_ATTRS];
Address packetbuf_addrs[PACKETBUF_NUM_ADDRS];

/* LTL Properties */
ltl p1 { [] (buflen <= PACKETBUF_SIZE) }
ltl p2 { (copy_initiated) -> (<> copy_completed) }
ltl p3 { [] ((copy_initiated && !header_allocated) -> (!copy_completed)) }
ltl p4 { [] (!error_detected) }
ltl p5 { [] ((header_reduced) -> (hdrlen < PACKETBUF_SIZE)) }

/* Enhanced Operation Sequences */
inline reset_state() {
    copy_initiated = false;
    header_allocated = false;
    copy_completed = false;
    header_reduced = false;
    error_detected = false;
    operation_sequence = 0;
}

inline safe_copy_from(from, ln) {
    atomic {
        if 
        :: (operation_sequence < max_sequence_depth) ->
            copy_initiated = true;
            
            int l = (ln <= PACKETBUF_SIZE) -> ln : PACKETBUF_SIZE;
            
            for (int i : 0 .. l - 1) {
                packetbuf[i] = from[i];
            }
            buflen = l;
            
            if 
            :: (buflen > PACKETBUF_SIZE) -> error_detected = true;
            :: else -> skip;
            fi;
            
            copy_completed = true;
            operation_sequence++;
        :: else -> skip;
        fi;
    }
}

inline safe_header_alloc(size) {
    atomic {
        if 
        :: (operation_sequence < max_sequence_depth) ->
            header_allocated = true;
            
            if 
            :: (hdrlen + buflen + size > PACKETBUF_SIZE) -> 
                error_detected = true;
            :: else ->
                for (int i : hdrlen + buflen - 1 .. 0) {
                    packetbuf[i + size] = packetbuf[i];
                }
                hdrlen = hdrlen + size;
            fi;
            
            operation_sequence++;
        :: else -> skip;
        fi;
    }
}

inline safe_header_reduce(size) {
    atomic {
        if 
        :: (operation_sequence < max_sequence_depth) ->
            if 
            :: (buflen >= size) ->
                bufptr = bufptr + size;
                buflen = buflen - size;
                header_reduced = true;
            :: else ->
                error_detected = true;
            fi;
            
            operation_sequence++;
        :: else -> skip;
        fi;
    }
}

/* Multiple Verification Processes */
active [3] proctype PacketBufferVerification() {
    byte source[PACKETBUF_SIZE];
    byte destination[PACKETBUF_SIZE];
    
    /* Initialize source with different patterns */
    for (int i : 0 .. PACKETBUF_SIZE - 1) {
        source[i] = (byte)(i * (_pid + 1));
    }
    
    /* Comprehensive Exploration Scenarios */
    do
    :: reset_state();
       safe_copy_from(source, PACKETBUF_SIZE/2);
       safe_header_alloc(10);
       safe_header_reduce(5);
       
       /* Randomize further operations */
       if 
       :: safe_copy_from(destination, 20);
       :: safe_header_alloc(15);
       :: safe_header_reduce(3);
       :: skip;
       fi;
       
       /* Break or continue based on sequence depth */
       if 
       :: (operation_sequence >= max_sequence_depth) -> break;
       :: else -> continue;
       fi;
    od;
}