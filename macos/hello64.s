section .text

global start

start:
    call hello
    mov rax, 0x2000001 ; exit
    mov rdi, 0
    syscall

hello:
    mov rax, 0x2000004 ; write
    mov rdi, 1 ; stdout
    mov rsi, msg
    mov rdx, msg.len
    syscall
    ret

section .data

msg:    db      'Hello from asm',0xa
.len:   equ     $ - msg
