#include <stdio.h>

int main(int argc, char *argv[])
{
#ifdef PF
	printf("%d\n", argc);
	return 0;
#else
	return argc;
#endif
}
