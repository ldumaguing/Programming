#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/time.h>

void instructions(void);
int get_seed();
int roll_3d6();
void evaluate(int, int);

// ***************************************************************************************
int main (int argc, char* argv[]) {
	if (argc <= 1) {
		instructions();
		return 0; }

	int rolled = 0;
	if (argc == 2)
		rolled = roll_3d6();
	else {
		rolled = atoi(argv[2]);
		if ((rolled < 3) | (rolled > 18))
			rolled = 10;
		}

	evaluate(atoi(argv[1]), rolled);

	return 0; }

// ***************************************************************************************
void evaluate(int ES, int rolled) {
	if (rolled <= 4) {
		puts("Critical Success");
		return; }
	if (rolled == 18) {
		puts("Critical Failure");
		return; }
	if ((rolled == 17) & (ES <= 15)) {
		puts("Critical Failure");
		return; }
	if ((rolled - ES) >= 10) {
		puts("Critical Failure");
		return; }
	if ((ES - rolled) >= 10) {
		puts("Critical Success");
		return; }

	int delta = abs(ES - rolled);
	if (ES >= rolled)
		printf("Succeed by %d\n", delta);
	else
		printf("Failed by %d\n", delta); }

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
	puts("roll_Attack   ES   [manual roll]");
	puts("   ES: Effective Skill number");
	puts("");
}
