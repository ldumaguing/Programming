#include <iostream>
#include "MAGA_TFTLCD.h"

#define TFTWIDTH 240
#define TFTHEIGHT 320

MAGA_TFTLCD::MAGA_TFTLCD(uint8_t cs, uint8_t cd, uint8_t wr, uint8_t rd, uint8_t reset, uint8_t d0)
	: MAGA_GFX(TFTWIDTH, TFTHEIGHT) {
};







// *************************************************************************************************
void MAGA_TFTLCD::init(void) {
	std::cout << "in init...\n";
	setWriteDir();
}

void MAGA_TFTLCD::setWriteDir(void) {
	std::cout << "in setWriteDir...\n";
}






