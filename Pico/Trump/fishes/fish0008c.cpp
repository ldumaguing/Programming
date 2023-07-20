#include <iostream>
#define SWAP_BYTES(color) ((uint16_t)(color>>8) | (uint16_t)(color<<8))

// RGB  5-6-5
int R [] = { 0, 31 };
int G [] = { 0, 63 };
int B [] = { 0, 31 };

void print_color(int r, int g, int b) {
	uint16_t rgb = 0;
	rgb = R[r];
	rgb = (rgb << 6) | G[g];
	rgb = (rgb << 5) | B[b];
	printf("0x%04x, ", SWAP_BYTES(rgb)); }

int main(void) {
	for (int r=0; r<2; r++) {
		for (int g=0; g<2; g++) {
			for (int b=0; b<2; b++) {
				print_color(r, g, b); }}}

	printf("\n"); }

