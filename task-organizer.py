# Peyton Hopkins
import sys

class Node:
    def __init__(self, task, dependentTask):
        self.task = task
        self.dependentTask = dependentTask
        self.visited = False


def topSort(node):
    node.visited = True
    foundMatch = False
    for checkNode in Nodes:
        if checkNode.dependentTask == node.task and not checkNode.visited:
            foundMatch = True
            topSort(checkNode)
            stack.append(node)
    if not foundMatch:
        stack.append(node)


Nodes = []

debug = True # This is to make testing faster

if not debug:
    print("Please input task values.")
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

for node in Nodes:
    if not node.visited:
        topSort(node)


index = 1
for node in stack[::-1]:    # iterate through the stack in reverse order
    print(node.dependentTask)
    if index == stack.__len__():
        print(node.task)
    index += 1