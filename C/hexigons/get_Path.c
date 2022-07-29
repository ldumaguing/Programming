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

	int FROM[] = {atoi(argv[1]), atoi(argv[2])};
	int TO[] = {atoi(argv[3]), atoi(argv[4])};
	double ref_angle = get_Degrees(FROM[0], FROM[1], TO[0], TO[1]);
	printf("%f\n", ref_angle);

	int movingHex[] = {FROM[0], FROM[1]};
	int queryHex[] = {0, 0};
	int candidateHex[] = {0, 0};
	double cmp_angles[2];  // old, new

	while (!((movingHex[0] == TO[0]) & (movingHex[1] == TO[1]))) {
		cmp_angles[0] = 400.0;
		cmp_angles[1] = 400.0;


		if (((FROM[1] - TO[1]) <= 0)   // SE
			& ((FROM[0] - TO[0]) <= 0)) {
			for (int d=0; d<6; d++) {
				if ((d == 0) | (d == 5) | (d == 4)) continue;

				get_OtherHex(movingHex[0], movingHex[1], d, queryHex);
				double ang = get_Degrees(FROM[0], FROM[1], queryHex[0], queryHex[1]);
				double delta_angle = (ang > ref_angle) ? (ang - ref_angle) : (ref_angle - ang);
				cmp_angles[1] = delta_angle;
				//printf("%d %d ... %f --- %f\n", queryHex[0], queryHex[1], ang, delta_angle);

				if (cmp_angles[0] > cmp_angles[1]) {
					candidateHex[0] = queryHex[0];
					candidateHex[1] = queryHex[1];
					cmp_angles[0] = cmp_angles[1]; }}

			movingHex[0] = candidateHex[0];
			movingHex[1] = candidateHex[1];
			printf("%d %d\n", movingHex[0], movingHex[1]); }


		if (((FROM[1] - TO[1]) >= 0)   // NW
			& ((FROM[0] - TO[0]) >= 0)) {
			for (int d=0; d<6; d++) {
				if ((d == 1) | (d == 2) | (d == 3)) continue;
			
				get_OtherHex(movingHex[0], movingHex[1], d, queryHex);
				double ang = get_Degrees(FROM[0], FROM[1], queryHex[0], queryHex[1]);
				double delta_angle = (ang > ref_angle) ? (ang - ref_angle) : (ref_angle - ang);
				cmp_angles[1] = delta_angle;
				//printf("%d %d ... %f --- %f\n", queryHex[0], queryHex[1], ang, delta_angle);

				if (cmp_angles[0] > cmp_angles[1]) {
					candidateHex[0] = queryHex[0];
					candidateHex[1] = queryHex[1];
					cmp_angles[0] = cmp_angles[1]; }}

			movingHex[0] = candidateHex[0];
			movingHex[1] = candidateHex[1];
			printf("%d %d\n", movingHex[0], movingHex[1]); }


		if (((FROM[1] - TO[1]) > 0)   // NE
			& ((FROM[0] - TO[0]) < 0)) {
			for (int d=0; d<6; d++) {
				if ((d == 3) | (d == 4) | (d == 5)) continue;
			
				get_OtherHex(movingHex[0], movingHex[1], d, queryHex);
				double ang = get_Degrees(FROM[0], FROM[1], queryHex[0], queryHex[1]);
				double delta_angle = (ang > ref_angle) ? (ang - ref_angle) : (ref_angle - ang);
				cmp_angles[1] = delta_angle;
				//printf("%d %d ... %f --- %f\n", queryHex[0], queryHex[1], ang, delta_angle);

				if (cmp_angles[0] > cmp_angles[1]) {
					candidateHex[0] = queryHex[0];
					candidateHex[1] = queryHex[1];
					cmp_angles[0] = cmp_angles[1]; }}

			movingHex[0] = candidateHex[0];
			movingHex[1] = candidateHex[1];
			printf("%d %d\n", movingHex[0], movingHex[1]); }


		if (((FROM[1] - TO[1]) < 0)   // SW
			& ((FROM[0] - TO[0]) > 0)) {
			for (int d=0; d<6; d++) {
				if ((d == 0) | (d == 1) | (d == 2)) continue;
			
				get_OtherHex(movingHex[0], movingHex[1], d, queryHex);
				double ang = get_Degrees(FROM[0], FROM[1], queryHex[0], queryHex[1]);
				double delta_angle = (ang > ref_angle) ? (ang - ref_angle) : (ref_angle - ang);
				cmp_angles[1] = delta_angle;
				//printf("%d %d ... %f --- %f\n", queryHex[0], queryHex[1], ang, delta_angle);

				if (cmp_angles[0] > cmp_angles[1]) {
					candidateHex[0] = queryHex[0];
					candidateHex[1] = queryHex[1];
					cmp_angles[0] = cmp_angles[1]; }}

			movingHex[0] = candidateHex[0];
			movingHex[1] = candidateHex[1];
			printf("%d %d\n", movingHex[0], movingHex[1]); }}

	return 0; }
	
// ***************************************************************************************
double get_Degrees (int x0, int y0, int x1, int y1) {
	double delta_X, delta_Y, distance;

	if ((x0 == x1) & (y0 == y1)) {
		// puts("same space");
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
	puts("get_Path   x0   y0   x1   y2");
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
