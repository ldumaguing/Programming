#include "pico/stdlib.h"
#include <stdio.h>


#define GPIO_OFF 0
#define GPIO_ON  1

#define GPIO_2  2
#define GPIO_3  3
#define GPIO_4  4
#define GPIO_5  5

#define interface_mask  0x3c   // GPIOs 2 - 5

int main() {
	stdio_usb_init();

	gpio_init_mask(interface_mask);
	gpio_set_dir_out_masked(interface_mask);

	while(true) {
		gpio_put(GPIO_2, GPIO_OFF);
		gpio_put(GPIO_3, GPIO_OFF);
		gpio_put(GPIO_4, GPIO_OFF);
		gpio_put(GPIO_5, GPIO_OFF);
		sleep_ms(500);
		gpio_put(GPIO_2, GPIO_ON);
		gpio_put(GPIO_3, GPIO_OFF);
		gpio_put(GPIO_4, GPIO_OFF);
		gpio_put(GPIO_5, GPIO_OFF);
		sleep_ms(500);
		gpio_put(GPIO_2, GPIO_OFF);
		gpio_put(GPIO_3, GPIO_ON);
		gpio_put(GPIO_4, GPIO_OFF);
		gpio_put(GPIO_5, GPIO_OFF);
		sleep_ms(500);
		gpio_put(GPIO_2, GPIO_OFF);
		gpio_put(GPIO_3, GPIO_OFF);
		gpio_put(GPIO_4, GPIO_ON);
		gpio_put(GPIO_5, GPIO_OFF);
		sleep_ms(500);
		gpio_put(GPIO_2, GPIO_OFF);
		gpio_put(GPIO_3, GPIO_OFF);
		gpio_put(GPIO_4, GPIO_OFF);
		gpio_put(GPIO_5, GPIO_ON);
		sleep_ms(500);
	}

	return 0;
}

// *********************************************************************
// To get the printout, execute command:
// minicom -D /dev/ttyACM0 -b 115200
