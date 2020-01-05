global _start

section .text

_start:
    mov rdi, 2
    mov rsi, 1
    mov rdx, 0
    mov rax, 41
    syscall
    mov [sock_fd], rax
    
    mov rdi, rax
    mov rsi, sock_addr
    mov rdx, 16
    mov rax, 42 
    syscall

    mov rax, 1
    mov rdi, [sock_fd]
    mov rsi, sock_msg
    mov rdx, sock_msg_len
    syscall

    mov rax, 0
    mov rdi, [sock_fd]
    mov rsi, read_buf
    mov rdx, 4
    syscall

    mov rax, 1
    mov rdi, 1
    mov rsi, read_buf
    mov rdx, 4
    syscall

    mov rax, 3
    mov rdi, [sock_fd]
    syscall

    mov rax, 60
    mov rdi, 0
    syscall

section .bss
    read_buf: resb 5
    sock_fd: resq 1

section .data
    sock_addr: db 0x02,0x00,0x05,0x39,0x7f,0x00,0x00,0x01
    sock_msg: db "Hello from asm",0xa
    sock_msg_len: equ $ - sock_msg

