#include <iostream>
#include <cstddef>
#include <cstring>

enum mode0_color_t {
    MODE0_BLACK,
    MODE0_BROWN,
    MODE0_RED,
    MODE0_BLUSH,
    MODE0_GRAY,
    MODE0_DESERT,
    MODE0_ORANGE,
    MODE0_YELLOW,
    MODE0_WHITE,
    MODE0_MIDNIGHT,
    MODE0_DARK_SLATE_GRAY,
    MODE0_GREEN,
    MODE0_YELLOW_GREEN,
    MODE0_BLUE,
    MODE0_PICTON_BLUE,
    MODE0_PALE_BLUE
};

int main(void)
{
	
	mode0_color_t fg = MODE0_WHITE;
	printf ("%d\n", fg);
	int x = (fg + 1) % 16;
	printf ("%d\n", x);
	fg = (mode0_color_t)x;
	printf ("%d\n", fg);
}




