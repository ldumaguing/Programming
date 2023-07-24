// *************** Sun Jul 23 10:40:44 PM EDT 2023
// *************************************************************************************************
#include <stdio.h>

#include "freertos/FreeRTOS.h"
#include "freertos/task.h"
#include "esp_log.h"
#include "driver/gpio.h"

// *************************************************************************************** ILI9341.h
// *************************************************************************************************
struct ILI9341 {
	void init();
	void set_command(uint8_t cmd);
	void command_param(uint8_t data);
	void write_data(void *buffer, int bytes);
	void write_data(const uint8_t *buffer, int bytes);
	void pin_reset();
	void render();

	// ************************************************** Adafruit base
	void begin();

	// ************************************************** Defining the virtual functions
	
};

void app_main(void) {

}

