.section .data
output:
	.asciz "The value is : %d\n"
.section .text
.globl _start
_start:
	movl $100, %ecx
	movl $0, %eax
loop1:
	addl %ecx, %eax
	loop loop1

	pushl %eax
	pushl $output
	call printf
	add $8, %esp

	movl $1, %eax
	movl $0, %ebx
	int $0x80

/*
# as --32 -gstabs -o loop.o loop.s
# ld -m elf_i386 -dynamic-linker /lib32/ld-linux.so.2 -lc  -o loop loop.o
# ./loop
*/
