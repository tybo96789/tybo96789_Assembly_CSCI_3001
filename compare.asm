; Program Template           (Template.asm)

; Program Description:
; Author:
; Creation Date:
; Revisions: 
; Date:              Modified by:

INCLUDE Irvine32.inc

.386
;.model flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD
.data
mssg1	BYTE "X is lower",0dh,0ah,0
mssg2	BYTE "X is not lower",0dh,0ah,0

X real8  9.89
Y real8  12.56

.code
main PROC

compare:
	fld X
	;mov eax, X
	;mov ebx, Y
	fcom Y
		ja xhigher
		jb xlower
	;cmp eax, ebx
	;jnb xhigher
	;mov edx, OFFSET mssg1
	;call WriteString
	;jmp finished

xlower:
	mov edx, OFFSET mssg1
	Call WriteString
	jmp finished 

xhigher:
	mov edx, OFFSET mssg2
	Call WriteString
finished:
	INVOKE ExitProcess,0
main ENDP
; (insert additional procedures here)
END main




