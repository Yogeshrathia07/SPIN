bool flag[2];  // Flag indicating if a process wants to enter critical section
byte turn = 0; // Turn variable to give preference to one of the processes
bool in_cs[2]; // Boolean array to track which process is in the critical section

active proctype P1() {
    do
    :: flag[0] = true;    // P1 wants to enter the critical section
       turn = 1;          // Give priority to P2
       atomic { !(flag[1] && turn == 1) }
       
       // ----------Critical Section----------
       in_cs[0] = true;   // P1 enters the critical section
       printf("P1 is in critical section\n");
       in_cs[0] = false;  // P1 leaves the critical section
       // ----------Exit Critical Section----------
       flag[0] = false;
    od
}

active proctype P2() {
    do
    :: flag[1] = true;    // P2 wants to enter the critical section
       turn = 0;          // Give priority to P1
       atomic { !(flag[0] && turn == 0) }
       // ----------Critical Section----------
       in_cs[1] = true;   // P2 enters the critical section
       printf("P2 is in critical section\n");
       in_cs[1] = false;  // P2 leaves the critical section
       // ----------Exit Critical Section----------
       flag[1] = false;
    od
}

// LTL property to check mutual exclusion
ltl mutual_exclusion { [] ! (in_cs[0] && in_cs[1]) }
