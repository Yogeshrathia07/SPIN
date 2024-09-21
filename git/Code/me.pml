bool flag[2]; // flag[0] for process P0, flag[1] for process P1
bool turn;    // turn variable to decide which process enters critical section

proctype P0() {
    do
    :: flag[0] = true;
       turn = 1;
       (flag[1] == false && turn == 1); // wait until P1 finishes or it's P0's turn
       /* critical section */
       printf("P0 in critical section\n");
       flag[0] = false;
    od
}

proctype P1() {
    do
    :: flag[1] = true;
       turn = 0;
       (flag[0] == false && turn == 0); // wait until P0 finishes or it's P1's turn
       /* critical section */
       printf("P1 in critical section\n");
       flag[1] = false;
    od
}

init {
    run P0();
    run P1();
}

ltl p1 { [] !(flag[0] && flag[1]) }
