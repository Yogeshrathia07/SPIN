#!/bin/bash

# Filename
FILENAME="final.pml"

# Check if Spin is installed
if ! command -v spin &> /dev/null; then
    echo "Spin is not installed. Please install Spin first."
    exit 1
fi

# Compile the Promela model
spin -a $FILENAME

# Compile the verification code
gcc -o pan pan.c

# Run the basic safety verification
./pan -a -N packet_flow_safety

# Run buffer size invariant check
./pan -a -N buffer_size_invariant

# Run no continuous overflow check
./pan -a -N no_continuous_overflow

# Additional comprehensive verification
echo "Running full model check..."
spin -search $FILENAME