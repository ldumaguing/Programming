// *************************************************************************************************
void app_main() {
	ILI9341_init();
	initGFX();

	uint16_t c1 = 0xdff7;

	drawTriangle(10, 10, 30, 30, 60, 20, c1);

	renderScreenbuffer();
}

