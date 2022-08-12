#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>

void instructions(void);

// ***************************************************************************************
int main (int argc, char* argv[]) {
	if (argc <= 1) {
		instructions();
		return 0; }

	int ST = atoi(argv[1]);
	double x = (ST * ST) / 5.0;
	printf("%d\n", (int)round(x));

	return 0; }

// ***************************************************************************************
void instructions() {
	puts("calc_BL   ST");
	puts("");
}
