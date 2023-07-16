#include <iostream>
#define SWAP_BYTES(color) ((uint16_t)(color>>8) | (uint16_t)(color<<8))

// RGB  5-6-5
int R [] = { 0, 15, 22, 25, 31 };
int G [] = { 0, 31, 33, 41, 49, 63 };
int B [] = { 0, 5, 15, 25, 31 };

void print_color(int r, int g, int b) {
	uint16_t rgb = 0;
	rgb = R[r];
	rgb = (rgb << 6) | G[g];
	rgb = (rgb << 5) | B[b];
	printf("0x%04x, ", SWAP_BYTES(rgb)); }

int main(void) {
	for (int r=0; r<5; r++) {
		for (int g=0; g<6; g++) {
			for (int b=0; b<5; b++) {
				print_color(r, g, b); }}}

	printf("\n"); }

