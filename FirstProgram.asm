TITLE MASM Template

INCLUDE Irvine32.inc

.data
myHeaderInfo BYTE "Tyler", 0dh, 0ah, 0

.code
main PROC
	;// Print out header info
	mov edx, OFFSET myHeaderInfo
	call WriteString

	;// Print out a decimal number in eax
	mov eax, 123
	call WriteDec

	;// Print out the registers
	call dumpregs

	exit
main ENDP
END main



