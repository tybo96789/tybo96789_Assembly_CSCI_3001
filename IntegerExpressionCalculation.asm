TITLE Integer Expression Calculation

;// A = (A + B) - (C + D)
;// Assign integer values to eax, ebx, ecx, edx


.386
.model flat, stdcall
.stack 4096
ExitProcess proto, dwExitCode:dword

.code
main proc
	mov	eax, 4
	mov ebx, 3
	mov ecx, 2
	mov edx, 1

	add ebx, eax	;//Add value in eax to ebx
	add ecx, edx	;//Add value in ecx to edx

	sub ebx, ecx	;//Subtract the values in ebx to ecx

	mov eax, ebx	;//Move result from ebx to eax


	invoke ExitProcess, 0
main endp
end main
