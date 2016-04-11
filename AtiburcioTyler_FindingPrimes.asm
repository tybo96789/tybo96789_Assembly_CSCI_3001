; Finding Primes(AtiburcioTyler_FindingPrimes.asm)
INCLUDE Irvine32.inc

; /*Program Description : Find all prime numbers from 2-1000
; Author: Tyler Atiburcio
; Creation Date : 4/4/16
; Revisions: too many 
; Date:              Modified by :
;*/

.386
;.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode : DWORD
.data
; declare variables here
ceil DWORD 1000
floor DWORD 2
.code
main PROC
; write your code here

call findPrimes
INVOKE ExitProcess, 0
main ENDP
; (insert additional procedures here)

findPrimes PROC USES EAX EBX ECX
; /*-------------------------------------------------------- -
; findingPrimes PROC
;
; Finds all primes given the range, and prints to standard output
; Receives: EAX, EBX, A lower bound and upper bound range of primes to find
; Where EAX is the start and EBX is the end of range
; Returns: None
; Requires: nothing
; -------------------------------------------------------- -*/
mov EAX, floor					;Set Start Point (Inclusive)
mov EBX, ceil					;Set end point (Exclusive)
add EBX, 1						;Include the end point

.REPEAT
call isPrime					;Call isPrime method to check if number in EAX is prime
.IF EDX != 0 || EAX == 2			;if the remainder is not 0 and the number is 2 its a prime number
mov ECX, EAX
call WriteInt		
call Crlf						;Print out the prime number to standard output
.ENDIF
inc EAX						;Next Number
.UNTIL EAX == EBX			;Loop until EAX is the same number as the ceilling
ret
findPrimes ENDP

isPrime PROC USES EBX ECX
; /*-------------------------------------------------------- -
; findingPrimes PROC
;
; Test to see if passed number is a prime number
; Receives: EAX, the number to test
; Where EAX is the number to test
; Returns: EDX = Remainder, and the status flags(Carry,
; Overflow, etc.) are changed.
; Requires: nothing
; -------------------------------------------------------- -*/
mov EDX, 0		;Set Remainder to 0
mov ECX, 2		;Divisor
.REPEAT

cmp EAX,ECX
je stopLabel 		;If the Dividend and the Divisor are the same its a prime number
xor EDX,EDX			;Clean Remainder

push EAX			;Preserve the Dividend
div ECX				;Divide the Dividend by the Divisor, result stored in EAX
pop EAX				;Restore the dividend, trash the result(quotient)

.IF EDX == 0
jmp stopLabel		;If the remainder is 0, its not a prime number
.ELSE
INC ECX				;Else increase the divisor by 1
.ENDIF

.UNTIL ECX > EAX	;Keep looping until divisor is same as the dividend
stopLabel:
ret
isPrime ENDP

END main
