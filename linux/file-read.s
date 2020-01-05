global _start

section .text

_start:
    mov rax, 2
    mov rdi, file_name
    mov rsi, 0
    syscall
    cmp rax, 0

    mov rdi, rax
    mov rax, 0
    mov rsi, read_buf
    mov rdx, 4
    syscall

    mov rax, 1
    mov rdi, 1
    mov rsi, read_buf
    mov rdx, 4
    syscall

    mov rax, 60
    mov rdi, 0
    syscall

section .bss
    read_buf: resb 5

section .rodata
    file_name: db "/home/user/test.txt",0
