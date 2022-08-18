#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>

void instructions(void);

// ***************************************************************************************
int main (int argc, char* argv[]) {
	if (argc == 1) {
		instructions();
		return 0; }

	int ST = atoi(argv[1]);
	double BL = (ST * ST) / 5.0;
	double lbs = atof(argv[2]);

	double weirat = lbs / BL;
	double WeiRat[] = {
		 0.05, 0.1,  0.15, 0.2,  0.25,
		 0.3,  0.4,  0.5,  0.75, 1.0,
		 1.5,  2.0,  2.5,  3.0,  4.0,
		 5.0,  6.0,  7.0,  8.0,  9.0,
		10.0, 12.0
		};
	int i = 0;
	for(i=0; i<22; ++i) {
		if (WeiRat[i] > weirat) break;
		}

	double DisMod[] = {
		3.5,  2.5, 2.0,  1.5,  1.2,
		1.1,  1.0, 0.8,  0.7,  0.6,
		0.4,  0.3, 0.25, 0.2,  0.15,
		0.12, 0.1, 0.09, 0.08, 0.07,
		0.06, 0.05
		};
	printf("%.1f yds.\n", DisMod[i] * ST); }

// ***************************************************************************************
void instructions() {
	puts("calc_Throwing_Distance   ST   lbs");
	puts("   ST: ST value");
	puts("   lbs: weight of object to be thrown");
	puts(""); }
