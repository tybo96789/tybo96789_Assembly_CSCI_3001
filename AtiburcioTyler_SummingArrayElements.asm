; Program Summing Array Elements(AtiburcioTyler_SummingArrayElements.asm)
INCLUDE Irvine32.inc
TITLE Summing Array Elements
; /*Program Description : Creating a procedure that returns the sum of all array elements falling within the range [j,k] inclusive
  ; Author: Tyler Atiburcio
  ; Creation Date : 4/1/16
  ; Revisions:
  ; Date:              Modified by :
  ;*/

.386
; .model flat, stdcall
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
