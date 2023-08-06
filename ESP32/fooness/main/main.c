void app_main(void) {
	ILI9341_init();
	ACHTUNG;ACHTUNG;ACHTUNG;
	while(1) {
		memset(screenbuffer, 0xE382, ILI9341_SIZE*2);
		ILI9341_render();
		ACHTUNG;
		memset(screenbuffer, 0xA335, ILI9341_SIZE*2);
		ILI9341_render();
		ACHTUNG;
	}
}

