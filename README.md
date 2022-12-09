# linked-list

Definition of a linked list:

A linear collection of data elements 
without a reliance on physical placement in memory 
for their order. Arrays need a specific amount of memory all in one place. Linked lists dont need to take a single block of memory, it can be scattered throughout.

This makes linked lists a dynamic data structure, compared to arrays which are static.

An array object needs to keep track of its own size, where it starts, where it ends.

But with nodes in a linked list, each node doesnt care about the size of the list, or where it ends or begins. It only cares about the value it holds, and the value of it's neighbor next in line.

Like arrays though, they are a linear data structure, and are reliant on sequential traversing.

Linked lists are similar to arrays, except that they dont require reallocation as they are not position dependent and items can be easily removed or inserted.

Each element points to the next, similar to a queue data structure.
Each node contains a bit of data, and a 
reference to the next node in the sequence.