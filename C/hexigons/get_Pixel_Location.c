#include <stdio.h>
#include <stdlib.h>
#include <math.h>

int main (int argc, char *argv[]) {
	if (argc == 1) {
		instructions();
		return 0; }
	
	printf("%.8f\n", cos(M_PI / 6.0));

	return 0;	
}

// ***************************************************************************************
void instructions() {
   puts("get_Pixel_Location   x0   y0");
}
