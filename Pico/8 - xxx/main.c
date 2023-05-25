#include "pico/stdlib.h"
#include <stdio.h>
#include "defines.h"


int main() {
	stdio_usb_init();

	//gpio_init(2);
	//gpio_init(3);
	//gpio_init(4);
	//gpio_init(5);
	gpio_init_mask(0x3ffc);  // GPIOs 2 to 13

	//gpio_set_dir(2, GPIO_OUT);
	//gpio_set_dir(3, GPIO_OUT);
	//gpio_set_dir(4, GPIO_OUT);
	//gpio_set_dir(5, GPIO_OUT);
	gpio_set_dir_out_masked(0x3c);  // GPIOs 2 to 5

	while(1) {
		gpio_put(2, 1);
		gpio_put(3, 0);
		gpio_put(4, 0);
		gpio_put(5, 0);
		sleep_ms(500);
		gpio_put(2, 0);
		gpio_put(3, 1);
		gpio_put(4, 0);
		gpio_put(5, 0);
		sleep_ms(500);
		gpio_put(2, 0);
		gpio_put(3, 0);
		gpio_put(4, 1);
		gpio_put(5, 0);
		sleep_ms(500);
		gpio_put(2, 0);
		gpio_put(3, 0);
		gpio_put(4, 0);
		gpio_put(5, 1);
		sleep_ms(500);
	}
	return 0;
}

// *********************************************************************
// To get the printout, execute command:
// minicom -D /dev/ttyACM0 -b 115200
