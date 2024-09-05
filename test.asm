.386
.model flat, stdcall
option casemap:none
.stack 4096

.data
 
sum DWORD ?
ExitProcess proto, dwExitCode:dword

.code

public main
main proc
	
	
	mov eax, 7
	add eax, 4
	mov sum, eax

	invoke ExitProcess, 0

main endp
end main