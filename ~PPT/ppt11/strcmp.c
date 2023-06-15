#include <stdio.h>

char *s1 = "CaiXukun",
	*s2 = "CaiXukun", *s3 = "Caixukun";

int s_cmp(char *p, char *q, unsigned len);

int main()
{
	putchar('0' + s_cmp(s1, s2, 8U));
	putchar('0' + s_cmp(s2, s3, 8U));
	putchar('\n');
	return 0;
}

int s_cmp(char *p, char *q, unsigned len)
{
	int res;

	__asm__ volatile
	(
		"xorl	%0, %0\n\t"
		"cld\n\t"
		"repe	cmpsb\n\t"
		"setne	%b0"
		:"=a"(res)
		:"D"(p), "S"(q), "c"(len)
	);
	return res;
}
