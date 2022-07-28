#include <stdio.h>
#include <stdlib.h>
#include <math.h>


#ifndef M_PI
#define M_PI (3.14159265358979323846264338327950288)
#endif


void instructions(void);
void print_degrees(double, double, int, int, int, int);

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
		puts("same space");
		return 0; }
	if (x0 == x1) {
		if (y0 < y1) {
			puts("270");
			return 0; }
		else {
			puts("90");
			return 0; }}
	if ((y0 == y1)
	& ((x0 % 2) == (x1 % 2))) {
		if ( x0 < x1) {
			puts("0");
			return 0; }
		else {
			puts("180");
			return 0; }}


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
		print_degrees(delta_X, delta_Y, x0, y0, x1, y1);

		return 0; }

	delta_X = abs(x0 - x1) * cos(M_PI / 6.0);
	delta_Y = abs(y0 - y1);
	print_degrees(delta_X, delta_Y, x0, y0, x1, y1);

	return 0; }

// =======================================================================================
void print_degrees(double X, double Y, int x0, int y0, int x1, int y1) {
	double degrees = atan(Y / X) * 180.0 / M_PI;
printf("theta: %f\n", degrees);

	if (x0 % 2) {   // odd
		if (y0 >= y1)    // North
			if (x0 < x1)    // East
				printf("%f\n", degrees);
			else   // West
				printf("%f\n", 180.0 - degrees);
		else    // South
			if (x0 < x1)    // East
				printf("%f\n", 360.0 - degrees);
			else   // West
				printf("%f\n", 180.0 + degrees);

		return; }


	if (y0 > y1)    // North
		if (x0 < x1)    // East
			printf("%f\n", degrees);
		else   // West
				printf("%f\n", 180.0 - degrees);
	else    // South
		if (x0 < x1)    // East
			printf("%f\n", 360.0 - degrees);
		else   // West
			printf("%f\n", 180.0 + degrees);
}

// ***************************************************************************************
void instructions() {
	puts("get_Theta   x0   y0   x1   y2");
	puts("   x0: first hex's X location");
	puts("   y0: first hex's Y location");
	puts("   x1: second hex's X location");
	puts("   y1: second hex's Y location");
	puts("   *****");
	puts("   OUTPUT: the theta angle (in degrees) to the second hex from the first hex");
	puts("");
	puts("         __90_");
	puts("        /     \\");
	puts("       / x0,y0 \\ 0");
	puts("       \\       /");
	puts("        \\_____/");
	puts("              \\");
	puts("               \\");
	puts("                \\ ");
	puts("                  _____");
	puts("                 /     \\");
	puts("                / x1,y1 \\");
	puts("                \\       /");
	puts("                 \\_____/");
	puts("");
}
