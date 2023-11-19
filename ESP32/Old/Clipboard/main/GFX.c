#include <stdio.h>
#include "gfx.h"
#include "uartinput.h"

#include "freertos/FreeRTOS.h"
#include "freertos/task.h"



void app_main(void) {
	int x = 20;
	int y = 20;
	int dpad = 0;
	
	GFX_init();
    UART_init();

    GFX_fillScreen(0x2108);

    //GFX_fillCircle(70, 70, 25, 0x00f8);
    //GFX_drawRoundRect(5, 5, 200, 200, 20, 0xe007);


	GFX_refreshScreen();
	// vTaskDelay(500 / portTICK_PERIOD_MS);
	
	
	for(;;) {
		dpad = UART_getDPad();
		printf(">%d; %d, %d\n", dpad, x, y);

		if(dpad & 0x04) x+=3;
		if(dpad & 0x08) x-=3;
		if(dpad & 0x01) y-=3;
		if(dpad & 0x02) y+=3;
		GFX_fillCircle(x, y, 5, 0x00f8);
		//GFX_drawPixel(x, y, 0x00f8);
		GFX_refreshScreen();
		vTaskDelay(10 / portTICK_PERIOD_MS);
	}
}

