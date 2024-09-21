spin -u514 -p -l ex_1a.pml
-u514: Limits the simulation to 514 steps.
-p: Tells SPIN to print information about each step it takes, including the current state and the transitions.
-l: Instructs SPIN to print the values of all local variables whenever they change.

Run SPIN to simulate and explore the state space:
spin -m -search ex_1f.pml

To execute : spin pp.pml

TO EXECUTE UNRECHABLE STATE:
spin -a ex_2.pml
gcc -o pan pan.c
./pan -i
