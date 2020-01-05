.code
main proc
	mov rax, 2Ch    ; syscall number for NtTerminateProcess
	mov rcx, -1     ; HANDLE hProcess = -1 = null hProcess will terminate calling process
	mov rdx, 0      ; UINT   uExitCode
	mov r10, rcx    ; set r10 to arg1, needed for unknown reason
	syscall
main endp

End
