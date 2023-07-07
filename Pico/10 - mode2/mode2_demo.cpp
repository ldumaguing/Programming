int main() {
	// possibly set ili9341_config parameters if your pins/spi port don't match
	ili.init();

	mode2_init();

	uint16_t x = 0;
	while (1) {
    	mode2_clear();
		mode2_rect(x, 40, 40, 80, 0x3F5F);
		mode2_render();

		x += 1;
		x = x%280;
	}
}

