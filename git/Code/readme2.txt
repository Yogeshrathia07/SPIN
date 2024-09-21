spin -a peterson.pml    # This generates the pan.c file
gcc -o pan pan.c        # Compile pan.c
./pan -a                # Run the verification


spin -a peterson.pml
gcc -o pan pan.c
./pan
./pan -r
./pan -a
