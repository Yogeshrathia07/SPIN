#!/bin/bash

# Set the Promela model file
MODEL="10_4.pml"

# Step 1: Generate pan.c from the Promela model
echo "Generating pan.c from $MODEL..."
spin -a $MODEL

# Step 2: Compile pan.c with increased VECTORSZ
echo "Compiling pan.c with VECTORSZ=4096..."
gcc pan.c -o pan -DVECTORSZ=4096

# Step 3: Verify each LTL property
declare -a PROPERTIES=("packet_flow_safety" "buffer_size_invariant" "no_continuous_overflow")

for PROPERTY in "${PROPERTIES[@]}"; do
    echo "Verifying property: $PROPERTY"
    ./pan -a -N "$PROPERTY"
    echo "Verification complete for: $PROPERTY"
    echo "-------------------------------------"
done

# Step 4: Clean up generated files (optional)
read -p "Do you want to clean up generated files? (y/n): " CLEANUP
if [[ $CLEANUP == "y" || $CLEANUP == "Y" ]]; then
    echo "Cleaning up generated files..."
    rm -f pan.c pan pan.* $MODEL.trail
    echo "Cleanup complete."
else
    echo "Generated files are retained."
fi

echo "All verifications completed."
