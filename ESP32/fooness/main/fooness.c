// *************** Wed Aug 9 02:04:06 AM EDT 2023
// *************************************************************************************************

#include <stdio.h>
#include <stdint.h>
#include <string.h>
#include "freertos/FreeRTOS.h"
#include "freertos/task.h"
#include "driver/gpio.h"

// *************************************************************************************** defines.h
// *************************************************************************************************
#define sleep_ms(a) vTaskDelay(a / portTICK_PERIOD_MS)

#define ILI9341_CS  26
#define ILI9341_CD  2
#define ILI9341_WR  4
#define ILI9341_RD  16

#define ILI9341_MISC1 27
#define ILI9341_MISC2 1 // 33

#define ILI9341_D0 17
#define ILI9341_D1 5
#define ILI9341_D2 18
#define ILI9341_D3 19
#define ILI9341_D4 21
#define ILI9341_D5 22
#define ILI9341_D6 23
#define ILI9341_D7 25

#define ILI9341_TFTWIDTH 240  ///< ILI9341 max TFT width
#define ILI9341_TFTHEIGHT 320 ///< ILI9341 max TFT height
#define ILI9341_SIZE (ILI9341_TFTHEIGHT * ILI9341_TFTWIDTH)

#define GPIO_OUT_W1TS_REG 0x3FF44008
#define GPIO_OUT_W1TC_REG 0x3FF4400C
#define GPIO_ENABLE_REG   0x3FF44020

#define GPIO_OUT1_W1TS_REG 0x3FF44014
#define GPIO_OUT1_W1TC_REG 0x3FF44018
#define GPIO_ENABLE1_REG   0x3FF4402C


#define controlPins 0x4010014
#define datumPins   0x2EE0020

#define CS_ACTIVE  *gpio_out_w1tc_reg = (1 << ILI9341_CS)
#define CS_IDLE    *gpio_out_w1ts_reg = (1 << ILI9341_CS)
#define CD_COMMAND *gpio_out_w1tc_reg = (1 << ILI9341_CD)
#define CD_DATA    *gpio_out_w1ts_reg = (1 << ILI9341_CD)
#define WR_IDLE    *gpio_out_w1ts_reg = (1 << ILI9341_IDLE)
#define WR_STROBE  *gpio_out_w1tc_reg = (1 << ILI9341_WR); *gpio_out_w1ts_reg = (1 << ILI9341_WR)
#define RD_STROBE  *gpio_out_w1tc_reg = (1 << ILI9341_RD); *gpio_out_w1ts_reg = (1 << ILI9341_RD)

#define ACHTUNG1   *gpio_out_w1ts_reg = (1 << ILI9341_MISC1); sleep_ms(250); *gpio_out_w1tc_reg = (1 << ILI9341_MISC1); sleep_ms(250)

#define ACHTUNG2   *gpio_out1_w1ts_reg = (1 << ILI9341_MISC2); sleep_ms(250); *gpio_out1_w1tc_reg = (1 << ILI9341_MISC2); sleep_ms(250)





#define _swap_int16_t(a, b)                                                    \
  {                                                                            \
    int16_t t = a;                                                             \
    a = b;                                                                     \
    b = t;                                                                     \
  }
#define min(a, b) (((a) < (b)) ? (a) : (b))





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


// *************************************************************************************** ILI9341.h
// *************************************************************************************************
struct ILI9341 {
	int16_t WIDTH;
	int16_t HEIGHT;
	int16_t _width;
	int16_t _height;
	uint8_t rotation;
};

void ILI9341_init();
void ILI9341_set_command(uint8_t cmd);
void ILI9341_command_param(uint8_t data);
void ILI9341_write_data(void *buffer, int bytes);

// *************************************************************************************************
struct ILI9341 ili;

// ************************************************************************************** ILI9341.c
volatile uint32_t* gpio_out_w1ts_reg = (volatile uint32_t*) GPIO_OUT_W1TS_REG;
volatile uint32_t* gpio_out_w1tc_reg = (volatile uint32_t*) GPIO_OUT_W1TC_REG;
volatile uint32_t* gpio_enable_reg = (volatile uint32_t*) GPIO_ENABLE_REG;

volatile uint32_t* gpio_out1_w1ts_reg = (volatile uint32_t*) GPIO_OUT1_W1TS_REG;
volatile uint32_t* gpio_out1_w1tc_reg = (volatile uint32_t*) GPIO_OUT1_W1TC_REG;
volatile uint32_t* gpio_enable1_reg = (volatile uint32_t*) GPIO_ENABLE1_REG;

static inline void init_pins() {
	*gpio_enable_reg = datumPins | controlPins | (1 << ILI9341_MISC1);
	*gpio_out_w1ts_reg = datumPins | controlPins;   // 1111 1111 : 11 11
	*gpio_out_w1tc_reg = datumPins;                 // 0000 0000 : 11 11
	*gpio_out_w1tc_reg = (1 << ILI9341_MISC1);

	*gpio_enable1_reg = (1 << ILI9341_MISC2);
	*gpio_out1_w1tc_reg = (1 << ILI9341_MISC2);
};

static inline void sio_write(void *src, size_t len) {
	char *x = (char *)src;
	uint32_t datum;
	do {
		datum = 0;
		*gpio_out_w1tc_reg = datumPins;
/*
		if(*x&1) *gpio_out_w1ts_reg = (1 << ILI9341_D0);
		if(*x&2) *gpio_out_w1ts_reg = (1 << ILI9341_D1);
		if(*x&4) *gpio_out_w1ts_reg = (1 << ILI9341_D2);
		if(*x&8) *gpio_out_w1ts_reg = (1 << ILI9341_D3);
		if(*x&16) *gpio_out_w1ts_reg = (1 << ILI9341_D4);
		if(*x&32) *gpio_out_w1ts_reg = (1 << ILI9341_D5);
		if(*x&64) *gpio_out_w1ts_reg = (1 << ILI9341_D6);
		if(*x&128) *gpio_out_w1ts_reg = (1 << ILI9341_D7);

		datum |= ((*x&1) << ILI9341_D0);         // 17
		datum |= ((*x&2) << (ILI9341_D1-1));     // 5
		datum |= ((*x&4) << (ILI9341_D2-2));     // 18
		datum |= ((*x&8) << (ILI9341_D3-3));     // 19
		datum |= ((*x&16) << (ILI9341_D4-4));    // 21
		datum |= ((*x&32) << (ILI9341_D5-5));    // 22
		datum |= ((*x&64) << (ILI9341_D6-6));    // 23
		datum |= ((*x&128) << (ILI9341_D7-7));   // 25
*/
		datum |= ((*x&1) << 17);     // 17 - 0
		datum |= ((*x&2) << 4);      // 5  - 1
		datum |= ((*x&4) << 16);     // 18 - 2
		datum |= ((*x&8) << 16);     // 19 - 3
		datum |= ((*x&16) << 17);    // 21 - 4
		datum |= ((*x&32) << 17);    // 22 - 5
		datum |= ((*x&64) << 17);    // 23 - 6
		datum |= ((*x&128) << 18);   // 25 - 7

		*gpio_out_w1ts_reg = datum;
		WR_STROBE;

		len--;
		x++;
	} while (len > 0);
}

// ************************************************************************************************
void ILI9341_init() {
	ili.WIDTH    = ILI9341_TFTWIDTH;
	ili.HEIGHT   = ILI9341_TFTHEIGHT;
	ili._width   = ILI9341_TFTWIDTH;
	ili._height  = ILI9341_TFTHEIGHT;
	ili.rotation = 0;

	init_pins();

	ILI9341_set_command(0x01); //soft reset
	sleep_ms(1000);

	ILI9341_set_command(ILI9341_GAMMASET);
	ILI9341_command_param(0x01);

	// memory access control
	ILI9341_set_command(ILI9341_MADCTL);
	ILI9341_command_param(0x48);

	// pixel format
	ILI9341_set_command(ILI9341_PIXFMT);
	ILI9341_command_param(0x55);  // 16-bit

	// frame rate; default, 70 Hz
	ILI9341_set_command(ILI9341_FRMCTR1);
	ILI9341_command_param(0x00);
	ILI9341_command_param(0x1B);

	// exit sleep
	ILI9341_set_command(ILI9341_SLPOUT);

	// display on
	ILI9341_set_command(ILI9341_DISPON);

	// column address set
	ILI9341_set_command(ILI9341_CASET);
	ILI9341_command_param(0x00);
	ILI9341_command_param(0x00);  // start column
	ILI9341_command_param(0x00);
	ILI9341_command_param(0xef);  // end column -> 239

	// page address set
	ILI9341_set_command(ILI9341_PASET);
	ILI9341_command_param(0x00);
	ILI9341_command_param(0x00);  // start page
	ILI9341_command_param(0x01);
	ILI9341_command_param(0x3f);  // end page -> 319

	ILI9341_set_command(ILI9341_RAMWR);
	
	*gpio_out_w1tc_reg = datumPins;
	*gpio_out_w1ts_reg = controlPins;
};

/*
void ILI9341_render() {
	ILI9341_write_data(screenbuffer, ILI9341_SIZE*2);
}
*/

void ILI9341_set_command(uint8_t cmd) {
	CS_ACTIVE;
	CD_COMMAND;
	sio_write(&cmd, 1);
	CD_DATA;
	CS_IDLE;
};

void ILI9341_command_param(uint8_t data) {
	CS_ACTIVE;
	sio_write(&data, 1);
	CS_IDLE;
};

void ILI9341_write_data(void *buffer, int bytes) {
	CS_ACTIVE;
	sio_write(buffer, bytes);
	CS_IDLE;
};

void app_main(void) {
	ILI9341_init();


	while(1) {
		ACHTUNG1;
		ACHTUNG2;
	}
/*
	while(1) {
		memset(screenbuffer, 0xE382, ILI9341_SIZE*2);
		ILI9341_render();
		ACHTUNG;
		memset(screenbuffer, 0xA335, ILI9341_SIZE*2);
		ILI9341_render();
		ACHTUNG;
	}
*/
}

