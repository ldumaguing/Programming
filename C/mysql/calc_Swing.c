#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>

void instructions(void);

void Swing_1(int);
void Swing_2(int);
void Swing_3(int);
void Swing_4(int);
void Swing_5(int);
void Swing_6(int);
void Swing_7(int);

// ***************************************************************************************
int main (int argc, char* argv[]) {
	if (argc <= 1) {
		instructions();
		return 0; }

	int val = atoi(argv[1]);

	if ((val >= 1) & (val <= 12))
		Swing_1(val);
	if ((val >= 13) & (val <= 24))
		Swing_2(val);
	if ((val >= 25) & (val <= 30))
		Swing_3(val);
	if ((val >= 31) & (val <= 38))
		Swing_4(val);
	if ((val >= 39) & (val <= 44))
		Swing_5(val);
	if ((val >= 45) & (val <= 109))
		Swing_6(val);
	if (val >= 110) Swing_7(val);

	return 0; }

// =======================================================================================
void Swing_7(int val) {
	int num = trunc(val / 10) + 3;
	printf("%dd\n", num); }

// ---------------------------------------------------------------------------------------
void Swing_6(int val) {
	if ((val >= 45) & (val <= 49)) {
		printf("7d+1\n");
		return; }

	int num = trunc(val / 10.0) + 3;
	int modifier = 0;
	
	if ((val >= 50) & (val <= 54)) {
		printf("8d-1");
		return; }
	if ((val >= 55) & (val <= 59)) {
		printf("8d+1");
		return; }
	if ((val >= 100) & (val <= 109)) {
		printf("13d");
		return; }

	modifier = trunc(val / 5.0);
	modifier = (modifier % 2) * 2;
	if (modifier == 0)
		printf("%dd\n", num);
	else
		printf("%dd+%d\n", num, modifier); }

// ---------------------------------------------------------------------------------------
void Swing_5(int val) {
	printf("7d-1\n"); }

// ---------------------------------------------------------------------------------------
void Swing_4(int val) {
	int modifier = ceil(val / 2.0) - 17;
	if (modifier < 0)
		printf("6d%d\n", modifier);
	if (modifier == 0)
		printf("6d\n");
	if (modifier > 0)
		printf("6d+%d\n", modifier); }

// ---------------------------------------------------------------------------------------
void Swing_3(int val) {
	int modifier = ceil(val / 2.0) - 13;
	if (val == 25)
		modifier = -1;
	if (modifier < 0)
		printf("5d%d\n", modifier);
	if (modifier == 0)
		printf("5d\n");
	if (modifier > 0)
		printf("5d+%d\n", modifier); }

// ---------------------------------------------------------------------------------------
void Swing_2(int val) {
	int num = ceil(val / 4.0) - 2;
	int modifier = ((val+3) % 4) - 1;
	if (modifier < 0)
		printf("%dd%d\n", num, modifier);
	if (modifier == 0)
		printf("%dd\n", num);
	if (modifier > 0) 
		printf("%dd+%d\n", num, modifier); }

// ---------------------------------------------------------------------------------------
void Swing_1(int val) {
	int modifier = round(val / 2.0) - 6;
	if ((val >= 1) & (val <=9))
		printf("1d%d\n", modifier);
	if (val == 10)
		printf("1d\n");
	if (val == 11)
		printf("1d+1\n");
	if (val == 12)
		printf("1d+2\n"); }

// ***************************************************************************************
void instructions() {
	puts("calc_Swing   number");
	puts("");
}
