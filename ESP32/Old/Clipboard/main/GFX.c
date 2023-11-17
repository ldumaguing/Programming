#include <stdio.h>
#include "gfx.h"
#include "uartinput.h"

#include "freertos/FreeRTOS.h"
#include "freertos/task.h"





void app_main(void) {
	GFX_init();
    UART_init();

    GFX_fillScreen2(0x1f00, 0xd007);

    GFX_fillCircle(70, 70, 25, 0x00f8);
    GFX_drawRoundRect(5, 5, 200, 200, 20, 0xe007);


	GFX_refreshScreen();
}

