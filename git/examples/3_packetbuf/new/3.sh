#!/bin/bash

# Set the Promela file name
PROMELA_FILE="3.pml"

# Spin compilation and verification steps
echo "Compiling the Promela model..."
spin -a $PROMELA_FILE  # Generate the pan.c file

echo "Compiling the pan.c file with gcc..."
gcc -o pan pan.c  # Compile the pan.c file to produce an executable

# Verify all LTL properties one by one
LTL_PROPERTIES=("buffer_not_overflow" "header_allocation_limit" "header_reduction_integrity" "buffer_copy_after_clear")

for prop in "${LTL_PROPERTIES[@]}"; do
    echo "Verifying LTL property: $prop"
    ./pan -a -N $prop  # Verify the specific property
    if [ $? -eq 0 ]; then
        echo "Property $prop: VERIFIED"
    else
        echo "Property $prop: VIOLATED"
    fi
done

# Clean up intermediate files
echo "Cleaning up intermediate files..."
rm -f pan pan.c pan.* trail* *.tmp
echo "Verification completed!"
