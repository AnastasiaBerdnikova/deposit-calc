#include <stdio.h>
#include "deposit.h"

int main()
{
	
        int period, amound, iincome;
	printf("Input time and sum:");
	scanf("%d %d", &period, &amound);
	if(check(period, amound))
	  return 0;
	iincome=interest_income(period, amound);
	printf("future earnings: %d\n", iincome);
	return 0;
}
