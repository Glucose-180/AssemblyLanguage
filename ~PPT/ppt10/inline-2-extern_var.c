/* An example of using external variables. */
#include <stdio.h>

int a = 10;
int b = 20;
int result;

int main()
{
	asm("pushl	%eax\n\t"
		"pushl	%ebx\n\t"
		"movl	a, %eax\n\t"
		"movl	b, %ebx\n\t"
		"addl	%ebx, %eax\n\t"
		"movl	%eax, result\n\t"
		"popl	%ebx\n\t"
		"popl	%eax"
	);
	printf("The result is %d\n", result);
	return 0;
}
