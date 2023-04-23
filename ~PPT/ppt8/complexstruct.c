typedef long long int64_t;
typedef int int32_t;

typedef struct {
	int64_t idx;
	int64_t x[4];
} a_struct;

typedef struct {
	int32_t first;
	a_struct a[7];
	int32_t last;
} b_struct;

void test(int64_t i, b_struct *bp)
{
	int32_t n = bp->first + bp->last;
	a_struct *ap = &bp->a[i];
	ap->x[ap->idx] = n;
}
