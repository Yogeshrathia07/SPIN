#!/bin/bash

# Filename
FILENAME="final2.pml"

# Check if Spin is installed
if ! command -v spin &> /dev/null; then
    echo "Spin is not installed. Please install Spin first."
    exit 1
fi

# Compile with more comprehensive verification flags
spin -a -DSAFETY $FILENAME
gcc -o pan pan.c

# Comprehensive verification with multiple strategies
echo "Running detailed verification..."
./pan -a -N packet_flow_safety
./pan -a -N buffer_size_invariant
./pan -a -N no_continuous_overflow

# Full state space exploration
spin -search -k10 $FILENAME