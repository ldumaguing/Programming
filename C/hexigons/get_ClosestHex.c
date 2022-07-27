#include <stdio.h>
#include <stdlib.h>
#include <math.h>

#ifndef M_PI
#define M_PI (3.14159265358979323846264338327950288)
#endif

void instructions(void);
void get_OtherHex (int, int, int, int[]);
double get_Distance (int, int, int, int);

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

	int d;
	int location[] = {0, 0};
	int loc[] = {0, 0};
	get_OtherHex(x0, y0, 0, location);
	double dist = get_Distance(location[0], location[1], x1, y1);
	for (d=1; d<6; d++) {
		get_OtherHex(x0, y0, d, location);
		double dst = get_Distance(location[0], location[1], x1, y1);
		printf("%d %d %f\n", location[0], location[1], dst);
		if (dist >= dst) {
			loc[0] = location[0];
			loc[1] = location[1];
			dist = dst;}
		}

printf("...%d %d %f\n", loc[0], loc[1], dist);
	return 0; }

// =======================================================================================
double get_Distance (int x0, int y0, int x1, int y1) {
	double delta_X, delta_Y, distance;
	
	if ((x0 == x1) & (y0 == y1))
		return 0.0;

	if (x0 == x1)
		return (double)abs(y0 - y1);

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

		return distance; }


	delta_X = abs(x0 - x1) * cos(M_PI / 6.0);
	delta_Y = abs(y0 - y1);
	distance = sqrt((delta_X * delta_X) + (delta_Y * delta_Y));

	return distance; }

// =======================================================================================
void get_OtherHex (int x0, int y0, int d, int location[]) {
	if (d == 0) {
		location[0] = x0;
		location[1] = --y0;
		return;}
	if (d == 3) {
		location[0] = x0;
		location[1] = ++y0;
		return; }

	int X = d < 3 ? x0 + 1 : x0 - 1;

	if (x0 % 2) {  // X is odd
		if ((d == 2) | (d == 4)) {
			location[0] = X;
			location[1] = ++y0; }
		else {
			location[0] = X;
			location[1] = y0; }
		return; }
		
	if ((d == 2) | (d == 4)) {
		location[0] = X;
		location[1] = y0; }
	else {
		location[0] = X;
		location[1] = --y0; }
}

// ***************************************************************************************
void instructions() {
	puts("get_ClosestHex   x0   y0   x1   y2");
	puts("   x0: first hex's X location");
	puts("   y0: first hex's Y location");
	puts("   x1: second hex's X location");
	puts("   y1: second hex's Y location");
	puts("   *****");
	puts("   OUTPUT: the hex location that's nearer to the second hex");
	puts("");
	puts("         _____");
	puts("        /     \\");
	puts("       / x0,y0 \\");
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
	puts(""); }
