// *************** Fri Jul 14 08:56:23 PM EDT 2023
// *************************************************************************************************
#include "pico/stdlib.h"
#include <stdint.h>
#include <string.h>
#include <stdio.h>

// *************************************************************************************** defines.h
// *************************************************************************************************
#define ILI9341_CS   0
#define ILI9341_CD   1
#define ILI9341_WR   2
#define ILI9341_RD   3
#define ILI9341_RST  4
#define ILI9341_D0   5
#define ILI9341_MASK 0x1fff   // 0001 1111 1111 1111

#define ILI9341_TFTWIDTH 240  ///< ILI9341 max TFT width
#define ILI9341_TFTHEIGHT 320 ///< ILI9341 max TFT height
#define SWAP_BYTES(color) ((uint16_t)(color>>8) | (uint16_t)(color<<8))

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
#define ILI9341_INVCTR  0xB4 ///< Display Inversion Control
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

// ********************************************************* From Adafruit
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

// Color definitions
#define ILI9341_BLACK 0x0000       ///<   0,   0,   0
#define ILI9341_NAVY 0x000F        ///<   0,   0, 123
#define ILI9341_DARKGREEN 0x03E0   ///<   0, 125,   0
#define ILI9341_DARKCYAN 0x03EF    ///<   0, 125, 123
#define ILI9341_MAROON 0x7800      ///< 123,   0,   0
#define ILI9341_PURPLE 0x780F      ///< 123,   0, 123
#define ILI9341_OLIVE 0x7BE0       ///< 123, 125,   0
#define ILI9341_LIGHTGREY 0xC618   ///< 198, 195, 198
#define ILI9341_DARKGREY 0x7BEF    ///< 123, 125, 123
#define ILI9341_BLUE 0x001F        ///<   0,   0, 255
#define ILI9341_GREEN 0x07E0       ///<   0, 255,   0
#define ILI9341_CYAN 0x07FF        ///<   0, 255, 255
#define ILI9341_RED 0xF800         ///< 255,   0,   0
#define ILI9341_MAGENTA 0xF81F     ///< 255,   0, 255
#define ILI9341_YELLOW 0xFFE0      ///< 255, 255,   0
#define ILI9341_WHITE 0xFFFF       ///< 255, 255, 255
#define ILI9341_ORANGE 0xFD20      ///< 255, 165,   0
#define ILI9341_GREENYELLOW 0xAFE5 ///< 173, 255,  41
#define ILI9341_PINK 0xFC18        ///< 255, 130, 198


uint16_t colors[] = {
	0x0000, 0x0005, 0x000a, 0x000f, 0x0015, 0x001a, 0x001f,
	0x0140, 0x0145, 0x014a, 0x014f, 0x0155, 0x015a, 0x015f,
	0x02a0, 0x02a5, 0x02aa, 0x02af, 0x02b5, 0x02ba, 0x02bf,
	0x03e0, 0x03e5, 0x03ea, 0x03ef, 0x03f5, 0x03fa, 0x03ff,
	0x0540, 0x0545, 0x054a, 0x054f, 0x0555, 0x055a, 0x055f,
	0x06a0, 0x06a5, 0x06aa, 0x06af, 0x06b5, 0x06ba, 0x06bf,
	0x07e0, 0x07e5, 0x07ea, 0x07ef, 0x07f5, 0x07fa, 0x07ff,
	0x2800, 0x2805, 0x280a, 0x280f, 0x2815, 0x281a, 0x281f,
	0x2940, 0x2945, 0x294a, 0x294f, 0x2955, 0x295a, 0x295f,
	0x2aa0, 0x2aa5, 0x2aaa, 0x2aaf, 0x2ab5, 0x2aba, 0x2abf,   // 70

	0x2be0, 0x2be5, 0x2bea, 0x2bef, 0x2bf5, 0x2bfa, 0x2bff,
	0x2d40, 0x2d45, 0x2d4a, 0x2d4f, 0x2d55, 0x2d5a, 0x2d5f,
	0x2ea0, 0x2ea5, 0x2eaa, 0x2eaf, 0x2eb5, 0x2eba, 0x2ebf,
	0x2fe0, 0x2fe5, 0x2fea, 0x2fef, 0x2ff5, 0x2ffa, 0x2fff,
	0x5000, 0x5005, 0x500a, 0x500f, 0x5015, 0x501a, 0x501f,
	0x5140, 0x5145, 0x514a, 0x514f, 0x5155, 0x515a, 0x515f,
	0x52a0, 0x52a5, 0x52aa, 0x52af, 0x52b5, 0x52ba, 0x52bf,
	0x53e0, 0x53e5, 0x53ea, 0x53ef, 0x53f5, 0x53fa, 0x53ff,
	0x5540, 0x5545, 0x554a, 0x554f, 0x5555, 0x555a, 0x555f,
	0x56a0, 0x56a5, 0x56aa, 0x56af, 0x56b5, 0x56ba, 0x56bf,   // 140

	0x57e0, 0x57e5, 0x57ea, 0x57ef, 0x57f5, 0x57fa, 0x57ff,
	0x7800, 0x7805, 0x780a, 0x780f, 0x7815, 0x781a, 0x781f,
	0x7940, 0x7945, 0x794a, 0x794f, 0x7955, 0x795a, 0x795f,
	0x7aa0, 0x7aa5, 0x7aaa, 0x7aaf, 0x7ab5, 0x7aba, 0x7abf,
	0x7be0, 0x7be5, 0x7bea, 0x7bef, 0x7bf5, 0x7bfa, 0x7bff,
	0x7d40, 0x7d45, 0x7d4a, 0x7d4f, 0x7d55, 0x7d5a, 0x7d5f,
	0x7ea0, 0x7ea5, 0x7eaa, 0x7eaf, 0x7eb5, 0x7eba, 0x7ebf,
	0x7fe0, 0x7fe5, 0x7fea, 0x7fef, 0x7ff5, 0x7ffa, 0x7fff,
	0xa800, 0xa805, 0xa80a, 0xa80f, 0xa815, 0xa81a, 0xa81f,
	0xa940, 0xa945, 0xa94a, 0xa94f, 0xa955, 0xa95a, 0xa95f,   // 210

	0xaaa0, 0xaaa5, 0xaaaa, 0xaaaf, 0xaab5, 0xaaba, 0xaabf,
	0xabe0, 0xabe5, 0xabea, 0xabef, 0xabf5, 0xabfa, 0xabff,
	0xad40, 0xad45, 0xad4a, 0xad4f, 0xad55, 0xad5a, 0xad5f,
	0xaea0, 0xaea5, 0xaeaa, 0xaeaf, 0xaeb5, 0xaeba, 0xaebf,
	0xafe0, 0xafe5, 0xafea, 0xafef, 0xaff5, 0xaffa, 0xafff,
	0xd000, 0xd005, 0xd00a, 0xd00f, 0xd015, 0xd01a, 0xd01f,
	0xd140, 0xd145, 0xd14a, 0xd14f, 0xd155, 0xd15a, 0xd15f,
	0xd2a0, 0xd2a5, 0xd2aa, 0xd2af, 0xd2b5, 0xd2ba, 0xd2bf,
	0xd3e0, 0xd3e5, 0xd3ea, 0xd3ef, 0xd3f5, 0xd3fa, 0xd3ff,
	0xd540, 0xd545, 0xd54a, 0xd54f, 0xd555, 0xd55a, 0xd55f,   // 280

	0xd6a0, 0xd6a5, 0xd6aa, 0xd6af, 0xd6b5, 0xd6ba, 0xd6bf,
	0xd7e0, 0xd7e5, 0xd7ea, 0xd7ef, 0xd7f5, 0xd7fa, 0xd7ff,
	0xf800, 0xf805, 0xf80a, 0xf80f, 0xf815, 0xf81a, 0xf81f,
	0xf940, 0xf945, 0xf94a, 0xf94f, 0xf955, 0xf95a, 0xf95f,
	0xfaa0, 0xfaa5, 0xfaaa, 0xfaaf, 0xfab5, 0xfaba, 0xfabf,
	0xfbe0, 0xfbe5, 0xfbea, 0xfbef, 0xfbf5, 0xfbfa, 0xfbff,
	0xfd40, 0xfd45, 0xfd4a, 0xfd4f, 0xfd55, 0xfd5a, 0xfd5f,
	0xfea0, 0xfea5, 0xfeaa, 0xfeaf, 0xfeb5, 0xfeba, 0xfebf,
	0xffe0, 0xffe5, 0xffea, 0xffef, 0xfff5, 0xfffa, 0xffff }; // 343

// *************************************************************************************** ILI9341.h
// *************************************************************************************************
struct ILI9341 {
	ILI9341(int16_t w, int16_t h);

	void init();
	void set_command(uint8_t cmd);
	void command_param(uint8_t data);
	void write_data(void *buffer, int bytes);
	void write_data(const uint8_t *buffer, int bytes);
	void pin_reset();

	// ************************************************** Adafruit base
	void begin();

	// ************************************************** Defining the virtual functions
	
};

// ************************************************************************************* ILI9341.cpp
static inline void init_pins() {
	gpio_init_mask(ILI9341_MASK);
	gpio_set_dir_out_masked(ILI9341_MASK);
	gpio_set_mask(ILI9341_MASK);
};

#define CS_ACTIVE  gpio_put(ILI9341_CS, 0)
#define CS_IDLE    gpio_put(ILI9341_CS, 1)
#define CD_COMMAND gpio_put(ILI9341_CD, 0)
#define CD_DATA    gpio_put(ILI9341_CD, 1)
#define WR_IDLE    gpio_put(ILI9341_WR, 1)
#define WR_STROBE  gpio_put(ILI9341_WR, 0); gpio_put(ILI9341_WR, 1)
#define RST_ACTIVE gpio_put(ILI9341_RST, 0)
#define RST_IDLE   gpio_put(ILI9341_RST, 1)

static inline void sio_write(const uint8_t *src, size_t len) {
	do {
		gpio_put_masked((0xff << ILI9341_D0), (*src << ILI9341_D0));
		WR_STROBE;

		len--;
		src++;
	} while (len > 0);
}

static inline void sio_write(void *src, size_t len) {
	char *x = (char *)src;
	do {
		gpio_put_masked((0xff << ILI9341_D0), (*x << ILI9341_D0));
		WR_STROBE;

		len--;
		x++;
	} while (len > 0);
}

// *************************************************************************************************
ILI9341::ILI9341(int16_t w, int16_t h) {
}

void ILI9341::init() {
	init_pins();

	set_command(0x01); //soft reset
	sleep_ms(1000);

	set_command(ILI9341_GAMMASET);
	command_param(0x01);

/*
	// positive gamma correction
	set_command(ILI9341_GMCTRP1);
    write_data((const uint8_t[15]){ 0x0f, 0x31, 0x2b, 0x0c, 0x0e, 0x08, 0x4e, 0xf1, 0x37, 0x07, 0x10, 0x03, 0x0e, 0x09, 0x00 }, 15);

	// negative gamma correction
	set_command(ILI9341_GMCTRN1);
	write_data((const uint8_t[15]){ 0x00, 0x0e, 0x14, 0x03, 0x11, 0x07, 0x31, 0xc1, 0x48, 0x08, 0x0f, 0x0c, 0x31, 0x36, 0x0f }, 15);
*/
	// memory access control
	set_command(ILI9341_MADCTL);
	command_param(0x48);

	// pixel format
	set_command(ILI9341_PIXFMT);
	command_param(0x55);  // 16-bit

	// frame rate; default, 70 Hz
	set_command(ILI9341_FRMCTR1);
	command_param(0x00);
	command_param(0x1B);

	// exit sleep
	set_command(ILI9341_SLPOUT);

	// display on
	set_command(ILI9341_DISPON);

	// column address set
	set_command(ILI9341_CASET);
	command_param(0x00);
	command_param(0x00);  // start column
	command_param(0x00);
	command_param(0xef);  // end column -> 239

	// page address set
	set_command(ILI9341_PASET);
	command_param(0x00);
	command_param(0x00);  // start page
	command_param(0x01);
	command_param(0x3f);  // end page -> 319

	set_command(ILI9341_RAMWR);
};

void ILI9341::set_command(uint8_t cmd) {
	CS_ACTIVE;
	CD_COMMAND;
	sio_write(&cmd, 1);
	CD_DATA;
	CS_IDLE;
};

void ILI9341::command_param(uint8_t data) {
	CS_ACTIVE;
	sio_write(&data, 1);
	CS_IDLE;
};

void ILI9341::write_data(void *buffer, int bytes) {
	CS_ACTIVE;
	sio_write(buffer, bytes);
	CS_IDLE;
};

void ILI9341::write_data(const uint8_t *buffer, int bytes) {
	CS_ACTIVE;
	sio_write(buffer, bytes);
	CS_IDLE;
};

void ILI9341::pin_reset() {
	RST_ACTIVE;
	sleep_ms(1000);
	RST_IDLE;
};

// *********************************************************************************** Adafruit base
void ILI9341::begin() {
	init();
};

// ***********************************************
ILI9341 ili = ILI9341(ILI9341_TFTWIDTH, ILI9341_TFTHEIGHT);

// *************************************************************************************************
// *************************************************************************************************
// *************************************************************************************************
// *************************************************************************************************
// *************************************************************************************************
void mode2_init();
void mode2_clear();
void mode2_rect(uint16_t x, uint16_t y, uint16_t width, uint16_t height, uint16_t color);
void mode2_render();



#define SIZE (ILI9341_TFTHEIGHT*ILI9341_TFTWIDTH)

uint16_t mode2_buffer[SIZE] = { 0 };

void mode2_init() {
}

void mode2_clear() {
    memset(mode2_buffer, 0, SIZE*sizeof(uint16_t));
}

void mode2_rect(uint16_t x, uint16_t y, uint16_t width, uint16_t height, uint16_t color) {
	uint16_t *base_loc = &mode2_buffer[x*ILI9341_TFTWIDTH+y];

	for (int h=0; h<width; h++) {
	    uint16_t *loc = base_loc + h*ILI9341_TFTWIDTH;
    	for (int v=0; v<height; v++) {
			*loc++ = color;
    	}
	}
}

void mode2_render() {
	ili.write_data(mode2_buffer, SIZE*sizeof(uint16_t));
}

int main() {
	// possibly set ili9341_config parameters if your pins/spi port don't match
	ili.init();

	mode2_init();


	mode2_clear();
	
	for (int i=0; i<32; i++) {
		mode2_rect(i, 0, 1, 10, SWAP_BYTES(colors[i]));
	}
	
	
	
	
	
	/*
	mode2_rect(0, 0, 25, 25, SWAP_BYTES(ILI9341_CYAN));
	mode2_rect(320/2, 240/2, 25, 25, SWAP_BYTES(ILI9341_CYAN));

	mode2_rect(10, 10, 25, 25, SWAP_BYTES(ILI9341_RED));
	mode2_rect(240/2, 320/2, 25, 25, SWAP_BYTES(ILI9341_RED));

	mode2_rect(200, 200, 25, 25, SWAP_BYTES(ILI9341_PINK));
*/

	mode2_render();

}
