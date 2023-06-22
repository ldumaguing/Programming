#include <iostream>

// #include "SPI.h"
// #include "Adafruit_GFX.h"
#include "Adafruit_ILI9341.h"

// SPI wiring for PiPico
#define TFT_DC   21
#define TFT_CS   17
#define TFT_MOSI 19
#define TFT_CLK  18
#define TFT_RST  20
#define TFT_MISO 16

// Use hardware SPI (on Uno, #13, #12, #11) and the above for CS/DC
// Adafruit_ILI9341 tft = Adafruit_ILI9341(TFT_CS, TFT_DC);
// If using the breakout, change pins as desired
Adafruit_ILI9341 tft = Adafruit_ILI9341(TFT_CS, TFT_DC, TFT_MOSI, TFT_CLK, TFT_RST, TFT_MISO);

 
void setup();
void loop();

using namespace std;

int main() {
	cout << "Hello World!";

	setup();
	loop();

	return 0;
}

// *************************************************************************************************
void setup() {
}

void loop() {
}

