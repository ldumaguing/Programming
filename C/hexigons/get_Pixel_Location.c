#include <stdio.h>
#include <stdlib.h>
#include <math.h>

void instructions(void);

// ***************************************************************************************
int main (int argc, char *argv[]) {
	if ((argc == 1)
	| (argc > 9)) {
		instructions();
		return 0; }

	int x0 = atoi(argv[1]);
	int y0 = atoi(argv[2]);
	int x1 = atoi(argv[3]);
	int nX = atoi(argv[4]);
	int y2 = atoi(argv[5]);
	int nY = atoi(argv[6]);
	int x = atoi(argv[7]);
	int y = atoi(argv[8]);

	double x_scale, y_scale;

	// get_Pixel_Location  149 115 4826 19 3116 21 10 10
	// get_Pixel_Location  149 115 4566 18 3116 21 10 10


	// Column
   int delta_y = y2 - y0;
	y_scale = (double)delta_y / (nY - 1);
	if (y_scale < 18.0) {
		puts("Y scale is too small.");
		return 0; }

	// Row
	int delta_x = x1 - x0;
	double cos30 = cos(M_PI / 6.0);
	x_scale = (double)delta_x / ((nX * 2) - 2);
	/*
	if (nX % 2) {   // odd
		x_scale = (double)delta_x / ((nX * 2) - 2); }
	else {          // even
		printf(">> %d\n", (nX * 2) - 2);
		x_scale = (double)delta_x / ((nX * 2) - 2);
		puts("x0"); }
	*/






	printf("%d %d %f %d\n", (int)(x_scale * x) + x0, (int)(y_scale * y) + y0, y_scale, delta_y);

	return 0;	
}

// ***************************************************************************************
void instructions() {
	puts("get_Pixel_Location   x0   y0   x1   nX   y2   nY   x   y");
	puts("   x0: Upper-left hexegon's center X pixel location");
	puts("   y0: Upper-left hexegon's center Y pixel location");
	puts("   x1: Upper-right hexegon's center X pixel location");
	puts("   nX: Number of hexagons in the upper-most row");
	puts("   ---");
	puts("   y2: Lower-left hexegon's center Y pixel location");
	puts("   nY: Number of hexagons in the left-most column");
	puts("   ---");
	puts("   x: Hexagon's X ID to query its pixel location");
	puts("   y: Hexagon's Y ID to query its pixel location");
	puts("   *****");
	puts("   OUTPUT: pixel location of the queried hexagon");
	puts("     _____                                           _____");
	puts("    /     \\                                         /     \\");
	puts("   / x0,y0 \\_____                             _____/ x1,__ \\");
	puts("   \\   1   /     \\                           /     \\  nX   /");
	puts("    \\_____/   .   \\ . . . . . . . . . . . . /   .   \\_____/");
	puts("       .");
	puts("       .");
	puts("       .");
	puts("       .                   _____");
	puts("       .                  /     \\");
	puts("       .                 /  x,y  \\");
	puts("       .                 \\       /");
	puts("       .                  \\_____/");
	puts("       .");
	puts("       .");
	puts("       .");
	puts("     _____");
	puts("    /     \\");
	puts("   / __,y2 \\");
	puts("   \\  nY   /");
	puts("    \\_____/");
}
