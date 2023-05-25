#include <stdio.h>
#include <stdlib.h>

unsigned int shld5(unsigned int a, unsigned int b)
{
	unsigned int result;
	/* result = (a << 5) | (b >> (32 - 5)); */
	asm
	(
		"shldl	%3, %2, %0"
		:"=g" (result)
		:"0" (a), "r" (b), "i" (5)
	);
	return result;
}

int main(int argc, char *argv[])
{
	unsigned int ans, ref;
	unsigned int a, b;

	if (argc != 3)
		return 1;
	a = atoi(argv[1]);
	b = atoi(argv[2]);
	ans = shld5(a, b);
	ref = (a << 5) | (b >> (32 - 5));
	printf("Ans is 0x%x\nRef is 0x%x\n", ans, ref);
	return 0;
}
