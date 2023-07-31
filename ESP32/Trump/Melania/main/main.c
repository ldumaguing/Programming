void app_main(void) {
	ILI9341_init();
	while(1) {
		memset(screenbuffer, 0xE371, ILI9341_SIZE*2);
		ILI9341_render();
		sleep_ms(10);
		memset(screenbuffer, 0xA324, ILI9341_SIZE*2);
		ILI9341_render();
		sleep_ms(10);
	}
}

