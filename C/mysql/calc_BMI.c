#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>

void instructions(void);

// ***************************************************************************************
int main (int argc, char* argv[]) {
	if (argc <= 1) {
		instructions();
		return 0; }

	if (argc != 4) {
		instructions();
		return 0;}

	double inches = atof(argv[1]) * 12.0;
	inches += atof(argv[2]);
	double lbs = atof(argv[3]);

	double bmi = lbs / (inches * inches);
	bmi *= 703.0;
	
	if (bmi < 16.0) {
		puts("Severe Thinness");
		return 0; }
	if ((bmi >= 16.0) & (bmi < 17.0)) {
		puts("Moderate Thinness");
		return 0; }
	if ((bmi >= 17.0) & (bmi < 18.5)) {
		puts("Mild Thinness");
		return 0; }
	if ((bmi >= 18.5) & (bmi < 25.0)) {
		puts("Normal");
		return 0; }
	if ((bmi >= 25.0) & (bmi < 30.0)) {
		puts("Overweight");
		return 0; }
	if ((bmi >= 30.0) & (bmi < 35.0)) {
		puts("Obese Class I");
		return 0; }
	if ((bmi >= 35.0) & (bmi <= 40.0)) {
		puts("Obese Class II");
		return 0; }
	if (bmi > 40.0) {
		puts("Obese Class III");
		return 0; }

	return 0; }

// ***************************************************************************************
void instructions() {
	puts("calc_BMI   feet   inches   lbs.");
	puts("");
}
