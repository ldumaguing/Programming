// *************************************************************************************************
void app_main() {
	ILI9341_init();
	initGFX();

	uint16_t c1 = 0xdff7;

	drawPixel(10, 10, c1);

	renderScreenbuffer();
}

