#hello.S

.section .data
	output:	.ascii "Hello World\n"

.section .text
.globl _start
_start:
/* output like printf */
	movl	$4, %eax	/* system call number: 4 is write */
	movl	$1, %ebx	/* file descriptor */
	movl	$output, %ecx
	movl	$12, %edx
	int		$0x80		/* system call */
/* exit 0 */
	movl	$1, %eax	/* system call number: 1 is exit */
	movl	$0, %ebx	/* exit code */
	int		$0x80
