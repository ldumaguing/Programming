#include <stdio.h>
#include <stdlib.h>
#include <math.h>

#ifndef M_PI
#define M_PI (3.14159265358979323846264338327950288)
#endif

void instructions(void);

// ***************************************************************************************
int main (int argc, char *argv[]) {
	if ((argc == 1)
	| (argc > 5)) {
		instructions();
		return 0; }

	int x0 = atoi(argv[1]);
	int y0 = atoi(argv[2]);
	int x1 = atoi(argv[3]);
	int y1 = atoi(argv[4]);

	double delta_X, delta_Y, distance;
	
	if ((x0 == x1) & (y0 == y1)) {
		puts("0.0");
		return 0; }

	if (x0 == x1) {
		printf("%f\n", (double)abs(y0 - y1));
		return 0; }

	if ((x0 % 2) != (x1 % 2)) {    // uneven
		if (x0 % 2) {    //  odd
			if (y0 < y1)
				delta_Y = abs(y0 - y1) - 0.5;
			else
				delta_Y = abs(y0 - y1) + 0.5; }
		else {
			if (y0 <= y1)
				delta_Y = abs(y0 - y1) + 0.5;
			else
				delta_Y = abs(y0 - y1) - 0.5; }

		delta_X = abs(x0 - x1) * cos(M_PI / 6.0);
		distance = sqrt((delta_X * delta_X) + (delta_Y * delta_Y));
		printf("%f\n", distance);

		return 0; }


	delta_X = abs(x0 - x1) * cos(M_PI / 6.0);
	delta_Y = abs(y0 - y1);
	distance = sqrt((delta_X * delta_X) + (delta_Y * delta_Y));

	printf("%f\n", distance);

	return 0; }

// ***************************************************************************************
void instructions() {
	puts("get_Distance   x0   y0   x1   y2");
	puts("   x0: first hex's X location");
	puts("   y0: first hex's Y location");
	puts("   x1: second hex's X location");
	puts("   y1: second hex's Y location");
	puts("   *****");
	puts("   OUTPUT: the distance to the second hex from the first hex");
	puts("");
}
