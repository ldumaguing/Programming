// *************************************************************************************************
void app_main() {
	ILI9341_init();
	initGFX();

	uint16_t c1 = 0xdff7;

	drawCircle(120, 120, 10, c1);

	renderScreenbuffer();
}

