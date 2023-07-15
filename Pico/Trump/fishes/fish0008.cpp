#include <iostream>

// RGB  5-6-5
int RB [] = { 0, 5, 10, 15, 21, 26, 31 };
int G [] = { 0, 10, 21, 31, 42, 53, 63 };

void print_color(int r, int g, int b) {
	uint16_t rgb = 0;
	rgb = RB[r];
	rgb = (rgb << 6) | G[g];
	rgb = (rgb << 5) | RB[b];
	printf("0x%04x, ", rgb);
}

int main(void) {
	for (int r=0; r<7; r++) {
		for (int g=0; g<7; g++) {
			for (int b=0; b<7; b++) {
				print_color(r, g, b);
			}
		}
	}
	printf("\n");
}


