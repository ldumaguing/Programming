// *************************************************************************************************
// ******************************************************************************************** MAIN
// *************************************************************************************************
int main() {
    mode0_init();
    
    mode0_set_cursor(0, 0);
    mode0_color_t fg = MODE0_WHITE;
    mode0_color_t bg = MODE0_BLACK;
    
    while (1) {
        mode0_print("Retro Computer (c) 2021, Shawn Hyam\n");
        // sleep_ms(500);
        int x = (fg+1) % 16;
        fg = (mode0_color_t)x;
        // fg = (fg+1) % 16;
        if (fg == 0) {
			int y = (bg+1) % 16;
			bg = (mode0_color_t)y;
            // bg = (bg+1) % 16;
            mode0_set_background(bg);
        }
        mode0_set_foreground(fg);

    }
}

