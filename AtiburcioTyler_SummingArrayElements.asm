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
;.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode : DWORD
.data
; declare variables here

nums DWORD 1, 2, 3, 4
sum SDWORD 0
.code
main PROC
; write your code here
PUSHAD							;Preserve all 32bit general purpose registers

mov edi, OFFSET [nums]			;Store address of nums to esi
mov eax, 0						;Set the sum total to 0
mov ecx, LENGTHOF nums			;Store the length of the nums array to ecx
mov ebx, 0						;Start summing range
mov ecx, 4						;End of summing range

call summArray

POPAD							;Restore All 32bit general purpose registers

INVOKE ExitProcess, 0
main ENDP
; (insert additional procedures here)

summArray PROC
; /*-------------------------------------------------------- -
; summArray PROC
;
; Calculates and returns the sum of an array given a range
; Receives: edi, EBX, ECX, An array of numbers and a two numbers indicating range to sum,
; Where EBX is the start and ECX is the end of range
; Returns: EAX = sum, and the status flags(Carry,
; Overflow, etc.) are changed.
; Requires: nothing
; -------------------------------------------------------- -*/
sub ecx, ebx			;Manage offset
.IF ebx > 0				;If start point is greater than 0 keep looping till you reach that point	
L1:
add edi, TYPE nums		; Point to next element
dec ebx
jnz L1
.ENDIF
L2:
add eax, [edi]			;Add element to sum
add edi, TYPE nums		;Point to next element
dec ecx
jnz L2					;Loop through the end of the range
mov sum, eax			;store sum
ret
summArray ENDP
END main
