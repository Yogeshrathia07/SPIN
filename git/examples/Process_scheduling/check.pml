// spin -search -l -f check.pml
// -l: This flag tells Spin to look for non-progress cycles. 
// -f: This option restricts the search to fair loops, meaning that it considers only those executions that follow the normal process scheduling rules,
mtype = { Wakeme, Running }   // file ex_5.pml
bit lk, sleep_q;
bit r_lock, r_want;
mtype State = Running;

active proctype client()
{
    sleep:                          // sleep routine
        printf("Client: Entering sleep routine\n");
        atomic { (lk == 0) -> lk = 1 } // spinlock(&lk)
        printf("Client: Acquired spinlock (lk = 1)\n");
        
        do                          // while r->lock
        :: (r_lock == 1) ->         // r->lock == 1
            r_want = 1;
            State = Wakeme;
            lk = 0;                 // freelock(&lk)
            printf("Client: Resource is locked. Going to sleep (State = Wakeme, lk = 0)\n");
            (State == Running);     // wait for wakeup
            printf("Client: Woken up! (State = Running)\n");
        :: else ->                  // r->lock == 0
            printf("Client: Resource is free (r_lock == 0). Exiting sleep routine\n");
            break;
        od;
    
    progress:
        printf("Client: In progress section\n");
        assert(r_lock == 0);        // should still be true
        printf("Client: Resource is free (assert r_lock == 0)\n");
        r_lock = 1;                 // consumed resource
        printf("Client: Consumed resource (r_lock = 1)\n");
        lk = 0;                     // freelock(&lk)
        printf("Client: Released spinlock (lk = 0)\n");
        goto sleep;
}

active proctype server()             // interrupt routine
{
    wakeup:                          // wakeup routine
        printf("Server: Entering wakeup routine\n");
        r_lock = 0;                  // r->lock = 0
        printf("Server: Released resource lock (r_lock = 0)\n");
        (lk == 0);                   // waitlock(&lk)
        printf("Server: Checking spinlock (lk == 0) : %d \n",lk);
        
        if
        :: r_want ->                 // someone is sleeping
            atomic { (sleep_q == 0) -> sleep_q = 1 }
            r_want = 0;
            printf("Server: Waking up client (r_want = 0, sleep_q = 1)\n");
            
            #ifdef PROPOSED_FIX
            (lk == 0);               // waitlock(&lk)
            printf("Server: Rechecking spinlock (lk == 0) after fix\n");
            #endif

            if
            :: (State == Wakeme) ->
                State = Running;
                printf("Server: Changed client state to Running\n");
            :: else ->
                printf("Server: Client state is already Running\n");
            fi;

            sleep_q = 0;
            printf("Server: Released sleep queue lock (sleep_q = 0)\n");
        :: else ->
            printf("Server: No client to wake up\n");
        fi;
        
        goto wakeup;
}
