#include <iostream>
#include "MAGA_TFTLCD.h"

#define TFTWIDTH 240
#define TFTHEIGHT 320

MAGA_TFTLCD::MAGA_TFTLCD(uint8_t cs, uint8_t cd, uint8_t wr, uint8_t rd, uint8_t reset, uint8_t d0)
	: MAGA_GFX(TFTWIDTH, TFTHEIGHT) {

	_cs = cs;
	_cd = cd;
	_wr = wr;
	_rd = rd;
	_rst = reset;
	_d0 = d0;
	_d1 = d0 + 1;
	_d2 = d0 + 2;
	_d3 = d0 + 3;
	_d4 = d0 + 4;
	_d5 = d0 + 5;
	_d6 = d0 + 6;
	_d7 = d0 + 7;

	init();
};

// *************************************************************************************************
void MAGA_TFTLCD::init() {
	std::cout << "in init...\n";
	setWriteDir();
	GFXcanvas8 fish = GFXcanvas8(333, 666);
}

void MAGA_TFTLCD::setWriteDir() {
	std::cout << "in setWriteDir...\n";
}

void MAGA_TFTLCD::yo() {

}




