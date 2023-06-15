#include <stdio.h>

char *s = "Hello world!\n";
char d[100];

void s_copy_1(char *p, char *q, unsigned len);
void s_copy_2(char *p, char *q, unsigned len);

int main()
{
	s_copy_2(d, s, 13);
	puts(d);
	return 0;
}

void s_copy_1(char *p, char *q, unsigned len)
{
	__asm__ volatile
	(
		"movl	%0, %%edi\n\t"
		"movl	%1, %%esi\n\t"
		"movl	%2, %%ecx\n\t"
		"cld\n\t"
		"rep	movsb"
		:
		:"g"(p), "g"(q), "g"(len)
		:"edi", "esi", "ecx"
	);
	return;
}

void s_copy_2(char *p, char *q, unsigned len)
{
	__asm__ volatile
	(
		"cld\n\t"
		"rep	movsb"
		:
		:"D"(p), "S"(q), "c"(len)
	);
	return;
}
