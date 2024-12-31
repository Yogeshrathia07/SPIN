#define MAX 10  // Maximum number of nodes in the list

typedef Node {
    int next;   // Index of the next node (-1 if none)
    bool used;  // True if the node is part of the list
}

Node list[MAX]; // Array to store the nodes
int head = -1;  // Index of the first node in the list (-1 means the list is empty)

init {
    int i;
    for (i = 0; i < MAX; i++) {
        list[i].next = -1;  // No next element
        list[i].used = false;  // Node is not in use
    }
}

inline list_add(int item) {
    atomic {
        // Ensure the item is not already in the list
        if (list[item].used) {
            printf("Node %d is already in the list\n", item);
            break;
        }
        
        list[item].used = true;
        list[item].next = -1;  // Set it as the last node
        
        // If the list is empty, the new node becomes the head
        if (head == -1) {
            head = item;
        } else {
            // Traverse to the end of the list
            int temp = head;
            while (list[temp].next != -1) {
                temp = list[temp].next;
            }
            list[temp].next = item;  // Add the new node at the end
        }
    }
}

