#convtest.s - An example of data conversion
.section .data
value1:
	.float 1.25, 124.79, 200.0, -312.5
value2:
	.int 1, -435, 0, -25
.section .bss
	.lcomm data, 16
.section .text
.globl _start
_start:
	cvtps2dq	value1, %xmm0
	# convert float(s) to int(s)

	cvttps2dq	value1, %xmm1
	# convert float(s) with truncation

	cvtdq2ps	value2, %xmm2
	# convert int(s) to float(s)
	movdqu		%xmm0, data
	# store to data

	movl	$1, %eax
	movl	$0, %ebx
	int	$0x80
