## Some notes
1. The function helloworld is stored at 0x40125b.
2. rbp - 0x20 (32) is the address of the char s[] and it's the argument passed to __isoc99_scanf().
3. If the return value of strlen(s) is larger than 32, then the process will exit with 0.
4. If the return value of strlen(s) is below or equal to 32, then if the input string isn't equal to "helloworld", then the process will exit with 0.
5. 
