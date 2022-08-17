#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include <sys/time.h>

void instructions(void);
int roll_3d6();
int get_seed();
void extremeLow(int, int, int, int);
void extremeHigh20(int, int, int, int);
void extremeHigh14(int, int, int, int);
void evaluate(char*, int, int);

// ***************************************************************************************
int main (int argc, char* argv[]) {
	if ((argc == 1) | (argc > 5)) {
		instructions();
		return 0;}

	int es1 = atoi(argv[1]);
	int es2 = atoi(argv[2]);
	int r1 = 0;
	int r2 = 0;
	if (argc == 5) {
		r1 = atoi(argv[3]);
		r2 = atoi(argv[4]); }
	else {
		r1 = roll_3d6();
		r2 = roll_3d6(); }

	if ((es1 <= 6) & (es2 <= 6)) {
		extremeLow(es1, es2, r1, r2);
		return 0; }
	if ((es1 >= 20) & (es2 >= 20)) {
		extremeHigh20(es1, es2, r1, r2);
		return 0; }
	if (((es1 >= 14) & (es2 >= 14)) & ((es1 < 20) & (es2 < 20))) {
		extremeHigh14(es1, es2, r1, r2);
		return 0; }

	evaluate("Player1", es1, r1);
	evaluate("Player2", es2, r2);

	return 0; }

// ***************************************************************************************
void extremeHigh14(int es1, int es2, int r1, int r2) {
	int lower = (es1 < es2) ? es1 : es2;
	int delta = abs(lower - 10);
	es1 -= delta;
	es2 -= delta;

	evaluate("Player1", es1, r1);
	evaluate("Player2", es2, r2); }

// ***************************************************************************************
void extremeHigh20(int es1, int es2, int r1, int r2) {
	int lower = (es1 < es2) ? es1 : es2;
	if (es1 < es2) {
		es1 = 10;
		es2 = es2 * (10.0 / lower); }
	else {
		es2 = 10;
		es1 = es1 * (10.0 / lower); }

	evaluate("Player1", es1, r1);
	evaluate("Player2", es2, r2); }

// ***************************************************************************************
void evaluate(char* player, int ES, int rolled) {
	if (rolled <= 4) {
		printf("%s: Critical Success\n", player);
		return; }
	if (rolled == 18) {
		printf("%s: Critical Failure\n", player);
		return; }
	if ((rolled == 17) & (ES <= 15)) {
		printf("%s: Critical Failure\n", player);
		return; }
	if ((rolled - ES) >= 10) {
		printf("%s: Critical Failure\n", player);
		return; }
	if ((ES - rolled) >= 10) {
		printf("%s: Critical Success\n", player);
		return; }

	int delta = abs(ES - rolled);
	if (ES >= rolled)
		printf("%s Succeed by %d\n", player, delta);
	else
		printf("%s Failed by %d\n", player, delta); }
		
// ***************************************************************************************
void extremeLow(int es1, int es2, int r1, int r2) {
	int lower = (es1 < es2) ? es1 : es2;
	int delta = 10 - lower;
	if (es1 < es2) {
		es1 = 10;
		es2 += delta; }
	else {
		es2 = 10;
		es1 += delta; }

	evaluate("Player1", es1, r1);
	evaluate("Player2", es2, r2); }

// ***************************************************************************************
int roll_3d6() {
	int rand_num, theSum = 0;
	srand(get_seed());

	for(int i=0; i<3; ++i) {
		rand_num = (rand() % 6) + 1;
		theSum += rand_num;
	}

	return theSum; }

// =======================================================================================
int get_seed() {
	struct timeval time_now;
	gettimeofday(&time_now, NULL);
	
	return time_now.tv_usec; }

// ***************************************************************************************
void instructions() {
	puts("calc_Contest   p1   p2   [r1]   [r2]");
	puts("   p1:   first player.s effective skill level");
	puts("   p2:   second player's effective skill level");
	puts("   [r1]: first player's 3d6 roll");
	puts("   [r2]: second player's 3d6 roll");
	puts("");
	puts("");
}
