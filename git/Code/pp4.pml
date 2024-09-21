mtype = { a0, a1, b0, b1, err }  // Message types
byte dataA, dataB                // Data fields for messages from A and B

chan a2b = [0] of { mtype, byte }  // Channel from A to B, including a byte for data
chan b2a = [0] of { mtype, byte }  // Channel from B to A, including a byte for data

active proctype A() {
    byte seq = 1                 // Sequence number for messages
    dataA = 78                   // Example data A is sending

    S1: if
        :: a2b!a1, dataA         // Correct transmission
            printf("A: Sending message a1 with data %d\n", dataA);
        :: a2b!err, dataA        // Message corruption (error simulation)
            printf("A: Sending error message with data %d\n", dataA);
       fi

    S2: if
        :: b2a?b1, dataB -> goto S1   // Correct acknowledgment
            printf("A: Received acknowledgment b1 with data %d\n", dataB);
        :: b2a?b0, dataB -> goto S3   // Different acknowledgment (error)
            printf("A: Received acknowledgment b0 with data %d\n", dataB);
        :: b2a?err, dataB -> goto S5  // Error handling
            printf("A: Received error acknowledgment with data %d\n", dataB);
       fi

    S3: a2b!a1, dataA -> goto S2      // Retry after receiving a different acknowledgment
        printf("A: Retrying message a1 with data %d\n", dataA);

    S4: b2a?err, dataB -> goto S5     // Error handling
        printf("A: Handling error acknowledgment with data %d\n", dataB);

    S5: a2b!a0, dataA -> goto S4      // Send an alternative message after error
        printf("A: Sending alternative message a0 with data %d\n", dataA);
}

active proctype B() {
    dataB = 45                        // Example data B is sending
    goto S2

    S1: if
        :: b2a!b1, dataB              // Correct acknowledgment
            printf("B: Sending acknowledgment b1 with data %d\n", dataB);
        :: b2a!err, dataB             // Simulate error in acknowledgment
            printf("B: Sending error acknowledgment with data %d\n", dataB);
       fi

    S2: if
        :: a2b?a0, dataA -> goto S3   // Correct message reception
            printf("B: Received message a0 with data %d\n", dataA);
        :: a2b?a1, dataA -> goto S1   // Correct message reception (retry)
            printf("B: Received message a1 with data %d\n", dataA);
        :: a2b?err, dataA -> goto S5  // Error handling
            printf("B: Received error message with data %d\n", dataA);
       fi

    S3: b2a!b0, dataB -> goto S2      // Respond with acknowledgment
        printf("B: Sending acknowledgment b0 with data %d\n", dataB);

    S4: a2b?_ -> goto S1              // Ignore any message and retry
        printf("B: Ignoring message and retrying\n");

    S5: b2a!b0, dataB -> goto S4      // Send acknowledgment after error
        printf("B: Sending acknowledgment b0 after error with data %d\n", dataB);
}
