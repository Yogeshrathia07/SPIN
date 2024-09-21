// spin -p -replay 3.pml
bool flag[2];  // Boolean flags
bool turn;     // Shared variable
int cnt = 0;   // Global counter

active [2] proctype user() {
  flag[_pid] = true;
  turn = _pid;
//   (flag[1-_pid] == false || turn == 1-_pid);
//   (flag[1-_pid] == false );
  
  cnt++;              // Increment before entering critical section
  assert(cnt == 1);   // Assert that only one process is in the critical section
  crit: skip;         // Critical section
  cnt--;              // Decrement after leaving the critical section
  
  flag[_pid] = false;
}

ltl p1 { []( !(cnt > 1) ) }