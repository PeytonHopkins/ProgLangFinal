# Peyton Hopkins

import sys


class Node:
    def __init__(self, task, dependentTask):
        self.task = task
        self.dependentTask = dependentTask
        self.visited = False
        self.next = None


def topSort(node):
    node.visited = True
    for checkNode in Nodes:
        if checkNode.dependentTask == node.task and not checkNode.visited:
            topSort(checkNode)
            stack.append(node)


Nodes = []

debug = True

if not debug:
    print("Please input task values. (Use Ctrl+D to submit.)")
    tasksStandardInput = sys.__stdin__.readlines()  # Take users multiline input of tasks & dependent tasks
else:
    file = open('testcase.txt', 'r')
    tasksStandardInput = file.readlines()


if tasksStandardInput.__len__() == 0:    # Check for 0 or non-even num of lines to ensure input is correct
    print("\033[31mERROR: No lines detected.")
    sys.exit()
if tasksStandardInput.__len__() % 2 != 0:
    print("\033[31mERROR: Odd number of lines detected.")
    sys.exit()

isEven = False
prevLine = ""

for line in tasksStandardInput:
    if '\n' in line:    # Remove the newline char if it is there
        line = line[:-1]
    if isEven:  # dependent task
        newNode = Node(prevLine, line)  # Create Node (Task,Dependent Task)
        Nodes.append(newNode)   # add new task to a list containing all the task & dependent task pairs
    else:   # task
        prevLine = line

    isEven = not isEven

stack = []
visited = [False for i in range(Nodes.__len__())]

index = 0
for node in Nodes:
    if not node.visited:
        topSort(node)

for node in stack:
    print(node.task, node.dependentTask)
