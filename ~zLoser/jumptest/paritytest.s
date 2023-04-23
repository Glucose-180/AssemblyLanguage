# paritytest.s - An example of testing the parity flag
.section .text
.globl _start
_start:
	MOVL	$1, %EAX
	MOVL	$4, %EBX
	SUBL	$3, %EBX
# the result is 1, 00000001 in binary
# as the number of 1 in the LOWEST byte is odd, so PF is set 0
# JP will not happen
	JP	OH
	INT	$0X80
OH:
	MOVL	$100, %EBX
	INT	$0X80
