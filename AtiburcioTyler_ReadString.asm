; ReadString(AtiburcioTyler_ReadString.asm)
INCLUDE Irvine32.inc
; /*Program Description : Implementing your own version of ReadString Procedure, using statck parameters.
;	ReadString(str:PTR, int maxCharacters to enter)
; Return the count of characters actually entered, in EAX
; Author: Tyler Atiburcio
; Creation Date : 4/20/16
; Revisions: 3
; Date:              Modified by :
;*/

;Method Declearation
Read_String PROTO str1:PTR DWORD, inputCount:DWORD

.386
;.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode : DWORD
.data
; declare variables here

string DWORD 10 DUP(0)
count DWORD 10 
msg BYTE "Please enter a string: ",0
endMsg BYTE " :Total Characters entered",0


.code
main PROC
; write your code hereB


mov EDX, OFFSET msg				;Write Prompt to standard output
call WriteString
call Crlf


INVOKE Read_String, ADDR string, count

call Crlf
mov EDX, OFFSET msg				;Write Ending prompt to standard output
call WriteString
call Crlf
call WriteInt					;Write the amount of characters actually entered
call Crlf

call DumpRegs					;For Debug
INVOKE ExitProcess, 0
main ENDP  
; (insert additional procedures here)

Read_String PROC USES ECX EBX EDI, str1:PTR DWORD, inputCount:DWORD
; /*-------------------------------------------------------- -
; Read_String PROC
;
; Reads in a string from standard input and stores that string into an array, 
; 	and keep tracks of how many characters has been actually inputted
; Receives: str1:PTR DWORD; The array to hold the string, inputCount: DWORD; requested amount of characters
; Returns: EAX-Amount of characters actually entered, EDX-The entered String
; Requires: nothing
; -------------------------------------------------------- -*/
	mov EAX, 0					;Set character count to 0
	mov ECX, inputCount			;Move requested amount of characters to be entered into ECX
	mov EDI, str1				;Move str1 Point to ESI 		
	call ReadString				;Call  ReadString to read from standard input
	mov [EDI],EDX				;Move input into ESI
	add EDI, TYPE str1			;Increment to the next section of the ESI
	mov EBX, 0					 
	mov [EDI], EBX				;Insert end of line
	cmp EAX, ECX				;Compare the actual amount of characters entered to requested characters
	ret

Read_String ENDP
END main
