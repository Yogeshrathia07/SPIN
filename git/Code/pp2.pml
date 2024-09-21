mtype = { a0, a1, b0, b1, err }  // Message types
byte dataA, dataB                // Data fields for messages from A and B

chan a2b = [0] of { mtype, byte }  // Channel from A to B, including a byte for data
chan b2a = [0] of { mtype, byte }  // Channel from B to A, including a byte for data

active proctype A() {
    byte seq = 1                 // Sequence number for messages
    dataA = 78                   // Example data A is sending

    S1: if
        :: a2b!a1, dataA         // Correct transmission
        :: a2b!err, dataA        // Message corruption (error simulation)
       fi

    S2: if
        :: b2a?b1, dataB -> goto S1   // Correct acknowledgment
        :: b2a?b0, dataB -> goto S3   // Different acknowledgment (error)
        :: b2a?err, dataB -> goto S5  // Error handling
       fi

    S3: a2b!a1, dataA -> goto S2      // Retry after receiving a different acknowledgment

    S4: b2a?err, dataB -> goto S5     // Error handling

    S5: a2b!a0, dataA -> goto S4      // Send an alternative message after error
}

active proctype B() {
    dataB = 45                        // Example data B is sending
    goto S2

    S1: if
        :: b2a!b1, dataB              // Correct acknowledgment
        :: b2a!err, dataB             // Simulate error in acknowledgment
       fi

    S2: if
        :: a2b?a0, dataA -> goto S3   // Correct message reception
        :: a2b?a1, dataA -> goto S1   // Correct message reception (retry)
        :: a2b?err, dataA -> goto S5  // Error handling
       fi

    S3: b2a!b0, dataB -> goto S2      // Respond with acknowledgment

    S4: a2b?_ -> goto S1              // Ignore any message and retry

    S5: b2a!b0, dataB -> goto S4      // Send acknowledgment after error
}
