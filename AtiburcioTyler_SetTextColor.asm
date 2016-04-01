; AtiburcioTyler_SetTextColor.asm
TITLE SetTextColor
INCLUDE Irvine32.inc
; /*Program Description : Write a program that displays the same string in four different colors, using a loop
; Author: Tyler Atiburcio
; Creation Date : 3/30/2016
; Revisions:
; Date:              Modified by :
;*/

.386
; .model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode : DWORD
.data
	; declare variables here
	str1 BYTE "Hi my name is Tyler and im programing in assembly", 0dh, 0ah, 0
	color BYTE green, red, cyan, yellow

	
.code
main PROC
	; write your code here

	mov ecx, LENGTHOF color						; length of color array
	mov edi, OFFSET color						;Address of color array
	L1: 
		mov eax, [edi]								;Get current element 
		call SetTextColor
		mov edx, OFFSET str1						; Print out string
		call WriteString
		add edi, TYPE color							; Get next element in color array
	loop L1											; loop exc != 0

	INVOKE ExitProcess, 0
main ENDP
; (insert additional procedures here)
END main
