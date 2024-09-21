mtype = { a0, a1, b0, b1, err } // Define message types

chan a2b = [0] of { mtype } // Rendezvous channel from A to B
chan b2a = [0] of { mtype } // Rendezvous channel from B to A

active proctype A()
{
S1: if
       :: a2b!a1    // correct transmission
       :: a2b!err   // simulate message corruption
    fi
S2: if
       :: b2a?b1  -> goto S1
       :: b2a?b0  -> goto S3
       :: b2a?err -> goto S5
    fi
S3: if
       :: a2b!a1   // correct transmission
       :: a2b!err  // simulate message corruption
    fi
    goto S2
S4: b2a?err -> goto S5
S5: if
       :: a2b!a0   // correct transmission
       :: a2b!err  // simulate message corruption
    fi
    goto S4
}

active proctype B()
{
goto S2
S1: if
       :: b2a!b1   // correct transmission
       :: b2a!err  // simulate message corruption
    fi
S2: if
       :: a2b?a0  -> goto S3
       :: a2b?a1  -> goto S1
       :: a2b?err -> goto S5
    fi
S3: if
       :: b2a!b0   // correct transmission
       :: b2a!err  // simulate message corruption
    fi
    goto S2
S4: a2b?_  -> goto S1
S5: if
       :: b2a!b0   // correct transmission
       :: b2a!err  // simulate message corruption
    fi
    goto S4
}
