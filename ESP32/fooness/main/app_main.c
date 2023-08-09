void app_main(void) {
	ILI9341_init();


	while(1) {
		ACHTUNG1;
		ACHTUNG2;
	}
/*
	while(1) {
		memset(screenbuffer, 0xE382, ILI9341_SIZE*2);
		ILI9341_render();
		ACHTUNG;
		memset(screenbuffer, 0xA335, ILI9341_SIZE*2);
		ILI9341_render();
		ACHTUNG;
	}
*/
}

