#include <stdio.h>

unsigned d1[] = { 1,2,3,4,5 },
	d2[5];

void ldst(unsigned *p, unsigned *q, unsigned len, unsigned v);

int main()
{
	unsigned i;

	ldst(d2, d1, 5U, 2U);
	for (i = 0U; i < 5U; ++i)
		putchar('0' + d2[i]);
	putchar('\n');
	return 0;
}

void ldst(unsigned *p, unsigned *q, unsigned len, unsigned v)
{
	__asm__ volatile
	(
		"cld\n"
		"1:\n\t"
		"lodsl\n\t"
		"imull	%3, %%eax\n\t"
		"stosl\n\t"
		"loop	1b\n\t"
		:
		:"D"(p), "S"(q), "c"(len), "g"(v)
		:"eax"
	);
}
