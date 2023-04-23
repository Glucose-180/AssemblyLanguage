#hello.S

.section .data
	output:	.ascii "University of CAS\n"

.section .text
.globl main				/* for gcc */
main:
/* output like printf */
	movl	$4, %eax	/* system call number: 4 is write */
	movl	$1, %ebx	/* file descriptor */
	movl	$output, %ecx
	movl	$18, %edx	/* 18 is the length of output */
	int		$0x80		/* system call */
/* exit 0 */
	movl	$1, %eax	/* system call number: 1 is exit */
	movl	$0, %ebx	/* exit code */
	int		$0x80
