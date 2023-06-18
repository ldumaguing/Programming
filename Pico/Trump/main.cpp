#include <iostream>
#include "foo.h"

/*
#include "SPI.h"
#include "Adafruit_GFX.h"
*/
#include "Adafruit_ILI9341.h"


#define TFT_CS   17
#define TFT_CD   21
#define TFT_MOSI 19
#define TFT_MISO 16
#define TFT_RST  20
#define TFT_CLK  18

Adafruit_ILI9341 tft;

using namespace std;

int main() {
	cout << "Hello World!";
//	Adafruit_ILI9341 tft = Adafruit_ILI9341(TFT_CS, TFT_DC, TFT_MOSI, TFT_CLK, TFT_RST, TFT_MISO);
  return 0;
}

