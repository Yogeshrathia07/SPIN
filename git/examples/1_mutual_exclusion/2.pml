bool flag[2];
bool turn;
int cnt = 0;   // global counter to track processes in the critical section

active [2] proctype user() {
    flag[_pid] = true;
    turn = _pid;
    (flag[1-_pid] == false || turn == 1-_pid);
    
    cnt++;            // Increment before entering critical section
    cnt--;            // Decrement after leaving critical section
    
    flag[_pid] = false;
}
ltl ck {[] (!(cnt==2))}
