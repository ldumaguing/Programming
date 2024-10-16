#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/time.h>

void instructions(void);
int get_seed();

// ***************************************************************************************
int main (int argc, char* argv[]) {
	if (argc <= 1) {
		instructions();
		return 0; }

	char buff[16];
	strcpy(buff, argv[1]);
	int original_len = strlen(buff);

	int dices = 0;
	int modifier = 0;
	
	char *p = NULL;
	p = strchr(buff, 'd');
	if (p == NULL) {
		puts("no 'd'");
		return 0; }
	int x = strlen(p);
	x = original_len - x;
	buff[x] = 0;
	dices = atoi(buff);
	modifier = atoi(++p);


	int rand_num, theSum = 0;
	srand(get_seed());

	for(int i=0; i<dices; ++i) {
		rand_num = (rand() % 6) + 1;
		theSum += rand_num;
		// printf("%d\n", rand_num);
	}
	theSum += modifier;
	printf("%d\n", theSum);


	return 0; }

// =======================================================================================
int get_seed() {
	struct timeval time_now;
	gettimeofday(&time_now, NULL);
	// printf ("%ld\n", time_now.tv_usec);
	
	return time_now.tv_usec; }

// ***************************************************************************************
void instructions() {
	puts("roll_dice   XdY");
	puts("   X: number of dice");
	puts("   Y: modifier (eg -1 or +1");
	puts("");
}
