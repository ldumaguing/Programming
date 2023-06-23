#include <iostream>
#include "MAGA_TFTLCD.h"

#define TFTWIDTH 240
#define TFTHEIGHT 320

MAGA_TFTLCD::MAGA_TFTLCD(void) : MAGA_GFX(TFTWIDTH, TFTHEIGHT) {
	init();
};

// *************************************************************************************************
void MAGA_TFTLCD::init(void) {
	std::cout << "in init...\n";
	setWriteDir();
}

void MAGA_TFTLCD::setWriteDir(void) {
	std::cout << "in setWriteDir...\n";
}






