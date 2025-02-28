#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>

void instructions(void);
void maxLBS(char**);

// ***************************************************************************************
int main (int argc, char* argv[]) {
	if (argc <= 1) {
		instructions();
		return 0; }

	if (argc == 3) {
		maxLBS(argv);
		return 0;}

	int ST = atoi(argv[1]);
	if (ST < 1) {
		instructions();
		return 0;}
	double x = (ST * ST) / 5.0;
	if (ST >= 8)
		printf("%d lbs.\n", (int)round(x));
	else
		if (ST == 5)
			printf("%d lbs.\n", (int)round(x));
		else
			printf("%.1f lbs.\n", x);


	return 0; }

// =======================================================================================
void maxLBS(char* argv[]) {
	int ST = atoi(argv[1]);
	int lvl = atoi(argv[2]);
	if ((lvl > 4) | (lvl < 0)) {
		instructions();
		return; }

	int multiplier[] = {1, 2, 3, 6, 10};
	double x = (ST * ST) / 5.0;
	if ((ST < 8) & (lvl < 4))
		printf("%.1f lbs.\n", x * multiplier[lvl]);
	else
		printf("%d lbs.\n", (int)round(x * multiplier[lvl])); }

// ***************************************************************************************
void instructions() {
	puts("calc_BasicLift   ST   [enc]");
	puts("   ST:    ST value");
	puts("   [enc]:");
	puts("      0: None");
	puts("      1: Light");
	puts("      2: Medium");
	puts("      3: Heavy");
	puts("      4: Extra-Heavy");
	puts("");
	puts("");
}
