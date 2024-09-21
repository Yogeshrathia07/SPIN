mtype = { a0, a1, b0, b1, err } // Message types

chan a2b = [0] of { mtype }	// A to B channel
chan b2a = [0] of { mtype }	// B to A channel

active proctype A()
{
    S1: a2b!a1 -> printf("A: Sent 'a1'\n")
    
    S2: if
        :: b2a?b1 -> printf("A: Received 'b1'\n") -> goto S1
        :: b2a?b0 -> printf("A: Received 'b0'\n") -> goto S3  //nr
        :: b2a?err -> printf("A: Received 'err'\n") -> goto S5 // nr
    fi

    S3: a2b!a1 -> printf("A: Sent 'a1' (after b0)\n") -> goto S2 //nr
    
    S4: b2a?err -> printf("A: Received 'err' in S4\n") -> goto S5 // nr
    
    S5: a2b!a0 -> printf("A: Sent 'a0'\n") -> goto S4 // nr
}

active proctype B()
{
    goto S2
    S1: b2a!b1 -> printf("B: Sent 'b1'\n")
    
    S2: if
        :: a2b?a0 -> printf("B: Received 'a0'\n") -> goto S3 //nr
        :: a2b?a1 -> printf("B: Received 'a1'\n") -> goto S1    
        :: a2b?err -> printf("B: Received 'err'\n") -> goto S5  //nr
    fi

    S3: b2a!b0 -> printf("B: Sent 'b0'\n") -> goto S2   //nr
    
    S4: a2b?_ -> printf("B: Received message in S4\n") -> goto S1 //nr
    
    S5: b2a!b0 -> printf("B: Sent 'b0' in error state\n") -> goto S4 //nr
}
