#include <cstdint>
#include "gfxfont.h"

class MAGA_GFX {
	public:
		MAGA_GFX(int16_t w, int16_t h);
/*
		virtual void drawPixel(int16_t, int16_t, int16_t){};

		virtual void drawPixel(int16_t x, int16_t y, uint16_t color) = 0;
		virtual void startWrite(void);
		virtual void writePixel(int16_t x, int16_t y, uint16_t color);
		virtual void writeFillRect(int16_t x, int16_t y, int16_t w, int16_t h, uint16_t color);
		virtual void writeFastVLine(int16_t x, int16_t y, int16_t h, uint16_t color);
		virtual void writeFastHLine(int16_t x, int16_t y, int16_t w, uint16_t color);
		virtual void writeLine(int16_t x0, int16_t y0, int16_t x1, int16_t y1, uint16_t color);
		virtual void endWrite(void);

		virtual void setRotation(uint8_t r);
		virtual void invertDisplay(bool i);

		virtual void drawFastVLine(int16_t x, int16_t y, int16_t h, uint16_t color);
		virtual void drawFastHLine(int16_t x, int16_t y, int16_t w, uint16_t color);
		virtual void fillRect(int16_t x, int16_t y, int16_t w, int16_t h, uint16_t color);
		virtual void fillScreen(uint16_t color);

		// Optional and probably not necessary to change
		virtual void drawLine(int16_t x0, int16_t y0, int16_t x1, int16_t y1, uint16_t color);
		virtual void drawRect(int16_t x, int16_t y, int16_t w, int16_t h, uint16_t color);
*/
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





class GFXcanvas8 : public MAGA_GFX {
public:
  GFXcanvas8(uint16_t w, uint16_t h);
/*
  ~GFXcanvas8(void);
  void drawPixel(int16_t x, int16_t y, uint16_t color);
  void fillScreen(uint16_t color);
  void drawFastVLine(int16_t x, int16_t y, int16_t h, uint16_t color);
  void drawFastHLine(int16_t x, int16_t y, int16_t w, uint16_t color);
  uint8_t getPixel(int16_t x, int16_t y) const;
  uint8_t *getBuffer(void) const { return buffer; }

protected:
  uint8_t getRawPixel(int16_t x, int16_t y) const;
  void drawFastRawVLine(int16_t x, int16_t y, int16_t h, uint16_t color);
  void drawFastRawHLine(int16_t x, int16_t y, int16_t w, uint16_t color);
  uint8_t *buffer;
*/
};



