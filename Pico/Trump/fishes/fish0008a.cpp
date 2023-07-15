#include <iostream>

// RGB  5-6-5
int RB [] = { 0, 7, 15, 23, 31 };
int G [] = { 0, 15, 31, 47, 63 };

void print_color(int r, int g, int b) {
	uint16_t rgb = 0;
	rgb = RB[r];
	rgb = (rgb << 6) | G[g];
	rgb = (rgb << 5) | RB[b];
	printf("0x%04x, ", rgb); }

int main(void) {
	for (int r=0; r<5; r++) {
		for (int g=0; g<5; g++) {
			for (int b=0; b<5; b++) {
				print_color(r, g, b); }}}

	printf("\n"); }

