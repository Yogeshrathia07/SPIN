proctype func1() {
    atomic
    {
        printf("Step 1: Executing function 1, statement 1\n");
        printf("Step 2: Executing function 1, statement 2\n");
        printf("Step 3: Executing function 1, statement 3\n");
        printf("Step 4: Executing function 1, statement 4\n");
        printf("Step 5: Executing function 1, statement 5\n");

    }
    
}

proctype func2() {
    atomic
    {
           printf("Step 6: Executing function 2, statement 1\n");
        printf("Step 7: Executing function 2, statement 2\n");
        printf("Step 8: Executing function 2, statement 3\n");
        printf("Step 9: Executing function 2, statement 4\n");
        printf("Step 10: Executing function 2, statement 5\n");

    }
 
}

proctype func3() {
    atomic{printf("Step 11: Executing function 3, statement 1\n");
    printf("Step 12: Executing function 3, statement 2\n");
    printf("Step 13: Executing function 3, statement 3\n");
    printf("Step 14: Executing function 3, statement 4\n");
    printf("Step 15: Executing function 3, statement 5\n");}
}

proctype func4() {
    atomic{printf("Step 16: Executing function 4, statement 1\n");
    printf("Step 17: Executing function 4, statement 2\n");
    printf("Step 18: Executing function 4, statement 3\n");
    printf("Step 19: Executing function 4, statement 4\n");
    printf("Step 20: Executing function 4, statement 5\n");}
}

proctype func5() {
    atomic{printf("Step 21: Executing function 5, statement 1\n");
    printf("Step 22: Executing function 5, statement 2\n");
    printf("Step 23: Executing function 5, statement 3\n");
    printf("Step 24: Executing function 5, statement 4\n");
    printf("Step 25: Executing function 5, statement 5\n");}
}


init {
    atomic { run func1(); }
    atomic { run func2(); }
    atomic { run func3(); }
    atomic { run func4(); }
    atomic { run func1(); }
    atomic { run func5(); }
}
