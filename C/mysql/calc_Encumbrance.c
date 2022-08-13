#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>

void instructions(void);
void fourLevels(int);
void oneAnswer(int, char*);

// ***************************************************************************************
int main (int argc, char* argv[]) {
	if (argc <= 1) {
		instructions();
		return 0; }

	int ST = atoi(argv[1]);

	if (argc == 2) {
		fourLevels(ST);
		return 0; }

	oneAnswer(ST, argv[2]);


	return 0; }

// =======================================================================================
void oneAnswer(int ST, char* pounds) {
	char *Level[] = {"None(0)", "Light(1)", "Medium(2)", "Heavy(3)", "Extra-Heavy(4)"};
	double x = (ST * ST) / 5.0;
	double Xs[] = {
		x * 1.0,
		x * 2.0,
		x * 3.0,
		x * 6.0,
		x * 10.0
		};
	double lbs = atof(pounds);
	for(int i=0; i<5; ++i) {
		if ((Xs[i] < lbs) & (i == 4)) {
			puts("Too heavy");
			return;
			}
		if (Xs[i] >= lbs) {
			printf("%s\n", Level[i]);
			return; }
		}}

// =======================================================================================
void fourLevels(int ST) {
	int multiplier[] = {1, 2, 3, 6, 10};
	char *Level[] = {"       None(0)", "      Light(1)", "     Medium(2)",
		"      Heavy(3)", "Extra-Heavy(4)"};
	double x = (ST * ST) / 5.0;
	for(int lvl=0; lvl<5; ++lvl) {
		if ((ST < 8) & (lvl < 4))
			printf("%s: %.1f lbs.\n", Level[lvl], x * multiplier[lvl]);
		else
			printf("%s: %d lbs.\n", Level[lvl], (int)round(x * multiplier[lvl]));
	}
	puts(""); }

// ***************************************************************************************
void instructions() {
	puts("calc_Encumbrance   ST   [lbs]");
	puts("   ST:  ST value");
	puts("   lbs: currently carrying weight"); }
