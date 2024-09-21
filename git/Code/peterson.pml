bool flag[2];  // Indicates whether a process wants to enter the critical section
byte turn = 0; // Whose turn it is to enter the critical section

bool in_cs[2]; // To track if P1 or P2 is in critical section

active proctype P1() {
    do
    :: flag[0] = true;  // P1 wants to enter critical section
       turn = 1;        // Give priority to P2
       // Wait until either P2 doesn't want to enter or it's not P2's turn
       atomic { !flag[1] || turn == 0 }

       // Critical Section
       in_cs[0] = true; // P1 enters critical section
       printf("P1 is in critical section\n");
       // Exit critical section

       in_cs[0] = false; // P1 leaves critical section
       flag[0] = false;
    od
}

active proctype P2() {
    do
    :: flag[1] = true;  // P2 wants to enter critical section
       turn = 0;        // Give priority to P1
       // Wait until either P1 doesn't want to enter or it's not P1's turn
       atomic { !flag[0] || turn == 1 }

       // Critical Section
       in_cs[1] = true; // P2 enters critical section
       printf("P2 is in critical section\n");

       // Exit critical section
       in_cs[1] = false; // P2 leaves critical section
       flag[1] = false;
    od
}

// LTL property to check mutual exclusion
ltl mutual_exclusion { [] (! (in_cs[0] && in_cs[1] )) }
