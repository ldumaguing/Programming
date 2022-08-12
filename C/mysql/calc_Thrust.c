#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>

void instructions(void);

void Thrust_1(int);
void Thrust_2(int);
void Thrust_3(int);
void Thrust_4(int);
void Thrust_5(int);
void Thrust_6(int);

// ***************************************************************************************
int main (int argc, char* argv[]) {
	if (argc <= 1) {
		instructions();
		return 0; }

	int val = atoi(argv[1]);

	if ((val >= 1) & (val <= 18))
		Thrust_1(val);
	if ((val >= 19) & (val <= 34))
		Thrust_2(val);
	if ((val >= 35) & (val <= 44))
		Thrust_3(val);
	if ((val >= 45) & (val <= 59))
		Thrust_4(val);
	if ((val >= 60) & (val <= 109))
		Thrust_5(val);
	if (val >= 110)
		Thrust_6(val);


	return 0; }

// =======================================================================================
void Thrust_6(int val) {
	int num = trunc(val / 10) + 1;
	printf("%dd\n", num); }

// ---------------------------------------------------------------------------------------
void Thrust_5(int val) {
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
		printf("%dd%d\n", num, modifier);
	if (modifier == 0)
		printf("%dd\n", num);
	if (modifier > 0)
		printf("%dd+%d\n", num, modifier); }

// ---------------------------------------------------------------------------------------
void Thrust_4(int val) {
	if ((val >= 45) & (val <= 49))
		printf("5d\n");
	if ((val >= 50) & (val <= 54))
		printf("5d+2\n");
	if ((val >= 55) & (val <= 59))
		printf("6d\n"); }

// ---------------------------------------------------------------------------------------
void Thrust_3(int val) {
	if ((val == 35) | (val == 36))
		printf("4d-1\n");
	if ((val == 37) | (val == 38))
		printf("4d\n");
	if ((val >= 39) & (val < 45))
		printf("4d+1\n"); }

// ---------------------------------------------------------------------------------------
void Thrust_2(int val) {
	int num = 2;
	if (val >= 27) num = 3;
	int modifier = round(val / 2.0) - 11;
	if (val >= 27) modifier = modifier - 4;
	if (modifier < 0)
		printf("%dd%d\n", num, modifier);
	if (modifier == 0)
		printf("%dd\n", num);
	if (modifier > 0)
		printf("%dd+%d\n", num, modifier); }

// ---------------------------------------------------------------------------------------
void Thrust_1(int val) {
	int modifier = round(val / 2.0) - 7;
	if (modifier < 0)
		printf("1d%d\n", modifier);
	if (modifier == 0)
		printf("1d\n");
	if (modifier > 0)
		printf("1d+%d\n", modifier); }

// ***************************************************************************************
void instructions() {
	puts("calc_Thrust   ST");
	puts("");
}
