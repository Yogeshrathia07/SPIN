#define true   1
#define false  0
#define Aturn  false
#define Bturn  true

bool x, y, t;  // Global variables for mutual exclusion
byte state = 1;  // Shared global variable

proctype A() {
    byte tmp;  // Local variable for process A
    x = true;
    t = Bturn;
    (y == false || t == Aturn);  // Wait until it's safe to enter the critical section

    /* Critical Section Start */
    tmp = state;  
    tmp = tmp + 1;  // Increment the value of state
    state = tmp;
    printf("Process A: state = %d\n", state);
    /* Critical Section End */
    
    x = false;  // Release the lock
}

proctype B() {
    byte tmp;  // Local variable for process B
    y = true;
    t = Aturn;
    (x == false || t == Bturn);  // Wait until it's safe to enter the critical section

    /* Critical Section Start */
    tmp = state;  
    tmp = tmp - 1;  // Decrement the value of state
    state = tmp;
    printf("Process B: state = %d\n", state);
    /* Critical Section End */
    
    y = false;  // Release the lock
}

init {
    printf("Call1");
    run A();  // Instantiate process A
    printf("Call2");
    run B();  // Instantiate process B
    printf("Call3");
}
