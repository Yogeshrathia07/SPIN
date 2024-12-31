#!/bin/bash

# Input PML file name
MODEL="4.pml"

# Clear previous artifacts
echo "Cleaning up previous files..."
rm -f pan pan.c *.trail

# Compile the Promela model
echo "Generating pan.c for $MODEL..."
spin -a $MODEL

# Compile the pan.c verifier with increased vector size
echo "Compiling pan.c with increased VECTORSZ..."
gcc -o pan pan.c -DVECTORSZ=204800   #----------------------------------

# Define LTL properties
LTL_PROPS=("buffer_safety" "header_allocation_reduction" "valid_copyto")



# Run verification for each LTL property
for PROP in "${LTL_PROPS[@]}"; do
    echo "Verifying property: $PROP"
    ./pan -a -N "$PROP"
    if [ $? -eq 0 ]; then
        echo "Property $PROP holds."
    else
        echo "Property $PROP violated! Check the trail file."
        exit 1
    fi
done

echo "All properties verified successfully."
