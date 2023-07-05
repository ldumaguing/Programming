// *************************************************************************************************
// ********************************************************************************** mode0_demo.cpp
// *************************************************************************************************
int main() {
    mode0_init();
    
    mode0_set_cursor(0, 0);
    mode0_color_t fg = MODE0_WHITE;
    mode0_color_t bg = MODE0_BLACK;
    
    while (1) {
        mode0_print("Shawn Hyam (Larry was here 3)\n");
        sleep_ms(500);
        fg = (mode0_color_t)((fg+1) % 16);
        if (fg == 0) {
            bg = (mode0_color_t)((bg+1) % 16);
            mode0_set_background(bg);
        }
        mode0_set_foreground(fg);

    }
}

