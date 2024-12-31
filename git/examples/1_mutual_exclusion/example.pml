// Filename: example.pml

mtype = { msg1, msg2, err }; // Message types
chan channel1 = [0] of { mtype }; // Channel for communication

active proctype P1() {
    // State S1: P1 sends msg1
    channel1!msg1; 
    printf("P1: sent msg1.\n");
    
    // State S2: P1 waits for response
    if
    :: channel1?msg2 -> printf("P1: received msg2.\n")
    :: channel1?err -> printf("P1: received error.\n")
    fi;
    
    // End of P1 process
    printf("P1: finished execution.\n");
}

active proctype P2() {
    // Initial state
    channel1!msg2; 
    printf("P2: sent msg2.\n");
    
    // State S1: P2 waits for msg1
    if
    :: channel1?msg1 -> printf("P2: received msg1.\n")
    :: channel1?err -> printf("P2: received error.\n")
    fi;
    
    // End of P2 process
    printf("P2: finished execution.\n");
}
