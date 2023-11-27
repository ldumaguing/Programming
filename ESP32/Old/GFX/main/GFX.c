#include <stdio.h>
#include "gfx.h"
#include "image.h"

/*
void app_main(void) {
	ILI9341_init();
	init_GFX();

	int counter = 0;
	for(int j=0; j<img_height; j++) {
		for(int i=0; i<img_width; i++) {
			screenbuffer[i + j*ILI9341_WIDTH] = img[counter];
			counter++; 
		}
	}

	renderScreenbuffer();
}
*/

void app_main(void) {
	GFX_init();

	// GFX_clearScreen(0xb2f8);
	// GFX_clearScreen(0xf8b2);
	//GFX_fillScreen(0x1f00);   // blue
	//GFX_fillScreen(0xe007);   // green
	//GFX_fillScreen(0x00f8);   // red
	//GFX_fillScreen(0x2108);   // black
//GFX_fillScreen(0x2108);   // black
GFX_fillScreen2(0x1f00, 0xd007);
//GFX_fillScreen(0x0000);



//GFX_drawImage(20, 20, img_width, img_height, img);




/*
	GFX_drawPixel(20, 20, 0xFFFF);
	GFX_drawPixel(30, 30, 0xFFFF);
	GFX_drawLine(40, 40, 50, 50, 0xFFFF);
GFX_drawLine(40, 40, 40, 50, 0xFFFF);
GFX_drawLine(40, 40, 50, 40, 0xFFFF);
GFX_drawLine(50, 40, 50, 50, 0xFFFF);
GFX_drawLine(40, 50, 50, 50, 0xFFFF);
	GFX_drawRect(30, 30, 60, 60, 0xFFFF);
	GFX_drawCircle(70, 70, 25, 0xFFFF);



GFX_drawPixel(50, 50, 0xFFFF);  // NE
GFX_drawPixel(51, 51, 0xFFFF);
GFX_drawPixel(52, 52, 0xFFFF);

GFX_drawPixel(50, 75, 0x4F8F);  //SE
GFX_drawPixel(51, 76, 0x4F8F);
GFX_drawPixel(52, 77, 0x4F8F);

GFX_drawPixel(25, 75, 0x8F4F);  //SW
GFX_drawPixel(26, 76, 0x8F4F);
GFX_drawPixel(27, 77, 0x8F4F);

GFX_drawPixel(25, 50, 0xF4F8);  //NW
GFX_drawPixel(26, 51, 0xF4F8);
GFX_drawPixel(27, 52, 0xF4F8);


GFX_drawLine(25, 50, 50, 75, 0xA4A4);
GFX_drawLine(25, 75, 50, 50, 0xA4A4);


GFX_drawTriangle(50, 50, 50, 75, 25, 75, 0xFFFF);





// 
// GFX_fillRect(30, 30, 60, 60, 0xFFFF);
// 

GFX_fillTriangle(5, 50, 50, 175, 135, 100, 0x1f00);
// GFX_fillRoundRect(5, 5, 200, 200, 10, 0xffff);
*/
GFX_fillCircle(70, 70, 25, 0x00f8);


GFX_drawRoundRect(5, 5, 200, 200, 20, 0xe007);


	GFX_refreshScreen();
}

