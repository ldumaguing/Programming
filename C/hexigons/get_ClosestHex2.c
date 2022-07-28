#include <stdio.h>
#include <stdlib.h>
#include <math.h>

#ifndef M_PI
#define M_PI (3.14159265358979323846264338327950288)
#endif

void instructions(void);
void get_OtherHex (int, int, int, int[]);
double get_Degrees (int, int, int, int);
double print_degrees(double, double, int, int, int, int);

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

	int d; // direction
	int location[] = {0, 0};
	double angle = get_Degrees(x0, y0, x1, y1);
	printf("%f\n", angle);
	double ang;
	for (d=0; d<6; d++) {
		get_OtherHex(x0, y0, d, location);
		ang = get_Degrees(location[0], location[1], x1, y1);
		printf("%d %d %f\n", location[0], location[1], ang);
		}

	return 0; }

// ***************************************************************************************
double get_Degrees (int x0, int y0, int x1, int y1) {
	double delta_X, delta_Y, distance;

	if ((x0 == x1) & (y0 == y1)) {
		puts("same space");
		return -1000.0; }

	if (x0 == x1) {
		if (y0 < y1)
			return 270.0;
		else
			return 90.0; }
			
	if ((y0 == y1)
	& ((x0 % 2) == (x1 % 2))) {
		if ( x0 < x1)
			return 0.0;
		else 
			return 180.0; }


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
		return print_degrees(delta_X, delta_Y, x0, y0, x1, y1); }

	delta_X = abs(x0 - x1) * cos(M_PI / 6.0);
	delta_Y = abs(y0 - y1);

	return print_degrees(delta_X, delta_Y, x0, y0, x1, y1); }

// =======================================================================================
double print_degrees(double X, double Y, int x0, int y0, int x1, int y1) {
	double degrees = atan(Y / X) * 180.0 / M_PI;

	if (x0 % 2) {   // odd
		if (y0 >= y1)    // North
			if (x0 < x1)    // East
				return degrees;
			else   // West
				return (180.0 - degrees);
		else    // South
			if (x0 < x1)    // East
				return (360.0 - degrees);
			else   // West
				return (180.0 + degrees); }


	if (y0 > y1)    // North
		if (x0 < x1)    // East
			return (degrees);
		else   // West
			return (180.0 - degrees);
	else    // South
		if (x0 < x1)    // East
			return (360.0 - degrees);
		else   // West
			return (180.0 + degrees); }


// ***************************************************************************************
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
		location[1] = --y0; }}

// ***************************************************************************************
void instructions() {
	puts("get_ClosestHex2   x0   y0   x1   y2");
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
