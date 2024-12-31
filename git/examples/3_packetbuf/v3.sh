#!/bin/bash

# Property to verify
property="buffer_size_invariant"

# Run verification for the specific property
echo "Running verification for property: $property..."
spin -search -ltl $property 10_4.pml

if [ $? -eq 0 ]; then
    echo "Verification for $property completed successfully."
else
    echo "Verification for $property failed."
fi

# Ask whether to clean up generated files
echo "Do you want to clean up generated files? (y/n)"
read cleanup_choice
if [[ "$cleanup_choice" == "y" ]]; then
    rm -f 10_4.trail 10_4.pml 10_4.pan
    echo "Cleanup complete."
else
    echo "Cleanup skipped."
fi

echo "Verification process complete."
