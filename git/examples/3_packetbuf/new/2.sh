#!/bin/bash



# Compile Promela model
spin -a 2.pml

# Compile pan verifier
gcc -o pan pan.c

# Comprehensive verification with multiple options
echo "Running full state space exploration..."

# Exhaustive depth-first search with large memory and state vector
./pan -a -m100000 -w64 -d -v

# Verify each LTL property separately with extensive exploration
ltl_properties=(
    "header_allocation_implies_copy"
    "header_allocation_limit"
    "header_reduction_limit"
    "buffer_length_constraint"
    "header_length_constraint"
)

for property in "${ltl_properties[@]}"
do
    echo "Verifying $property with comprehensive search..."
    ./pan -a -N "$property" -m100000 -w64 -d
done

# Bitstate heuristic search
echo "Running bitstate heuristic search..."
./pan -a -bitstate -m100000 -w64

# Partial order reduction search
echo "Running partial order reduction search..."
./pan -a -DREACH -m100000 -w64