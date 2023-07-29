// *************************************************************************************************
// ********************************************************************************** mode0_demo.cpp
// *************************************************************************************************
void app_main(void) {
	ILI9341_init();
	while(1) {
		memset(screenbuffer, 0xE371, ILI9341_SIZE*2);
		ILI9341_render();
		sleep_ms(1000);
		memset(screenbuffer, 0xA324, ILI9341_SIZE*2);
		ILI9341_render();
		sleep_ms(1000);
	}
	
	
	
	/*
    mode0_init();
    
    mode0_set_cursor(0, 0);
    mode0_color_t fg = MODE0_WHITE;
    mode0_color_t bg = MODE0_BLACK;
    
    while (1) {
        mode0_print("Shawn Hyam\n");
        sleep_ms(500);
        // fg = (fg+1) % 16;
        fg = (mode0_color_t)((fg+1) % 16);
        if (fg == 0) {
            bg = (mode0_color_t)((bg+1) % 16);
            mode0_set_background(bg);
        }
        mode0_set_foreground(fg);

    }
*/
}

