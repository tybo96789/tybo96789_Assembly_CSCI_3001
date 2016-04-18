; Str_Concat_Procedure(AtiburcioTyler_Str_Concat_Procedure.asm)
INCLUDE Irvine32.inc
; /*Program Description : A procedure that concatenates a source string to the end of a target string
	;Sufficiemt space must exist in the target string to accommodate the new characters.
  ; Author: Tyler Atiburcio
  ; Creation Date : 4/11/16
  ; Revisions: 1
  ; Date:              Modified by :
  ;*/

.386
;.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode : DWORD


;Method declaration
Str_concat PROTO, dest:PTR BYTE, src:PTR BYTE

.data
; declare variables here
targetStr BYTE "ABCE", 10 DUP(0)
sourceStr BYTE "FGH", 0
.code
main PROC
; write your code here


;Print the source and destination arrays before concatenate
mov EAX, OFFSET sourceStr			
call WriteString
call Crlf
mov EBX, OFFSET targetStr
call WriteString
call Crlf

;INVOKE Str_concat, ADDR sourceStr, ADDR targetStr				;Test case if source is larger than destination array
INVOKE Str_concat, ADDR targetStr, ADDR sourceStr

;Print the destination array after calling str_concat
mov EBX, OFFSET targetStr
call WriteString
call Crlf

INVOKE ExitProcess, 0
main ENDP
; (insert additional procedures here)



Str_concat PROC USES EAX EBX ECX ESI EDI, dest:PTR BYTE, src:PTR BYTE
; /*-------------------------------------------------------- -
; Str_concat PROC
;
; Concatenates strings together, but checks if the destination array can hold the
;	data in the source array. Concatenates source array to the end of the destination array
; Receives: dest:PTR BYTE; The destination array, src:PTR BYTE the source array 
; Returns: None
; Requires: nothing
; -------------------------------------------------------- -*/
mov EAX, LENGTHOF src			;Get the Length of source array
mov EBX, LENGTHOF dest			;Get the length of the destination array
mov ESI, src					;Move source poniter to ESI
mov EDI, dest					;Move Destination pointer to EDI

.REPEAT							
add EDI, TYPE dest
dec EAX
.UNTIL EAX == 0					;Loop to the ending part of part of the destination array

.IF EDI > ESI					;If destination is smaller than source, there is not enough room in destination array return immediately
jmp endLabel
.ENDIF

.REPEAT
mov ECX,[ESI]					;Move the current values in source array and store into ECX
mov [EDI],ECX					;Store the value of ECX into the destination array
add EDI, TYPE dest				;Increment to the next element in the destination array
add ESI, TYPE src				;Increment to the next element in the source array
dec EBX
.UNTIL EBX == 0

endLabel:
ret
Str_concat ENDP 

END main
