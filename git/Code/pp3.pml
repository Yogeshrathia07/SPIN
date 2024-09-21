mtype = { msg1, msg2 };   // Define message types

chan a2b = [0] of { mtype };   // Channel from A to B
chan b2a = [0] of { mtype };   // Channel from B to A

proctype A() {
    printf("Process A: Sending msg1 to B\n");
    a2b!msg1;   // A sends msg1 to B
    printf("Process A: Waiting for msg2 from B\n");
    b2a?msg2;   // A receives msg2 from B
    printf("Process A: Received msg2 from B\n");
}

proctype B() {
    printf("Process B: Waiting for msg1 from A\n");
    a2b?msg1;   // B receives msg1 from A
    printf("Process B: Received msg1 from A\n");
    printf("Process B: Sending msg2 to A\n");
    b2a!msg2;   // B sends msg2 to A
}

init {
    run A();   // Start process A
    run B();   // Start process B
}
