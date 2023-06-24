#include <cstdint>
#include "gfxfont.h"

class MAGA_GFX {
	public:
		MAGA_GFX(int16_t w, int16_t h);

	protected:
		void charBounds(unsigned char c, int16_t *x, int16_t *y, int16_t *minx,
						int16_t *miny, int16_t *maxx, int16_t *maxy);
		int16_t WIDTH;        ///< This is the 'raw' display width - never changes
		int16_t HEIGHT;       ///< This is the 'raw' display height - never changes
		int16_t _width;       ///< Display width as modified by current rotation
		int16_t _height;      ///< Display height as modified by current rotation
		int16_t cursor_x;     ///< x location to start print()ing text
		int16_t cursor_y;     ///< y location to start print()ing text
		uint16_t textcolor;   ///< 16-bit background color for print()
		uint16_t textbgcolor; ///< 16-bit text color for print()
		uint8_t textsize_x;   ///< Desired magnification in X-axis of text to print()
		uint8_t textsize_y;   ///< Desired magnification in Y-axis of text to print()
		uint8_t rotation;     ///< Display rotation (0 thru 3)
		bool wrap;            ///< If set, 'wrap' text at right edge of display
		bool _cp437;          ///< If set, use correct CP437 charset (default is off)
		GFXfont *gfxFont;     ///< Pointer to special font
};


