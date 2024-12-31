#!/bin/bash

# MODEL="10_3.pml"

# # Translate Promela model to C verifier
# spin -a $MODEL

# # Compile the verifier
# gcc -o pan pan.c

# # Run the verifier with options
# ./pan -n  # Non-progress cycle detection
# ./pan -f  # Fairness
# ./pan -a  # Basic checks
# ./pan -m10000 -w32  # Limited search
# ./pan -E  # Exhaustive testing

# # Analyze state space
# spin -t $MODEL



spin -a 10_4.pml
gcc -o pan pan.c
./pan