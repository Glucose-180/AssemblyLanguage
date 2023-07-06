#include <stdio.h>
#include <stdlib.h>

void foo()
{
	printf("Stack overflow\n");
	exit(0);
}

void echo()
{
	char buf[4];
	unsigned long *p = buf + 20;
	*p = foo;
	gets(buf);
	puts(buf);
}

int main()
{
	printf("Type a string: ");
	echo();
	return 0;
}
