extrn MessageBoxA: PROC
includelib user32.lib

.data
mytitle db 'NtTerminateProcess', 0
msg db 'Process killed', 0

.code
main proc

	push rbp
	mov rbp, rsp				
	sub rsp, 80h
	lea rcx, [rbp-8]			; arg1: pointer to stack, used to store result HANDLE hProcess
	mov rdx, 1					; arg2: DWORD dwDesiredAccess=1=PROCESS_TERMINATE
	mov rax, 30h
	mov [rbp-71], rax
	lea r8, [rbp-72]			; arg3: pointer to stack, set to 30h in observed call but can be 0, BOOL  bInheritHandle?
	mov rax, 15704				; PID to kill
	mov [rbp-88], rax			
	lea r9, [rbp-88]			; arg4: pointer to stack = DWORD dwProcessId
	mov rax, 1111111111111111h				
	mov [rbp-16], rax
	lea r11, [rbp-16]			; arg5: pointer to stack = ? set to next user instruction in observed call but can be 0
	mov r10, rcx				; set r10 to arg1, needed for unknown reason
	mov rax, 26h				; syscall number for NtOpenProcess
	syscall
	mov rax, [rbp-8]
	add rsp, 80h
	pop rbp

	mov rcx, rax			; HANDLE hProcess	
	mov rdx, 1				; UINT   uExitCode
	mov r10, rcx			; set r10 to arg1, needed for unknown reason
	mov rax, 2Ch			; syscall number for NtTerminateProcess
	syscall
	
	sub rsp, 28h 
	mov rcx, 0      		; hWnd = HWND_DESKTOP
	lea rdx, msg			; LPCSTR lpText
	lea r8,  mytitle		; LPCSTR lpCaption
	mov r9d, 0				; uType = MB_OK
	call MessageBoxA
	add rsp, 28h  

	mov rcx, -1				; HANDLE hProcess = -1 = null hProcess will terminate calling process
	mov rdx, 0				; UINT   uExitCode
	mov r10, rcx			; set r10 to arg1, needed for unknown reason
	mov rax, 2Ch			; syscall number for NtTerminateProcess
	syscall

main endp

End