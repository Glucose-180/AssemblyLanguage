.section .rodata
fmt:
	.asciz "%x"

.section .bss
.lcomm	data, 4

.section .text
.globl _start
_start:
	pushl	$data
	pushl	$fmt
	call	scanf
	addl	$4, %esp
	movl	data, %ebx
	movl	%ebx, (%esp)

	call	print_hex
	movl	$0, (%esp)
	call	exit
