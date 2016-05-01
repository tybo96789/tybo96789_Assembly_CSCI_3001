; Program Template(Template.asm)
INCLUDE Irvine32.inc
; /*Program Description : Compare a floating point number with another floating point number
; Author: Tyler Atiburcio
; Creation Date : 4/29/16
; Revisions:
; Date:              Modified by :
;*/

.386
;.model flat, stdcall
.stack 4096
;Method Declaration
ExitProcess PROTO, dwExitCode : DWORD

.data
; declare variables here
larger BYTE "First float is Larger",0				;Message if first float is larger
smaller BYTE "First float is Smaller",0				;Message if first float is smaller
.code
;dlbOne REAL8 3.1415926535898						;Various Test cases
dlbTwo REAL8 2.71828128459
dlbOne REAL8 1.61803398875
;dlbTwo REAL8 0.0
main PROC
; write your code here

FLD dlbOne											;Load dlbOne into stack ST(0) = dlbOne
FCOM dlbTwo											;Compare dlbTwo with ST(0) ST(1) = dlbTwo
ja largerA											;If dlbOne is larger jump to largerA tag
jb smallerA											;if dlbOne is smaller jump to smallerA tag

largerA:
mov EDX, OFFSET larger								;Move largerA message to EDX
call WriteString
call Crlf											;Print to standard output
jmp EndLabel

smallerA:											;Mov smallerA message to EDX
mov EDX, OFFSET smaller
call WriteString
call Crlf											;Print to standard output
jmp EndLabel

EndLabel:
INVOKE ExitProcess, 0
main ENDP
; (insert additional procedures here)

END main
