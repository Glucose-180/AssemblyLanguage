#include <stdlib.h>
#include <stdio.h>
#include <time.h>
#include <string.h>

#define MB (1024U * 1024U)

#ifndef SZ
#define SZ 64U
#endif

void memcpy_1(char *dest, char *src, unsigned n);
void memcpy_2(char *dest, char *src, unsigned n);
void memcpy_3(char *dest, char *src, unsigned n);

void (*fp[3])(char *, char *, unsigned) = {
	memcpy_1, memcpy_2, memcpy_3
};

int main()
{
	char *p, *q;
	clock_t time_start;
	double time_used;
	unsigned i;

	p = malloc(SZ * MB);
	q = malloc(SZ * MB);

	for (i = 0U; i < 3U; ++i)
	{
		time_start = clock();
		fp[i](p, q, SZ * MB);
		time_used = (double)(clock() - time_start) / CLOCKS_PER_SEC;
		printf("memcpy_%u: %f s\n", i + 1U, time_used);
	}

	time_start = clock();
	memcpy(p, q, SZ * MB);
	time_used = (double)(clock() - time_start) / CLOCKS_PER_SEC;
	printf("sys memcpy: %f s\n", time_used);

	return 0;
}

void memcpy_1(char *dest, char *src, unsigned n)
{
	size_t i;

	for (i = 0U; i < n; ++i)
		*dest++ = *src++;
}

void memcpy_2(char *dest, char *src, unsigned n)
{
	__asm__ volatile
	(
		"cld\n\t"
		"rep	movsb"
		:
		:"D"(dest), "S"(src), "c"((unsigned long long)n)
	);
}

void memcpy_3(char *dest, char *src, unsigned n)
{
	unsigned long long i;

	n >>= 3;
	for (i = 0U; i < (unsigned long long)n; i += 4U)
	{
		__asm__ volatile
		(
			"movq	0(%1, %2, 8), %%xmm0\n\t"
			"movq	8(%1, %2, 8), %%xmm1\n\t"
			"movq	16(%1, %2, 8), %%xmm2\n\t"
			"movq	24(%1, %2, 8), %%xmm3\n\t"
			"movq	%%xmm0, 0(%1, %2, 8)\n\t"
			"movq	%%xmm1, 8(%1, %2, 8)\n\t"
			"movq	%%xmm2, 16(%1, %2, 8)\n\t"
			"movq	%%xmm3, 24(%1, %2, 8)"
			:
			:"r"(dest), "r"(src), "r"(i)
		);
	}
}
