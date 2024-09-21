#define N 5        /* Define the size of the array */

byte state[N];     /* Declare an array of N bytes */
int n = 2;         /* Define a variable used in the array index */

init {
    /* Initialize the array with some values */
    state[0] = 1;
    state[1] = 2;
    state[2] = 3;
    state[3] = 4;
    state[4] = 5;

    /* Accessing and modifying array elements */
    state[0] = state[3] + 5 * state[3*2/n];

    /* Printing out the values to observe changes */
    printf("state[0]: %d\n", state[0]);
    printf("state[1]: %d\n", state[1]);
    printf("state[2]: %d\n", state[2]);
    printf("state[3]: %d\n", state[3]);
    printf("state[4]: %d\n", state[4]);

    /* Example of invalid index access (comment out to avoid runtime error) */
    /* Uncomment the following line to observe undefined behavior */
    /* state[5] = 10; */  /* This would be out of bounds and could cause an error */

    /* Terminate the process */
    printf("End of simulation\n");
}
