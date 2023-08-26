// *************************************************************************************************
void app_main() {
	ILI9341_init();
	uint16_t c1 = 0xdff7;
	uint16_t c2 = 0xf7df;
	int h = ILI9341_SIZE / 2;

	for(int i=0; i<h; i++) {
		screenbuffer[i] = c1;
	}

	for(int i=h; i<ILI9341_SIZE; i++) {
		screenbuffer[i] = c2;
	}

	ILI9341_write_data(screenbuffer, ILI9341_SIZE*2);
}

