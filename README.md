Variables Scope Parser
======================

Implement a simple parser to find a value of a variable in it's current scope. 

Requirement
===========

ruby > 1.9.1

Usage
=====

**File Input**
  `ruby run.rb <file_path>` e.g. `ruby run.rb sample/input_01.txt`
  run.rb takes the first argument as file path to parse

**STDIN Manual**
  `ruby run.rb` 
  This will prompt user to input the sequence and prints the output once finished. Sequence should start with '[' and end with ']'.

**Code**
  `parser = Hoppr::Parser.new` to initialize an instance of the parser class
    `parser.file(<file_path>)` to parse a file
    or
    `parser.input` for STDIN from user
  
  
Test Cases
==========

Included unit test cases for different classes, objects and methods
`rake` or `rake test` in the command prompt to run all the test cases.

Design Flow
===========
* lib/hoppr/stack.rb
  * Stack - Hoppr::Stack class is a specific stack implementation. @top manages the current level of the stack
    * push - increments the stack level by 1, duplicates the @top-1 values on the current level of the stack
    * pop - decrements the stack level by 1
    * find - search any element value on the top of the stack
    * update - update the value of any variable on the top of the stack
    * reset - resets the whole stack with @top = nil
    * empty? - checks if the stack is empty or not
    * size - returns the current size of the stack. 
    
* lib/hoppr/parser.rb
  * Parser - Hoppr::Parser class parses each input from user or from a file
    * file(<filepath>) - this method takes a file path input, parses the file and returns the output if none of the errors are encountered
    * input - this method takes user input from STDIN
    
  
Further
=======
Read the code comments for each method functioning. For any other clarification kindly feel free to contact me