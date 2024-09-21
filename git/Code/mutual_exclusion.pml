bool flag0 = false;
bool flag1 = false;
int turn = 0;

active proctype P0() {
    do
    :: flag0 = true;
       turn = 1;
       (flag1 == false || turn == 0);  // wait until P1 finishes or it's P0's turn
       /* critical section */
       printf("P0 in critical section\n");
       flag0 = false;
       /* non-critical section */
    od
}

active proctype P1() {
    do
    :: flag1 = true;
       turn = 0;
       (flag0 == false || turn == 1);  // wait until P0 finishes or it's P1's turn
       /* critical section */
       printf("P1 in critical section\n");
       flag1 = false;
       /* non-critical section */
    od
}

ltl p1 { [] ! (flag0 && flag1) }
