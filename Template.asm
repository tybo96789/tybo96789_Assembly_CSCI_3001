; Program Template(Template.asm)
INCLUDE Irvine32.inc
; /*Program Description :
; Author: Tyler Atiburcio
; Creation Date :
; Revisions:
; Date:              Modified by :
;*/

.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode : DWORD
.data
; declare variables here
.code
main PROC
; write your code here
INVOKE ExitProcess, 0
main ENDP
; (insert additional procedures here)
END main
