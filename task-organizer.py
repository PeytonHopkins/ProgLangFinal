# Peyton Hopkins
#
#

import sys

class Node:
    def __init__(self, task, dependentTask):
        self.task = task
        self.dependentTask = dependentTask
        self.next = None

    def next_node(self, next):
        self.next = next

print("Please input task values. (Use Ctrl+D to submit.)")
tasksStandardInput = sys.__stdin__.readlines()  # Take users multiline input of tasks & dependent tasks

if tasksStandardInput.__len__() == 0:    # Check for 0 or non-even num of lines to ensure input is correct
    print("ERROR: No lines detected.")
    sys.exit()
if tasksStandardInput % 2 != 0:
    print("ERROR: Odd number of lines detected.")
    sys.exit()

isEven = False
prevLine = ""
for line in tasksStandardInput:
    line = line[:-1]  # Remove the newline char
    if isEven:  # dependent task
        newNode = Node(line, prevLine)# Create Node
    else:       # task
       prevLine = line

    isEven =  not isEven


    # Sort the taskStandardInput into task & dependent task (dictionary?) (Task,Dependent Task)
    # Could be a "node" rather than a dictionary, where it can point to another node?

        # if line is odd, it is a task
        # if line is even, it is dependent task
        # add new task to a list containing all the task & dependent task pairs

# Figure out starting point of the task list
    # We must find which task is only a dependent task?
    # Make it a head node for a new list?


