#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>

void instructions(void);

void Thrust_1(int, char*);
void Thrust_2(int, char*);
void Thrust_3(int, char*);
void Thrust_4(int, char*);
void Thrust_5(int, char*);
void Thrust_6(int, char*);
void calc_Thrust(int, char**, char*);

void define_weights(double[], double);
void list_table(double[], char[], char**);
void calc_Throwing_Damage (int, char**, char[]);
void calc_Throwing_Distance (int, char**, char[]);

// ***************************************************************************************
int main (int argc, char* argv[]) {
	if (argc < 3) {
		instructions();
		return 0; }

	char dmg[128];
	calc_Throwing_Damage(argc, argv, dmg);

	char rng[128];
	calc_Throwing_Distance(argc, argv, rng);

	printf("%s; %s\n", rng, dmg); }

// ***************************************************************************************
void calc_Throwing_Distance (int argc, char* argv[], char* rng) {
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
	sprintf(rng, "%.1f yds.", DisMod[i] * ST); }

// ***************************************************************************************
void calc_Throwing_Damage (int argc, char* argv[], char* dmg) {
	char* notes[] = {
		", -2 per die",
		", -1 per die",
		"",
		", +1 per die",
		"",
		", -1/2 per die (round down)",
		", -1 per die"
		};

	char thrust[64];
	calc_Thrust(argc, argv, thrust);

	int ST = atoi(argv[1]);
	double BL = (ST * ST) / 5.0;
	double weights[7];
	define_weights(weights, BL);

	if (argc == 2) {
		list_table(weights, thrust, notes);
		return; }

	double lbs = atof(argv[2]);
	if (lbs > weights[6]) {
		puts("Too heavy to throw.");
		exit(-1); }
	
	int i = 0;
	for (i=0; i<7; ++i)
		if (lbs <= weights[i]) break;
	sprintf(dmg, "%s%s", thrust, notes[i]); }

// ***************************************************************************************
void list_table(double w[], char thr[], char* notes[]) {
	for (int i=0; i<7; ++i) {
		printf("Up to %.2f: %s%s\n", w[i], thr, notes[i]); }}

// ***************************************************************************************
void define_weights(double w[], double bl) {
	w[0] = bl / 8.0;
	w[1] = bl / 4.0;
	w[2] = bl / 2.0;
	w[3] = bl;
	w[4] = bl * 2.0;
	w[5] = bl * 4.0;
	w[6] = bl * 8.0;
}

// ***************************************************************************************
void calc_Thrust (int argc, char* argv[], char* thr) {
	int val = atoi(argv[1]);

	if ((val >= 1) & (val <= 18))
		Thrust_1(val, thr);
	if ((val >= 19) & (val <= 34))
		Thrust_2(val, thr);
	if ((val >= 35) & (val <= 44))
		Thrust_3(val, thr);
	if ((val >= 45) & (val <= 59))
		Thrust_4(val, thr);
	if ((val >= 60) & (val <= 109))
		Thrust_5(val, thr);
	if (val >= 110)
		Thrust_6(val, thr);


	return; }

// =======================================================================================
void Thrust_6(int val, char* thr) {
	int num = trunc(val / 10) + 1;
	sprintf(thr, "%dd", num); }

// ---------------------------------------------------------------------------------------
void Thrust_5(int val, char* thr) {
	int num = trunc(val / 10) + 1;
	int modifier = 0;
	if ((val >= 60) & (val <= 64))
		modifier = -1;
	if ((val >= 65) & (val <= 69))
		modifier = 1;
	if (((val >= 75) & (val <= 79))
		| ((val >= 85) & (val <= 89))
		| ((val >= 95) & (val <= 99)))
		modifier = 2;

	if (modifier < 0)
		sprintf(thr, "%dd%d", num, modifier);
	if (modifier == 0)
		sprintf(thr, "%dd", num);
	if (modifier > 0)
		sprintf(thr, "%dd+%d", num, modifier); }

// ---------------------------------------------------------------------------------------
void Thrust_4(int val, char* thr) {
	if ((val >= 45) & (val <= 49))
		sprintf(thr, "5d");
	if ((val >= 50) & (val <= 54))
		sprintf(thr, "5d+2");
	if ((val >= 55) & (val <= 59))
		sprintf(thr, "6d"); }

// ---------------------------------------------------------------------------------------
void Thrust_3(int val, char* thr) {
	if ((val == 35) | (val == 36))
		sprintf(thr, "4d-1");
	if ((val == 37) | (val == 38))
		sprintf(thr, "4d");
	if ((val >= 39) & (val < 45))
		sprintf(thr, "4d+1"); }

// ---------------------------------------------------------------------------------------
void Thrust_2(int val, char* thr) {
	int num = 2;
	if (val >= 27) num = 3;
	int modifier = round(val / 2.0) - 11;
	if (val >= 27) modifier = modifier - 4;
	if (modifier < 0)
		sprintf(thr, "%dd%d", num, modifier);
	if (modifier == 0)
		sprintf(thr, "%dd", num);
	if (modifier > 0)
		sprintf(thr, "%dd+%d", num, modifier); }

// ---------------------------------------------------------------------------------------
void Thrust_1(int val, char* thr) {
	int modifier = round(val / 2.0) - 7;
	if (modifier < 0)
		sprintf(thr, "1d%d", modifier);
	if (modifier == 0)
		sprintf(thr, "1d");
	if (modifier > 0)
		sprintf(thr, "1d+%d", modifier); }

// ***************************************************************************************
void instructions() {
	puts("calc_Throwing_RngDmg   ST   lbs");
	puts("");
}
