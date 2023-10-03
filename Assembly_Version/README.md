Some snippets of code you can find them in this repo [mips from scratch](https://github.com/DanerSound/MIPS-from-scratch).

# Assembly Mips version:

![](/scr/tree_Assembly_version.png) 

# General Description:

The purpose of this program is to print a tree using the simbol " * " and also a generic greeting for Christmas.
Here you will find the description for the main procedure.
All the code was divided into small procedures dedicated for one specific task.

  # Data Segment:
  - asterisco: is a string with the null terminator that rapresent "*".
  - newLine: is a string with the null terminator that rapresent "\n" - goto a new line. 
  - msg: is a string with the null terminator that rapresent a greeting for Christmas.
  - simbolsNum: is an array of words that contains the number of occurrences of the asterisks (asterisco) 
    to be printed in the tree.
  
  # Text Segment:
  The tree is printed on the loop **treePrinter** that takes an element from the array simbolsNum.
  
  That is ordered by default and for each number print the asteriks.
  
  At the end of the loop, the control goes to the label **text** that print the messagge.
  
  The programma finish jumping to the syscall that force the end of the program.