/* jumptest.c - An example of using jumps in inline assembly */
#include <stdio.h>

int main()
{
	int a = 10, b = 20;
	int result;

	asm(
		"cmp	%1, %2\n\t"
		"jge	greater\n\t"
		"movl	%1, %0\n\t"
		"jmp	end\n"
		"greater:\n\t"
		"movl	%2, %0\n"
		//"end:"
		: "=r"(result)
		: "r"(a), "r"(b)
	);

	asm volatile("end:\n\tmovl %eax, %eax");

	printf("Larger: %d\n", result);
	return 0;
}
