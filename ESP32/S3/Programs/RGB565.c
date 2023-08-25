int img_width = 16;
uint16_t img[] = {
0000, 0000, 0000, f800, f800, f800, 07e0, 07e0, 07e0, 001f, 001f, 001f, ffff, ffff, ffff, ffff,
0000, 0000, 0000, f800, f800, f800, 07e0, 07e0, 07e0, 001f, 001f, 001f, ffff, ffff, ffff, ffff,
0000, 0000, 0000, f800, f800, f800, 07e0, 07e0, 07e0, 001f, 001f, 001f, ffff, ffff, ffff, ffff,
ffff, ffff, ffff, ffe0, ffe0, ffe0, 07ff, 07ff, 07ff, cd0b, cd0b, cd0b, ffff, ffff, ffff, ffff,
ffff, ffff, ffff, ffe0, ffe0, ffe0, 07ff, 07ff, 07ff, cd0b, cd0b, cd0b, ffff, ffff, ffff, ffff,
ffff, ffff, ffff, ffe0, ffe0, ffe0, 07ff, 07ff, 07ff, cd0b, cd0b, cd0b, ffff, ffff, ffff, ffff,
ffff, ffff, ffff, f81f, f81f, f81f, 63b0, 63b0, 63b0, fca0, fca0, fca0, ffff, ffff, ffff, ffff,
ffff, ffff, ffff, f81f, f81f, f81f, 63b0, 63b0, 63b0, fca0, fca0, fca0, ffff, ffff, ffff, ffff,
ffff, ffff, ffff, f81f, f81f, f81f, 63b0, 63b0, 63b0, fca0, fca0, fca0, ffff, ffff, ffff, ffff,
ffff, ffff, ffff, 0420, 0420, 0420, ffff, ffff, ffff, ffff, ffff, ffff, ffff, ffff, ffff, ffff,
ffff, ffff, ffff, 0420, 0420, 0420, ffff, ffff, ffff, ffff, ffff, ffff, ffff, ffff, ffff, ffff,
ffff, ffff, ffff, 0420, 0420, 0420, ffff, ffff, ffff, ffff, ffff, ffff, ffff, ffff, ffff, ffff,
ffff, ffff, ffff, ffff, ffff, ffff, ffff, ffff, ffff, ffff, ffff, ffff, ffff, ffff, ffff, ffff,
ffff, ffff, ffff, ffff, ffff, ffff, ffff, ffff, ffff, ffff, ffff, ffff, ffff, ffff, ffff, ffff,
ffff, ffff, ffff, ffff, ffff, ffff, ffff, ffff, ffff, ffff, ffff, ffff, ffff, ffff, ffff, ffff,
ffff, ffff, ffff, ffff, ffff, ffff, ffff, ffff, ffff, ffff, ffff, ffff, ffff, ffff, ffff, ffff,
};

void app_main(void) {
	int counter = 0;
	for(int j=0; j<16; j++) {
		for(int i=0; i<img_width; i++) {
			screenbuffer[i + j*img_width] = img[counter];
			counter++; 
		}
	}

	renderScreenbuffer();
}

