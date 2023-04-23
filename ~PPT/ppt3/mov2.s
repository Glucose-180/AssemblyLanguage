#mov2.S
.section .data
	bytevar:
		.byte 1, 2, 3, 4, 0, 0, 0, 0
	wordvar:
		.word 0x100, 0x200, 0, 0
	intvar:
		.int 0

.section .text
.globl main
main:
	movl $bytevar, %ebx
	movb 1($bytevar), %al  # modify here, Wan Dan(Ouch!)
	movb bytevar+2, %ah

	movw %ax, %cx
	movl $8, %esi
	movw %cx, 4(%ebx,%esi)

	movl 8(%ebx), %edx
	movl %edx, (%ebx, %esi, 2)
#exit
	movl $1, %eax
	movl $0, %ebx
	int	$0x80
