// *************************************************************************************************
void app_main() {
	ILI9341_init();
	initGFX();

	uint16_t c1 = 0xf7df;

	fillRoundRect(10, 10, 150, 130, 10, c1);

	renderScreenbuffer();
}

