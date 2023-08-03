int main() {
	// possibly set ili9341_config parameters if your pins/spi port don't match
	ili.init();

	mode2_init();


	mode2_clear();
	/*
	for (int i=0; i<150; i++) {
		if (i%15)
			mode2_rect(i, i-15, 40, 40, colors[i]);
		else
			mode2_rect(i, i, 40, 40, colors[i]);
	}
	
	mode2_rect(200, 100, 1, 100, 0xffff);
	*/





	while(1) {
		memset(mode2_buffer, 0xE381, SIZE*2);
		mode2_render();
		sleep_ms(1000);
		memset(mode2_buffer, 0xA334, SIZE*2);
		mode2_render();
		sleep_ms(1000);
	}
	











	/*
	mode2_rect(0, 0, 25, 25, SWAP_BYTES(ILI9341_CYAN));
	mode2_rect(320/2, 240/2, 25, 25, SWAP_BYTES(ILI9341_CYAN));

	mode2_rect(10, 10, 25, 25, SWAP_BYTES(ILI9341_RED));
	mode2_rect(240/2, 320/2, 25, 25, SWAP_BYTES(ILI9341_RED));

	mode2_rect(200, 200, 25, 25, SWAP_BYTES(ILI9341_PINK));
*/

	mode2_render();

}
