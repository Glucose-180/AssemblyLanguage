void bubble_sort(char a[], int n)
{
	int i, j;
	char temp;

	for(j=0; j<n-1; j++)
		for(i=0; i<n-1-j; i++)
		{
			if(a[i] > a[i+1])
			{
				temp = a[i];
				a[i] = a[i+1];
				a[i+1] = temp;
			}
		}
}
