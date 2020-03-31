# MerryXmas-Mips

The main purpose of this repo was to recall the main concepts of assembly mips.

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
 
 # Python Version:
 
 ![](/scr/tree_python_version.jpg)
 
 # General Description:
 
 The purpose of this program is to print a tree using the simbol " * " and also a generic greeting for Christmas.
 Here you will find the description for the main procedure.
 
 To be able to print _tree_ and _text_ **aligned** we need to print 5 empty spaces before the first asterisco.
 Just because the number of asterisk is increasing in the array **"simbols_occurences"** we need to manage to print 
 some proper spaces.
 The for_cicle of line 26-27 print all the simbols in the right positions. Befor start a new print cycle, we print a 
 newLine. when print is done, the greeting message can be printed.
 
 
  ![Work_in_progress](http://cliffordgarstang.com/wp-content/uploads/2013/01/Work_in_progress.png)
  
  
  ---
   **Work always in progress** because i'll keep updating this repo!
