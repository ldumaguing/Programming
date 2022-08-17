#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>

void instructions(void);
void high_jump(int, char**);
void broad_jump(int, char**);

// ***************************************************************************************
int main (int argc, char* argv[]) {
	if ((argc == 1) | (argc > 3)) {
		instructions();
		return 0; }

	high_jump(argc, argv);
	broad_jump(argc, argv);

	return 0; }

// ***************************************************************************************
void broad_jump(int argc, char* argv[]) {
	int lvl = 0;
	if (argc == 3)
		lvl = atoi(argv[2]);

	int move = atoi(argv[1]);
	double multiplier[] = {1.0, 0.8, 0.6, 0.4, 0.2};

	double broad = (2.0 * move) - 3;
	if (broad < 1.0) broad = 0.0;
	int feet = (int)(broad * multiplier[lvl]);
	printf("Broad: %d'", feet);

	int rfeet = feet * 2;
	printf("; with running %dyds: %d' max.\n", (rfeet - feet), rfeet);}
		
// ***************************************************************************************
void high_jump(int argc, char* argv[]) {
	int lvl = 0;
	if (argc == 3)
		lvl = atoi(argv[2]);

	int move = atoi(argv[1]);
	double multiplier[] = {1.0, 0.8, 0.6, 0.4, 0.2};

	double high = (6.0 * move) - 10;
	if (high < 1.0) high = 0.0;
	int I = (int)(high * multiplier[lvl]);
	int feet = (int)(I / 12.0);
	int inches = I % 12;
	if (inches)
		printf("High: %d'%d\"", feet, inches);
	else
		printf("High: %d'", feet);

	int rI = I * 2;
	int rfeet = (int)(rI / 12.0);
	int rinches = rI % 12;
	if (rinches)
		printf("; with running %dyds: %d'%d\" max.\n", (rfeet - feet), rfeet, rinches);
	else
		printf("; with running %dyds: %d' max.\n", (rfeet - feet), rfeet);}

// ***************************************************************************************
void instructions() {
	puts("calc_Jumping   Move   [Encumbrance Level]");
	puts("   Move:   Basic Move value");
	puts("   [Encumbrance Level]:");
	puts("      0: None");
	puts("      1: Light");
	puts("      2: Medium");
	puts("      3: Heavy");
	puts("      4: Extra-Heavy");
	puts("");
}
