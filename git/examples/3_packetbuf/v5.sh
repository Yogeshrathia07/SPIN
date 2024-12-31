#!/bin/bash

# Set the filename of the Spin model
MODEL_FILE="10_4.pml"

# Run verification for 'no_continuous_overflow' LTL property
echo "Running verification for property: no_continuous_overflow..."

# Generate the never claim for 'no_continuous_overflow'
spin -a $MODEL_FILE

# Recompile the pan code with -DVECTORSZ to increase the state vector size (if required)
gcc -DVECTORSZ=2048 -o pan pan.c

# Run pan with the new LTL formula: no_continuous_overflow
./pan -a -N no_continuous_overflow

# Clean up generated files after verification
echo "Do you want to clean up generated files? (y/n)"
read clean_up
if [ "$clean_up" == "y" ]; then
  rm -rf pan* 10_4.pml* 10_4.pml.trail
  echo "Cleanup complete."
else
  echo "Generated files not cleaned up."
fi

echo "Verification process complete."
