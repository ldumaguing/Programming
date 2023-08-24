void app_main(void) {
	ILI9341_init();
	init_GFX();

	drawPixel(3, 3, colors[0]);
	drawLine(6, 6, 9, 9, colors[0]);
	drawRect(12, 12, 13, 13, colors[0]);
	drawCircle(18, 18, 3, colors[0]);
	drawTriangle(29, 10, 30, 30, 60, 20, colors[0]);
	drawRoundRect(65, 10, 20, 20, 5, colors[0]);

	fillCircle(10, 50, 10, colors[1]);
	fillRect(23, 40, 20, 20, colors[1]);
	fillRoundRect(46, 40, 20, 20, 5, colors[2]);
	fillTriangle(50, 50, 130, 130, 160, 120, colors[3]);

	renderScreenbuffer();
}

