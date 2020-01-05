.386
.model flat, stdcall
includelib kernel32.lib
includelib user32.lib
ExitProcess PROTO STDCALL :DWORD
MessageBoxA PROTO STDCALL :DWORD,:DWORD,:DWORD,:DWORD

.data
mytitle db 'Hello', 0
msg db 'Hello from asm', 0

.code
main proc
	push 0              ; uType = MB_OK
	push offset mytitle ; LPCSTR lpCaption
	push offset msg     ; LPCSTR lpText
	push 0              ; hWnd = HWND_DESKTOP
	call MessageBoxA
	push eax            ; uExitCode = MessageBox(...)
	call ExitProcess
main endp

End
