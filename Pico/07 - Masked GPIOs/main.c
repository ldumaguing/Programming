#include "pico/stdlib.h"
#include <stdio.h>


#define GPIO_ON  1
#define GPIO_OFF 0

#define PIN_0  0
#define PIN_1  1
#define PIN_2  2
#define PIN_3  3

int main() {
	stdio_usb_init();


	//gpio_init(PIN_0);
	//gpio_init(PIN_1);
	//gpio_init(PIN_2);
	//gpio_init(PIN_3);
	gpio_init_mask(0xf);
	
	//gpio_set_dir(PIN_0, GPIO_IN);
	//gpio_set_dir(PIN_1, GPIO_IN);
	//gpio_set_dir(PIN_2, GPIO_IN);
	//gpio_set_dir(PIN_3, GPIO_IN);
	gpio_set_dir_in_masked(0xf);

	gpio_pull_up(PIN_0);
	gpio_pull_up(PIN_1);
	gpio_pull_up(PIN_2);
	gpio_pull_up(PIN_3);


	while(true) {
		printf("%x\n", gpio_get_all());

		sleep_ms(1000);
	}

	return 0;
}

// *********************************************************************
// To get the printout, execute command:
// minicom -D /dev/ttyACM0 -b 115200
