#include <stdio.h>
#include <stdlib.h>

void instructions(void);
void get_OtherHex(int, int, int, int []);
void get_HexSpineID(int, int, int);

// ***************************************************************************************
int main (int argc, char *argv[]) {
	if ((argc == 1)
	| (argc > 5)) {
		instructions();
		return 0; }

	int FROM[] = {atoi(argv[1]), atoi(argv[2])};
	int TO[] = {atoi(argv[3]), atoi(argv[4])};
	int queryHex[] = {0, 0};

	if ((FROM[0] == TO[0]) & (FROM[1] == TO[1])) return -1;

	for (int d=0; d<6; d++) {
		get_OtherHex(FROM[0], FROM[1], d, queryHex);
		// printf("%d %d\n", queryHex[0], queryHex[1]);
		if ((queryHex[0] == TO[0]) & (queryHex[1] == TO[1])) {
			get_HexSpineID(FROM[0], FROM[1], d);
			return 0;
			}
	}


	return -1; }

// ***************************************************************************************
void get_HexSpineID (int x, int y, int d) {
	if (x % 2) {  // x is odd
		switch(d) {
			case 0:
				printf("%d %d D\n", --x, y);
				break;
			case 1:
				printf("%d %d E\n", ++x, y);
				break;
			case 2:
				printf("%d %d F\n", ++x, ++y);
				break;
			case 3:
				printf("%d %d D\n", --x, ++y);
				break;
			case 4:
				printf("%d %d B\n", --x, ++y);
				break;
			default:
				printf("%d %d C\n", --x, y); }

		return; }


	if (d == 3) {
		printf("%d %d A\n", x, ++y);
		return; }

	// printf("%d %d %c\n", x, y, c); 
	if (d == 0) {
		printf("%d %d A\n", x, y);
		return; }

	if (d == 1) {
		printf("%d %d B\n", x, y);
		return; }
	if (d == 2) {
		printf("%d %d C\n", x, y);
		return; }
	if (d == 4) {
		printf("%d %d E\n", x, y);
		return; }
	if (d == 5) {
		printf("%d %d F\n", x, y);
		return; }








	}

// ***************************************************************************************
void get_OtherHex (int x0, int y0, int d, int queryHex[]) {
	if (d == 0) {
		queryHex[0] = x0;
		queryHex[1] = --y0;
		return; }
	if (d == 3) {
		queryHex[0] = x0;
		queryHex[1] = ++y0;
		return; }

	int X = d < 3 ? x0 + 1 : x0 - 1;

	if (x0 % 2) {  // X is odd
		if ((d == 2) | (d == 4)) {
			queryHex[0] = X;
			queryHex[1] = ++y0; }
		else {
			queryHex[0] = X;
			queryHex[1] = y0; }
			return; }
		
	if ((d == 2) | (d == 4)) {
		queryHex[0] = X;
		queryHex[1] = y0;
		}
	else {
		queryHex[0] = X;
		queryHex[1] = --y0; }}

// ***************************************************************************************
void instructions() {
	puts("get_SharedSpine   x0   y0   x1   y1");
	puts("   x0: first hex's X location");
	puts("   y0: first hex's Y location");
	puts("   x1: second hex's X location");
	puts("   y1: second hex's Y location");
	puts("   *****");
	puts("   OUTPUT: Spine ID");
	puts("");
	puts("               _______");
	puts("              /       \\");
	puts("             /         \\");
	puts("            /   x0,y0   \\_______");
	puts("            \\           /       \\");
	puts("             \\         S         \\");
	puts("              \\_______/   x1,y1   \\");
	puts("                      \\           /");
	puts("                       \\         /");
	puts("                        \\_______/");
	puts(""); }
