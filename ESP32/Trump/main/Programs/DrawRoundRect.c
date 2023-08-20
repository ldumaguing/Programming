// *************************************************************************************************
void app_main() {
	ILI9341_init();
	initGFX();

	uint16_t c1 = 0xdff7;

	drawRoundRect(10, 10, 150, 150, 10, c1);

	renderScreenbuffer();
}

