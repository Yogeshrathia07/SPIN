#define MAX_SIZE 10
int list[MAX_SIZE];      // Our "linked list" array
int next[MAX_SIZE];      // Array to store the 'next' pointers
int head = -1;           // Head of the list (-1 means empty)
int size = 0;            // Keep track of the list size

proctype list_add(int item) {
   if
   :: (size < MAX_SIZE) -> 
      // Remove item if it exists
      run list_remove(item);

      // Add the item to the end of the list
      if
      :: (head == -1) -> // List is empty
         head = item;
         next[item] = -1; // Set 'next' to NULL
      :: else -> 
         int i = head;
         do
         :: (next[i] == -1) -> break; // Find the end of the list
         :: else -> i = next[i]; // Move to the next element
         od;
         next[i] = item; // Link the last element to the new one
         next[item] = -1; // The new item is now the last one
      fi;
      size++;
   :: else -> printf("List is full!\n");
   fi;
}

proctype list_remove(int item) {
   if
   :: (head == -1) -> skip; // List is empty
   :: (head == item) -> // Item is the first element
      head = next[head];
      size--;
   :: else -> 
      int prev = head;
      int curr = next[head];
      do
      :: (curr == -1) -> break; // Reached the end of the list
      :: (curr == item) -> 
         next[prev] = next[curr]; // Remove the item
         size--;
         break;
      :: else -> 
         prev = curr;
         curr = next[curr]; // Move to the next element
      od;
   fi;
}


proctype list_pop() {
   if
   :: (head == -1) -> skip; // List is empty
   :: else -> 
      int first_item = head;
      head = next[head];
      size--;
      printf("Popped item: %d\n", first_item);
   fi;
}

init {
   run list_add(1);
   run list_add(2);
   run list_add(3);
    run list_add(1);
   run list_add(2);
   run list_add(3);
    run list_add(1);
   run list_add(2);
   run list_add(3);
    run list_add(1);
   run list_add(2);
   run list_add(3);
   run list_pop();
   assert(size == 2); // Check that the list size is correctly updated after popping
}
