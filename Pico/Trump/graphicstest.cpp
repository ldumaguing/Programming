// *************** Fri Jun 30 01:11:37 AM EDT 2023
// *************************************************************************************************
#include <cstdint>
#include <stdio.h>
#include <cstdlib>
#include <cstring>

// Register names from Peter Barrett's Microtouch code
#define ILI9341_SOFTRESET 0x01
#define ILI9341_SLEEPIN 0x10
#define ILI9341_SLEEPOUT 0x11
#define ILI9341_NORMALDISP 0x13
#define ILI9341_INVERTOFF 0x20
#define ILI9341_INVERTON 0x21
#define ILI9341_GAMMASET 0x26
#define ILI9341_DISPLAYOFF 0x28
#define ILI9341_DISPLAYON 0x29
#define ILI9341_COLADDRSET 0x2A
#define ILI9341_PAGEADDRSET 0x2B
#define ILI9341_MEMORYWRITE 0x2C
#define ILI9341_PIXELFORMAT 0x3A
#define ILI9341_FRAMECONTROL 0xB1
#define ILI9341_DISPLAYFUNC 0xB6
#define ILI9341_ENTRYMODE 0xB7
#define ILI9341_POWERCONTROL1 0xC0
#define ILI9341_POWERCONTROL2 0xC1
#define ILI9341_VCOMCONTROL1 0xC5
#define ILI9341_VCOMCONTROL2 0xC7
#define ILI9341_MEMCONTROL 0x36
#define ILI9341_MADCTL 0x36

#define ILI9341_MADCTL_MY 0x80
#define ILI9341_MADCTL_MX 0x40
#define ILI9341_MADCTL_MV 0x20
#define ILI9341_MADCTL_ML 0x10
#define ILI9341_MADCTL_RGB 0x00
#define ILI9341_MADCTL_BGR 0x08
#define ILI9341_MADCTL_MH 0x04

#define ILI9341_NOP 0x00     ///< No-op register
#define ILI9341_SWRESET 0x01 ///< Software reset register
#define ILI9341_RDDID 0x04   ///< Read display identification information
#define ILI9341_RDDST 0x09   ///< Read Display Status

#define ILI9341_SLPIN 0x10  ///< Enter Sleep Mode
#define ILI9341_SLPOUT 0x11 ///< Sleep Out
#define ILI9341_PTLON 0x12  ///< Partial Mode ON
#define ILI9341_NORON 0x13  ///< Normal Display Mode ON

#define ILI9341_RDMODE 0x0A     ///< Read Display Power Mode
#define ILI9341_RDMADCTL 0x0B   ///< Read Display MADCTL
#define ILI9341_RDPIXFMT 0x0C   ///< Read Display Pixel Format
#define ILI9341_RDIMGFMT 0x0D   ///< Read Display Image Format
#define ILI9341_RDSELFDIAG 0x0F ///< Read Display Self-Diagnostic Result

#define ILI9341_INVOFF 0x20   ///< Display Inversion OFF
#define ILI9341_INVON 0x21    ///< Display Inversion ON
#define ILI9341_GAMMASET 0x26 ///< Gamma Set
#define ILI9341_DISPOFF 0x28  ///< Display OFF
#define ILI9341_DISPON 0x29   ///< Display ON

#define ILI9341_CASET 0x2A ///< Column Address Set
#define ILI9341_PASET 0x2B ///< Page Address Set
#define ILI9341_RAMWR 0x2C ///< Memory Write
#define ILI9341_RAMRD 0x2E ///< Memory Read

#define ILI9341_PTLAR 0x30    ///< Partial Area
#define ILI9341_VSCRDEF 0x33  ///< Vertical Scrolling Definition
#define ILI9341_MADCTL 0x36   ///< Memory Access Control
#define ILI9341_VSCRSADD 0x37 ///< Vertical Scrolling Start Address
#define ILI9341_PIXFMT 0x3A   ///< COLMOD: Pixel Format Set

#define ILI9341_FRMCTR1 0xB1 ///< Frame Rate Control (In Normal Mode/Full Colors)
#define ILI9341_FRMCTR2 0xB2 ///< Frame Rate Control (In Idle Mode/8 colors)
#define ILI9341_FRMCTR3 0xB3 ///< Frame Rate control (In Partial Mode/Full Colors)
#define ILI9341_INVCTR 0xB4  ///< Display Inversion Control
#define ILI9341_DFUNCTR 0xB6 ///< Display Function Control

#define ILI9341_PWCTR1 0xC0 ///< Power Control 1
#define ILI9341_PWCTR2 0xC1 ///< Power Control 2
#define ILI9341_PWCTR3 0xC2 ///< Power Control 3
#define ILI9341_PWCTR4 0xC3 ///< Power Control 4
#define ILI9341_PWCTR5 0xC4 ///< Power Control 5
#define ILI9341_VMCTR1 0xC5 ///< VCOM Control 1
#define ILI9341_VMCTR2 0xC7 ///< VCOM Control 2

#define ILI9341_RDID1 0xDA ///< Read ID 1
#define ILI9341_RDID2 0xDB ///< Read ID 2
#define ILI9341_RDID3 0xDC ///< Read ID 3
#define ILI9341_RDID4 0xDD ///< Read ID 4

#define ILI9341_GMCTRP1 0xE0 ///< Positive Gamma Correction
#define ILI9341_GMCTRN1 0xE1 ///< Negative Gamma Correction
//#define ILI9341_PWCTR6     0xFC

#define BLACK   0x0000
#define BLUE    0x001F
#define RED     0xF800
#define GREEN   0x07E0
#define CYAN    0x07FF
#define MAGENTA 0xF81F
#define YELLOW  0xFFE0
#define WHITE   0xFFFF

#define LCD_CS  0
#define LCD_CD  1
#define LCD_WR  2
#define LCD_RD  3
#define LCD_RST 4
#define LCD_D0  5

#define LCD_WIDTH  240
#define LCD_HEIGHT 320

// *************************************************************************************************
// *************************************************************************************************
struct MAGA_GFX {
	MAGA_GFX(int16_t w, int16_t h);

	protected:
//		void charBounds(unsigned char c, int16_t *x, int16_t *y, int16_t *minx, int16_t *miny, int16_t *maxx, int16_t *maxy);
		int16_t WIDTH;        ///< This is the 'raw' display width - never changes
		int16_t HEIGHT;       ///< This is the 'raw' display height - never changes
		int16_t _width;       ///< Display width as modified by current rotation
		int16_t _height;      ///< Display height as modified by current rotation
//		int16_t cursor_x;     ///< x location to start print()ing text
//		int16_t cursor_y;     ///< y location to start print()ing text
//		uint16_t textcolor;   ///< 16-bit background color for print()
//		uint16_t textbgcolor; ///< 16-bit text color for print()
//		uint8_t textsize_x;   ///< Desired magnification in X-axis of text to print()
//		uint8_t textsize_y;   ///< Desired magnification in Y-axis of text to print()
//		uint8_t rotation;     ///< Display rotation (0 thru 3)
//		bool wrap;            ///< If set, 'wrap' text at right edge of display
//		bool _cp437;          ///< If set, use correct CP437 charset (default is off)
//		GFXfont *gfxFont;     ///< Pointer to special font
};

// *************************************************************************************************
MAGA_GFX::MAGA_GFX(int16_t w, int16_t h) : WIDTH(w), HEIGHT(h) {
	_width = WIDTH;
	_height = HEIGHT;
//	rotation = 0;
//	cursor_y = cursor_x = 0;
//	textsize_x = textsize_y = 1;
//	textcolor = textbgcolor = 0xFFFF;
//	wrap = true;
//	_cp437 = false;
//	gfxFont = NULL;
};

// *************************************************************************************************
// *************************************************************************************************
struct MAGA_TFTLCD : public MAGA_GFX {
	MAGA_TFTLCD(uint8_t cs, uint8_t cd, uint8_t wr, uint8_t rd, uint8_t rst, uint8_t d0, int16_t w,
		int16_t h);

	void foo();
	void reset();

	// ***** GPIO Pins manipulations
	void CD_Command();
	void CD_Data();

	void CS_Active();
	void CS_Idle();

	// void RD_Idle();

	void WR_Idle();
	void WR_Strobe();

	// ***** Mine
	void sio_write(const uint8_t *src, size_t len);
	void sio_write(uint16_t *src, size_t len);
	void init_pins();

	// ***** GPIO functions
	void MAGA_gpio_init_mask(uint32_t aNum);
	void MAGA_gpio_set_dir_out_masked(uint32_t aNum);
	void MAGA_gpio_set_mask(uint32_t aNum);
	void MAGA_gpio_put(uint32_t aPin, bool yN);
	void MAGA_gpio_put_masked(uint32_t mask, uint32_t val);

	// ***** ILI9341 stuffs
	void ili9341_set_command(uint8_t cmd);
	void ili9341_command_param(uint8_t data);
	void ili9341_init();
	void ili9341_write_data(const uint8_t *buffer, int bytes);
	void ili9341_write_data(uint16_t *buffer, int bytes);

	protected:
		uint8_t _cs, _cd, _wr, _rd, _rst, _d0;
};

// *************************************************************************************************
MAGA_TFTLCD::MAGA_TFTLCD(uint8_t cs, uint8_t cd, uint8_t wr, uint8_t rd, uint8_t rst, uint8_t d0,
	int16_t w, int16_t h) : MAGA_GFX(w, h) {
	_cs = cs;
	_cd = cd;
	_wr = wr;
	_rd = rd;
	_rst = rst;
	_d0 = d0;
};

// ===============================================
void MAGA_TFTLCD::foo() {
	printf("foo: %d, %d, %d\n", _width, WIDTH, _cd);
}

// ===============================================
void MAGA_TFTLCD::reset() {
	ili9341_set_command(0x01); //soft reset
	// sleep_ms(1000);
}

// ===============================================
void MAGA_TFTLCD::CD_Command() {
	MAGA_gpio_put(_cd, 0);
};

// ===============================================
void MAGA_TFTLCD::CD_Data() {
	MAGA_gpio_put(_cd, 1);
};
// ===============================================
void MAGA_TFTLCD::CS_Active() {
	MAGA_gpio_put(_cs, 0);
};

// ===============================================
void MAGA_TFTLCD::CS_Idle() {
	MAGA_gpio_put(_cs, 1);
};

// ===============================================
void MAGA_TFTLCD::WR_Idle() {
	MAGA_gpio_put(_wr, 1);
};

// ===============================================
void MAGA_TFTLCD::WR_Strobe() {
	MAGA_gpio_put(_wr, 0);
	MAGA_gpio_put(_wr, 1);
};

// ===============================================
void MAGA_TFTLCD::sio_write(const uint8_t *src, size_t len) {
	do {
		MAGA_gpio_put_masked((0xff << LCD_D0), (*src << LCD_D0));

		WR_Strobe();

		len--;
		src++;
	} while (len > 0);
};

// -----------------------------------------------
void MAGA_TFTLCD::sio_write(uint16_t *src, size_t len) {
	do {
		MAGA_gpio_put_masked((0xff << LCD_D0), (*src << LCD_D0));

		WR_Strobe();

		len--;
		src++;
	} while (len > 0);
};

// ===============================================
void MAGA_TFTLCD::init_pins() {
	MAGA_gpio_init_mask(0x1fff);
	MAGA_gpio_set_dir_out_masked(0x1fff);
	MAGA_gpio_set_mask(0x1fff);
};

// ===============================================
// ***** GPIO functions
void MAGA_TFTLCD::MAGA_gpio_init_mask(uint32_t aNum) {
	printf("gpio_init_mask(0x%x)\n", aNum);
};

void MAGA_TFTLCD::MAGA_gpio_set_dir_out_masked(uint32_t aNum) {
	printf("gpio_set_dir_out_masked(0x%x)\n", aNum);
};

void MAGA_TFTLCD::MAGA_gpio_set_mask(uint32_t aNum) {
	printf("gpio_set_mask(0x%x)\n", aNum);
};

void MAGA_TFTLCD::MAGA_gpio_put(uint32_t aPin, bool yN) {
	printf("gpio_put(0x%x, %d)\n", aPin, yN);
};

void MAGA_TFTLCD::MAGA_gpio_put_masked(uint32_t mask, uint32_t val) {
	printf("gpio_put_masked(0x%x, %d)\n", mask, val);
};

// ===============================================
// ***** ILI9341 stuffs
void MAGA_TFTLCD::ili9341_set_command(uint8_t cmd) {
    CS_Active();
    CD_Command();
    sio_write(&cmd, 1);
    CD_Data();
    CS_Idle();
};

void MAGA_TFTLCD::ili9341_command_param(uint8_t data) {
    CS_Active();
    sio_write(&data, 1);
    CS_Idle();
};

void MAGA_TFTLCD::ili9341_init() {
	init_pins();

	ili9341_set_command(ILI9341_GAMMASET);
	ili9341_command_param(0x01);

	// positive gamma correction
	ili9341_set_command(ILI9341_GMCTRP1);
	ili9341_write_data((const uint8_t[15]){ 0x0f, 0x31, 0x2b, 0x0c, 0x0e, 0x08, 0x4e, 0xf1, 0x37, 0x07, 0x10, 0x03, 0x0e, 0x09, 0x00 }, 15);
// uint8_t X[15] = { 0x0f, 0x31, 0x2b, 0x0c, 0x0e, 0x08, 0x4e, 0xf1, 0x37, 0x07, 0x10, 0x03, 0x0e, 0x09, 0x00 };
// ili9341_write_data(X, 15);

	// negative gamma correction
	ili9341_set_command(ILI9341_GMCTRN1);
	ili9341_write_data((const uint8_t[15]){ 0x00, 0x0e, 0x14, 0x03, 0x11, 0x07, 0x31, 0xc1, 0x48, 0x08, 0x0f, 0x0c, 0x31, 0x36, 0x0f }, 15);
// uint8_t Y[15] = { 0x00, 0x0e, 0x14, 0x03, 0x11, 0x07, 0x31, 0xc1, 0x48, 0x08, 0x0f, 0x0c, 0x31, 0x36, 0x0f };
// ili9341_write_data(Y, 15);

	// memory access control
	ili9341_set_command(ILI9341_MADCTL);
	ili9341_command_param(0x48);

	// pixel format
	ili9341_set_command(ILI9341_PIXFMT);
	ili9341_command_param(0x55);  // 16-bit

	// frame rate; default, 70 Hz
	ili9341_set_command(ILI9341_FRMCTR1);
	ili9341_command_param(0x00);
	ili9341_command_param(0x1B);

	// exit sleep
	ili9341_set_command(ILI9341_SLPOUT);

	// display on
	ili9341_set_command(ILI9341_DISPON);

	// column address set
	ili9341_set_command(ILI9341_CASET);
	ili9341_command_param(0x00);
	ili9341_command_param(0x00);  // start column
	ili9341_command_param(0x00);
	ili9341_command_param(0xef);  // end column -> 239

	// page address set
	ili9341_set_command(ILI9341_PASET);
	ili9341_command_param(0x00);
	ili9341_command_param(0x00);  // start page
	ili9341_command_param(0x01);
	ili9341_command_param(0x3f);  // end page -> 319

	ili9341_set_command(ILI9341_RAMWR);
};

void MAGA_TFTLCD::ili9341_write_data(const uint8_t *buffer, int bytes) {
    CS_Active();
    sio_write(buffer, bytes);
    CS_Idle();
};

void MAGA_TFTLCD::ili9341_write_data(uint16_t *buffer, int bytes) {
    CS_Active();
    sio_write(buffer, bytes);
    CS_Idle();
};

MAGA_TFTLCD tft(LCD_CS, LCD_CD, LCD_WR, LCD_RD, LCD_RST, LCD_D0, LCD_WIDTH, LCD_HEIGHT);

// *************************************************************************************************
// *************************************************************************************************
// ARNE-16 palette converted to RGB565 -- https://lospec.com/palette-list/arne-16
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

void mode0_init();
void mode0_clear(mode0_color_t color);
void mode0_draw_screen();
void mode0_draw_region(uint8_t x, uint8_t y, uint8_t width, uint8_t height);
void mode0_scroll_vertical(int8_t amount);
void mode0_set_foreground(mode0_color_t color);
void mode0_set_background(mode0_color_t color);
void mode0_set_cursor(uint8_t x, uint8_t y);
uint8_t mode0_get_cursor_x();
uint8_t mode0_get_cursor_y();
void mode0_print(const char *s);
void mode0_write(const char *s, int len);
void mode0_putc(char c);
void mode0_show_cursor();
void mode0_hide_cursor();

// Won't redraw until the matching _end is invoked.
void mode0_begin();
void mode0_end();

// *************************************************************************************************
// *************************************************************************************************
/* Character graphics mode */

// Characters are 8x12 -- characters start at (x:1,y:1) and are 5x7 in size, so
// it is possible to not display the full area. This display mode actually treats
// them as 6x10, starting at (x:1,y:0)
static const uint8_t font_data[95][12] = {
    { 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 },
    { 0x00, 0x10, 0x10, 0x10, 0x10, 0x10, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00 },
    { 0x00, 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 },
    { 0x00, 0x00, 0x28, 0x7C, 0x28, 0x7C, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00 },
    { 0x00, 0x10, 0x3C, 0x40, 0x38, 0x04, 0x78, 0x10, 0x00, 0x00, 0x00, 0x00 },
    { 0x00, 0x60, 0x64, 0x08, 0x10, 0x20, 0x4C, 0x0C, 0x00, 0x00, 0x00, 0x00 },
    { 0x00, 0x20, 0x50, 0x50, 0x20, 0x54, 0x48, 0x34, 0x00, 0x00, 0x00, 0x00 },
    { 0x00, 0x10, 0x10, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 },
    { 0x00, 0x08, 0x10, 0x20, 0x20, 0x20, 0x10, 0x08, 0x00, 0x00, 0x00, 0x00 },
    { 0x00, 0x20, 0x10, 0x08, 0x08, 0x08, 0x10, 0x20, 0x00, 0x00, 0x00, 0x00 },
    { 0x00, 0x00, 0x10, 0x54, 0x38, 0x38, 0x54, 0x10, 0x00, 0x00, 0x00, 0x00 },
    { 0x00, 0x00, 0x10, 0x10, 0x7C, 0x10, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00 },
    { 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x18, 0x18, 0x10, 0x20, 0x00, 0x00 },
    { 0x00, 0x00, 0x00, 0x00, 0x7C, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 },
    { 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x18, 0x18, 0x00, 0x00, 0x00, 0x00 },
    { 0x00, 0x00, 0x04, 0x08, 0x10, 0x20, 0x40, 0x00, 0x00, 0x00, 0x00, 0x00 },
    { 0x00, 0x38, 0x44, 0x4C, 0x54, 0x64, 0x44, 0x38, 0x00, 0x00, 0x00, 0x00 },
    { 0x00, 0x10, 0x30, 0x10, 0x10, 0x10, 0x10, 0x38, 0x00, 0x00, 0x00, 0x00 },
    { 0x00, 0x38, 0x44, 0x04, 0x38, 0x40, 0x40, 0x7C, 0x00, 0x00, 0x00, 0x00 },
    { 0x00, 0x38, 0x44, 0x04, 0x18, 0x04, 0x44, 0x38, 0x00, 0x00, 0x00, 0x00 },
    { 0x00, 0x08, 0x18, 0x28, 0x48, 0x7C, 0x08, 0x08, 0x00, 0x00, 0x00, 0x00 },
    { 0x00, 0x7C, 0x40, 0x78, 0x04, 0x04, 0x44, 0x38, 0x00, 0x00, 0x00, 0x00 },
    { 0x00, 0x18, 0x20, 0x40, 0x78, 0x44, 0x44, 0x38, 0x00, 0x00, 0x00, 0x00 },
    { 0x00, 0x7C, 0x04, 0x08, 0x10, 0x20, 0x40, 0x40, 0x00, 0x00, 0x00, 0x00 },
    { 0x00, 0x38, 0x44, 0x44, 0x38, 0x44, 0x44, 0x38, 0x00, 0x00, 0x00, 0x00 },
    { 0x00, 0x38, 0x44, 0x44, 0x3C, 0x04, 0x08, 0x30, 0x00, 0x00, 0x00, 0x00 },
    { 0x00, 0x00, 0x00, 0x30, 0x30, 0x00, 0x30, 0x30, 0x00, 0x00, 0x00, 0x00 },
    { 0x00, 0x00, 0x00, 0x30, 0x30, 0x00, 0x30, 0x30, 0x10, 0x20, 0x00, 0x00 },
    { 0x00, 0x08, 0x10, 0x20, 0x40, 0x20, 0x10, 0x08, 0x00, 0x00, 0x00, 0x00 },
    { 0x00, 0x00, 0x00, 0x7C, 0x00, 0x7C, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 },
    { 0x00, 0x40, 0x20, 0x10, 0x08, 0x10, 0x20, 0x40, 0x00, 0x00, 0x00, 0x00 },
    { 0x00, 0x38, 0x44, 0x04, 0x08, 0x10, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00 },
    { 0x00, 0x38, 0x44, 0x04, 0x34, 0x4C, 0x44, 0x38, 0x00, 0x00, 0x00, 0x00 },
    { 0x00, 0x10, 0x28, 0x44, 0x44, 0x7C, 0x44, 0x44, 0x00, 0x00, 0x00, 0x00 },
    { 0x00, 0x78, 0x44, 0x44, 0x78, 0x44, 0x44, 0x78, 0x00, 0x00, 0x00, 0x00 },
    { 0x00, 0x38, 0x44, 0x40, 0x40, 0x40, 0x44, 0x38, 0x00, 0x00, 0x00, 0x00 },
    { 0x00, 0x78, 0x44, 0x44, 0x44, 0x44, 0x44, 0x78, 0x00, 0x00, 0x00, 0x00 },
    { 0x00, 0x7C, 0x40, 0x40, 0x70, 0x40, 0x40, 0x7C, 0x00, 0x00, 0x00, 0x00 },
    { 0x00, 0x7C, 0x40, 0x40, 0x70, 0x40, 0x40, 0x40, 0x00, 0x00, 0x00, 0x00 },
    { 0x00, 0x38, 0x44, 0x40, 0x4C, 0x44, 0x44, 0x38, 0x00, 0x00, 0x00, 0x00 },
    { 0x00, 0x44, 0x44, 0x44, 0x7C, 0x44, 0x44, 0x44, 0x00, 0x00, 0x00, 0x00 },
    { 0x00, 0x38, 0x10, 0x10, 0x10, 0x10, 0x10, 0x38, 0x00, 0x00, 0x00, 0x00 },
    { 0x00, 0x04, 0x04, 0x04, 0x04, 0x44, 0x44, 0x38, 0x00, 0x00, 0x00, 0x00 },
    { 0x00, 0x44, 0x48, 0x50, 0x60, 0x50, 0x48, 0x44, 0x00, 0x00, 0x00, 0x00 },
    { 0x00, 0x40, 0x40, 0x40, 0x40, 0x40, 0x40, 0x7C, 0x00, 0x00, 0x00, 0x00 },
    { 0x00, 0x44, 0x6C, 0x54, 0x54, 0x44, 0x44, 0x44, 0x00, 0x00, 0x00, 0x00 },
    { 0x00, 0x44, 0x44, 0x64, 0x54, 0x4C, 0x44, 0x44, 0x00, 0x00, 0x00, 0x00 },
    { 0x00, 0x38, 0x44, 0x44, 0x44, 0x44, 0x44, 0x38, 0x00, 0x00, 0x00, 0x00 },
    { 0x00, 0x78, 0x44, 0x44, 0x78, 0x40, 0x40, 0x40, 0x00, 0x00, 0x00, 0x00 },
    { 0x00, 0x38, 0x44, 0x44, 0x44, 0x54, 0x48, 0x34, 0x00, 0x00, 0x00, 0x00 },
    { 0x00, 0x78, 0x44, 0x44, 0x78, 0x50, 0x48, 0x44, 0x00, 0x00, 0x00, 0x00 },
    { 0x00, 0x38, 0x44, 0x40, 0x38, 0x04, 0x44, 0x38, 0x00, 0x00, 0x00, 0x00 },
    { 0x00, 0x7C, 0x10, 0x10, 0x10, 0x10, 0x10, 0x10, 0x00, 0x00, 0x00, 0x00 },
    { 0x00, 0x44, 0x44, 0x44, 0x44, 0x44, 0x44, 0x38, 0x00, 0x00, 0x00, 0x00 },
    { 0x00, 0x44, 0x44, 0x44, 0x28, 0x28, 0x10, 0x10, 0x00, 0x00, 0x00, 0x00 },
    { 0x00, 0x44, 0x44, 0x44, 0x54, 0x54, 0x6C, 0x44, 0x00, 0x00, 0x00, 0x00 },
    { 0x00, 0x44, 0x44, 0x28, 0x10, 0x28, 0x44, 0x44, 0x00, 0x00, 0x00, 0x00 },
    { 0x00, 0x44, 0x44, 0x28, 0x10, 0x10, 0x10, 0x10, 0x00, 0x00, 0x00, 0x00 },
    { 0x00, 0x7C, 0x04, 0x08, 0x10, 0x20, 0x40, 0x7C, 0x00, 0x00, 0x00, 0x00 },
    { 0x00, 0x38, 0x20, 0x20, 0x20, 0x20, 0x20, 0x38, 0x00, 0x00, 0x00, 0x00 },
    { 0x00, 0x00, 0x40, 0x20, 0x10, 0x08, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00 },
    { 0x00, 0x38, 0x08, 0x08, 0x08, 0x08, 0x08, 0x38, 0x00, 0x00, 0x00, 0x00 },
    { 0x00, 0x10, 0x28, 0x44, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 },
    { 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x7C, 0x00, 0x00, 0x00 },
    { 0x00, 0x20, 0x10, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 },
    { 0x00, 0x00, 0x00, 0x38, 0x04, 0x3C, 0x44, 0x3C, 0x00, 0x00, 0x00, 0x00 },
    { 0x00, 0x40, 0x40, 0x58, 0x64, 0x44, 0x44, 0x78, 0x00, 0x00, 0x00, 0x00 },
    { 0x00, 0x00, 0x00, 0x38, 0x44, 0x40, 0x44, 0x38, 0x00, 0x00, 0x00, 0x00 },
    { 0x00, 0x04, 0x04, 0x34, 0x4C, 0x44, 0x44, 0x3C, 0x00, 0x00, 0x00, 0x00 },
    { 0x00, 0x00, 0x00, 0x38, 0x44, 0x78, 0x40, 0x38, 0x00, 0x00, 0x00, 0x00 },
    { 0x00, 0x10, 0x28, 0x20, 0x70, 0x20, 0x20, 0x20, 0x00, 0x00, 0x00, 0x00 },
    { 0x00, 0x00, 0x00, 0x3C, 0x44, 0x44, 0x4C, 0x34, 0x04, 0x38, 0x00, 0x00 },
    { 0x00, 0x40, 0x40, 0x58, 0x64, 0x44, 0x44, 0x44, 0x00, 0x00, 0x00, 0x00 },
    { 0x00, 0x10, 0x00, 0x30, 0x10, 0x10, 0x10, 0x38, 0x00, 0x00, 0x00, 0x00 },
    { 0x00, 0x00, 0x08, 0x00, 0x08, 0x08, 0x08, 0x08, 0x48, 0x30, 0x00, 0x00 },
    { 0x00, 0x40, 0x40, 0x48, 0x50, 0x60, 0x50, 0x48, 0x00, 0x00, 0x00, 0x00 },
    { 0x00, 0x30, 0x10, 0x10, 0x10, 0x10, 0x10, 0x38, 0x00, 0x00, 0x00, 0x00 },
    { 0x00, 0x00, 0x00, 0x68, 0x54, 0x54, 0x54, 0x54, 0x00, 0x00, 0x00, 0x00 },
    { 0x00, 0x00, 0x00, 0x58, 0x64, 0x44, 0x44, 0x44, 0x00, 0x00, 0x00, 0x00 },
    { 0x00, 0x00, 0x00, 0x38, 0x44, 0x44, 0x44, 0x38, 0x00, 0x00, 0x00, 0x00 },
    { 0x00, 0x00, 0x00, 0x38, 0x44, 0x44, 0x64, 0x58, 0x40, 0x40, 0x00, 0x00 },
    { 0x00, 0x00, 0x00, 0x38, 0x44, 0x44, 0x4C, 0x34, 0x04, 0x04, 0x00, 0x00 },
    { 0x00, 0x00, 0x00, 0x58, 0x64, 0x40, 0x40, 0x40, 0x00, 0x00, 0x00, 0x00 },
    { 0x00, 0x00, 0x00, 0x3C, 0x40, 0x38, 0x04, 0x78, 0x00, 0x00, 0x00, 0x00 },
    { 0x00, 0x20, 0x70, 0x20, 0x20, 0x20, 0x28, 0x10, 0x00, 0x00, 0x00, 0x00 },
    { 0x00, 0x00, 0x00, 0x44, 0x44, 0x44, 0x4C, 0x34, 0x00, 0x00, 0x00, 0x00 },
    { 0x00, 0x00, 0x00, 0x44, 0x44, 0x44, 0x28, 0x10, 0x00, 0x00, 0x00, 0x00 },
    { 0x00, 0x00, 0x00, 0x44, 0x44, 0x54, 0x54, 0x28, 0x00, 0x00, 0x00, 0x00 },
    { 0x00, 0x00, 0x00, 0x44, 0x28, 0x10, 0x28, 0x44, 0x00, 0x00, 0x00, 0x00 },
    { 0x00, 0x00, 0x00, 0x44, 0x44, 0x44, 0x44, 0x3C, 0x04, 0x38, 0x00, 0x00 },
    { 0x00, 0x00, 0x00, 0x7C, 0x08, 0x10, 0x20, 0x7C, 0x00, 0x00, 0x00, 0x00 },
    { 0x00, 0x20, 0x10, 0x10, 0x08, 0x10, 0x10, 0x20, 0x00, 0x00, 0x00, 0x00 },
    { 0x00, 0x10, 0x10, 0x10, 0x10, 0x10, 0x10, 0x10, 0x00, 0x00, 0x00, 0x00 },
    { 0x00, 0x08, 0x10, 0x10, 0x20, 0x10, 0x10, 0x08, 0x00, 0x00, 0x00, 0x00 },
    { 0x00, 0x28, 0x50, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 }
};


#define TEXT_HEIGHT 24
#define TEXT_WIDTH 53

#define SWAP_BYTES(color) ((uint16_t)(color>>8) | (uint16_t)(color<<8))

static mode0_color_t screen_bg_color = MODE0_BLACK;
static mode0_color_t screen_fg_color = MODE0_WHITE;  // TODO need to store a color per cell
static int cursor_x = 0;
static int cursor_y = 0;
static uint8_t screen[TEXT_HEIGHT * TEXT_WIDTH] = { 0 };
static uint8_t colors[TEXT_HEIGHT * TEXT_WIDTH] = { 0 };
static uint8_t show_cursor = 0;

static int depth = 0;
static uint16_t palette[16] = {
    SWAP_BYTES(0x0000),
    SWAP_BYTES(0x49E5),
    SWAP_BYTES(0xB926),
    SWAP_BYTES(0xE371),
    SWAP_BYTES(0x9CF3),
    SWAP_BYTES(0xA324),
    SWAP_BYTES(0xEC46),
    SWAP_BYTES(0xF70D),
    SWAP_BYTES(0xffff),
    SWAP_BYTES(0x1926),
    SWAP_BYTES(0x2A49),
    SWAP_BYTES(0x4443),
    SWAP_BYTES(0xA664),
    SWAP_BYTES(0x02B0),
    SWAP_BYTES(0x351E),
    SWAP_BYTES(0xB6FD)
};

void mode0_clear(mode0_color_t color) {
    mode0_begin();
    int size = TEXT_WIDTH*TEXT_HEIGHT;
    memset(screen, 0, size);
    memset(colors, color, size);
    mode0_set_cursor(0, 0);
    mode0_end();
}

void mode0_set_foreground(mode0_color_t color) {
    mode0_begin();
    screen_fg_color = color;
    mode0_end();
}

void mode0_set_background(mode0_color_t color) {
    mode0_begin();
    screen_bg_color = color;
    mode0_end();
}

void mode0_set_cursor(uint8_t x, uint8_t y) {
    cursor_x = x;
    cursor_y = y;
}

void mode0_show_cursor() {
    mode0_begin();
    show_cursor = 1;
    mode0_end();
}

void mode0_hide_cursor() {
    mode0_begin();
    show_cursor = 0;
    mode0_end();
}

uint8_t mode0_get_cursor_x() {
    return cursor_x;
}

uint8_t mode0_get_cursor_y() {
    return cursor_y;
}

void mode0_putc(char c) {
    mode0_begin();
    
    if (cursor_y >= TEXT_HEIGHT) {
        mode0_scroll_vertical(cursor_y-TEXT_HEIGHT+1);
        cursor_y = TEXT_HEIGHT-1;
    }

    int idx = cursor_y*TEXT_WIDTH + cursor_x;
    if (c == '\n') {
        // fill the rest of the line with empty content + the current bg color
        memset(screen+idx, 0, TEXT_WIDTH-cursor_x);
        memset(colors+idx, screen_bg_color, TEXT_WIDTH-cursor_x);
        cursor_y++;
        cursor_x = 0;
    } else if (c == '\r') {
        //cursor_x = 0;
    } else if (c>=32 && c<=127) {
        screen[idx] = c-32;
        colors[idx] = ((screen_fg_color & 0xf) << 4) | (screen_bg_color & 0xf);
        
        cursor_x++;
        if (cursor_x >= TEXT_WIDTH) {
            cursor_x = 0;
            cursor_y++;
        }
    }
    
    mode0_end();
}

void mode0_print(const char *str) {
    mode0_begin();
    char c;
    while (c = *str++) {
        mode0_putc(c);
    }
    mode0_end();
}

void mode0_write(const char *str, int len) {
    mode0_begin();
    for (int i=0; i<len; i++) {
        mode0_putc(*str++);
    }
    mode0_end();
}

inline void mode0_begin() {
    depth++;
}

inline void mode0_end() {
    if (--depth == 0) {
        mode0_draw_screen();
    }
}

void mode0_draw_region(uint8_t x, uint8_t y, uint8_t width, uint8_t height) {
    // TODO
    mode0_draw_screen();
}

void mode0_draw_screen() {
    // assert depth == 0?
    depth = 0;
    
    // setup to draw the whole screen
    
    // column address set
    tft.ili9341_set_command(ILI9341_CASET);
    tft.ili9341_command_param(0x00);
    tft.ili9341_command_param(0x00);  // start column
    tft.ili9341_command_param(0x00);
    tft.ili9341_command_param(0xef);  // end column -> 239

    // page address set
    tft.ili9341_set_command(ILI9341_PASET);
    tft.ili9341_command_param(0x00);
    tft.ili9341_command_param(0x00);  // start page
    tft.ili9341_command_param(0x01);
    tft.ili9341_command_param(0x3f);  // end page -> 319

    // start writing
    tft.ili9341_set_command(ILI9341_RAMWR);

    uint16_t buffer[6*240];  // 'amount' pixels wide, 240 pixels tall

    int screen_idx = 0;
    for (int x=0; x<TEXT_WIDTH; x++) {
        // create one column of screen information
        
        uint16_t *buffer_idx = buffer;
        
        for (int bit=0; bit<6; bit++) {
            uint8_t mask = 64>>bit;
            for (int y=TEXT_HEIGHT-1; y>=0; y--) {
                uint8_t character = screen[y*53+x];
                uint16_t fg_color = palette[colors[y*53+x] >> 4];
                uint16_t bg_color = palette[colors[y*53+x] & 0xf];

                if (show_cursor && (cursor_x == x) && (cursor_y == y)) {
                    bg_color = MODE0_GREEN;
                }
                                
                const uint8_t* pixel_data = font_data[character];
                
                // draw the character into the buffer
                for (int j=10; j>=1; j--) {
                    *buffer_idx++ = (pixel_data[j] & mask) ? fg_color : bg_color;
                }
            }
        }
        
        // now send the slice
        tft.ili9341_write_data(buffer, 6*240*2);
    }
    
    uint16_t extra_buffer[2*240] = { 0 };
    tft.ili9341_write_data(extra_buffer, 2*240*2);

}

void mode0_scroll_vertical(int8_t amount) {
    mode0_begin();

    
    if (amount > 0) {
        int size1 = TEXT_WIDTH*amount;
        int size2 = TEXT_WIDTH*TEXT_HEIGHT - size1;
        
        memmove(screen, screen+size1, size2);
        memmove(colors, colors+size1, size2);
        memset(screen+size2, 0, size1);
        memset(colors+size2, screen_bg_color, size1);
    } else if (amount < 0) {
        amount = -amount;
        int size1 = TEXT_WIDTH*amount;
        int size2 = TEXT_WIDTH*TEXT_HEIGHT - size1;

        memmove(screen+size1, screen, size2);
        memmove(colors+size1, colors, size2);
        memset(screen, 0, size1);
        memset(colors, screen_bg_color, size1);
    }
    
    mode0_end();
}

void mode0_init() {
    // stdio_init_all();

    tft.ili9341_init();
}

/*
uint16_t swap_bytes(uint16_t color) {
    return (color>>8) | (color<<8);
}
*/



// *************************************************************************************************
// *************************************************************************************************
// MAGA_TFTLCD tft(LCD_CS, LCD_CD, LCD_WR, LCD_RD, LCD_RST, LCD_D0, LCD_WIDTH, LCD_HEIGHT);

int main() {
    mode0_init();
    
    mode0_set_cursor(0, 0);
    mode0_color_t fg = MODE0_WHITE;
    mode0_color_t bg = MODE0_BLACK;
    
    while (1) {
        mode0_print("Retro Computer (c) 2021, Shawn Hyam\n");
        // sleep_ms(500);
        fg = (fg+1) % 16;
        if (fg == 0) {
            bg = (bg+1) % 16;
            mode0_set_background(bg);
        }
        mode0_set_foreground(fg);

    }
}
