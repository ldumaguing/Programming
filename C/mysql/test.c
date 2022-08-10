#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>

int main(void) {
	int num = 0;
	int modifier = 0;
	for (int val=25; val<=30; ++val) {
		
		
		
		
		
	modifier = ceil(val / 2.0) - 13;
	if (val == 25)
		modifier = -1;
	if (modifier < 0)
		printf("5d%d\n", modifier);
	if (modifier == 0)
		printf("5d\n");
	if (modifier > 0)
		printf("5d+%d\n", modifier);
	}
	return 0;
}
