int main() {
	// possibly set ili9341_config parameters if your pins/spi port don't match
	ili.init();

	mode2_init();


	mode2_clear();
	
	for (int i=0; i<125; i++) {
		mode2_rect(i, i, 40, 40, SWAP_BYTES(colors[i]));
	}
	
	mode2_rect(310, 100, 1, 40, 0xffff);
	
	/*
	mode2_rect(0, 0, 25, 25, SWAP_BYTES(ILI9341_CYAN));
	mode2_rect(320/2, 240/2, 25, 25, SWAP_BYTES(ILI9341_CYAN));

	mode2_rect(10, 10, 25, 25, SWAP_BYTES(ILI9341_RED));
	mode2_rect(240/2, 320/2, 25, 25, SWAP_BYTES(ILI9341_RED));

	mode2_rect(200, 200, 25, 25, SWAP_BYTES(ILI9341_PINK));
*/

	mode2_render();

}
