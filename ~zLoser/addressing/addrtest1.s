# addrtest1.s - Testing the addressing
.section .data
dt:
	.int 9, 8, 7, 6
.section .text
.globl _start
_start:
	movq	$1, %rax
	movq	$0, %rbx

	movq	$dt, %rdx
	movslq	dt(, %rax, 4), %rdx
	movslq	dt(%rbx, %rbx, 4), %rdx
	movslq	dt(%rip), %rdx
# When the Assembler finds that the base register is %rip, it use the distance between dt and %rip as displacement; otherwise, when the Assembler finds that the base register is common register, it use dt's true address as displacement.
	leaq	dt(%rip), %rdx
	leaq	dt(%rbx), %rdx
#exit
	movq	$1, %rax
	movq	$0, %rbx
	int	$0x80
