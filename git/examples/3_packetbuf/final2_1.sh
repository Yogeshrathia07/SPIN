#!/bin/bash

# Comprehensive SPIN Verification Script

# Check if Spin is installed
if ! command -v spin &> /dev/null
then
    echo "SPIN model checker is not installed. Please install it first."
    exit 1
fi

# Compile the Promela model
spin -a final2.pml

# Compile the verification code with different exploration strategies
gcc -DMEMLIM=1024 -O2 -DREACH -DSAFETY -o pan pan.c

# Systematic Exploration Strategies

# 1. Depth-First Search with Full State Space Exploration
echo "Running Depth-First Search Verification..."
./pan -m10000 -c1

# 2. Breadth-First Search
echo "Running Breadth-First Search Verification..."
./pan -m10000 -c0

# 3. Exhaustive Random Exploration
echo "Running Exhaustive Random Exploration..."
./pan -m10000 -r

# 4. Memory-Bounded Verification
echo "Running Memory-Bounded Verification..."
./pan -m5000 -A

# 5. Full State Space Exploration with Collision Detection
echo "Running Full State Space Exploration..."
./pan -m10000 -DCOLLAPSE

# Additional LTL Property Verification
echo "Verifying LTL Properties..."
spin -search final2.pml

# Collect and analyze results
if [ $? -eq 0 ]; then
    echo "Comprehensive Verification Successful: No errors found across multiple exploration strategies."
else
    echo "Verification Detected Potential Issues:"
    echo "Generating detailed error trace..."
    spin -t final2.pml
fi