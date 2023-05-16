int if_branch_i(int x, int y)
{
	if (x > y)
		return 1;
	else
		return 0;
}

char if_branch_c(int x, int y)
{
	if (x > y)
#ifdef CAST
		return (char)1;
#else
		return 1;
#endif
	else
#ifdef CAST
		return (char)0;
#else
		return 0;
#endif
}
