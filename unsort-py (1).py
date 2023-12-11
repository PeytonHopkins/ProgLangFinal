# PYTHON: Reverse-sort the lines from standard input 
import sys# bring in a standard library
from filecmp import cmp

lines = sys.__stdin__.readlines() # read every line from stdin into an array!
def reverse_compare(a,b): # defining a new function with two arguments
  return cmp(b,a)         # swap the standard comparison 
  
lines.sort(key = reverse_compare) # sort them using our comparison
                        # this is a destructive, in-place sort 
for one_line in lines:  # iterate over every element of that now-sorted array
  print (one_line)       
