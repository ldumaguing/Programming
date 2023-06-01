#include "pico/stdlib.h"
#include "pico/multicore.h"
#include <stdio.h>


#define GPIO_OFF   0
#define GPIO_ON    1

#define pauseLCD  16
#define BUTTON_Y  15
#define ILI9341_CS  2
#define ILI9341_CD  3
#define ILI9341_WR  4
#define ILI9341_RD  5

#define interface_mask   0x3c   // GPIOs 2 - 5
#define comm_n_data_mask 0x3fc0 // GPIOs 6 - 13
#define GPIOs_mask       0x3ffc // GPIOs 2 - 13

#define wait_2000  sleep_ms(2000)
#define wait_1     sleep_ms(250)
#define wait_2     sleep_ms(500)
#define wait_3     sleep_ms(750)
#define wait_pause sleep_ms(500)

// ***************************************************************************************
void main2() {
	gpio_set_dir_in_masked(comm_n_data_mask);
	gpio_pull_up(6);
	gpio_pull_up(7);
	gpio_pull_up(8);
	gpio_pull_up(9);
	gpio_pull_up(10);
	gpio_pull_up(11);
	gpio_pull_up(12);
	gpio_pull_up(13);
	wait_2000;

	uint32_t X = 0;
    uint32_t Y = 10000;

	while(1) {
		X = gpio_get(6);

		X = X << 1;
		X |= gpio_get(7);
		X = X << 1;
		X |= gpio_get(8);
		X = X << 1;
		X |= gpio_get(9);
		X = X << 1;
		X |= gpio_get(10);
		X = X << 1;
		X |= gpio_get(11);
		X = X << 1;
		X |= gpio_get(12);
		X = X << 1;
		X |= gpio_get(13);

		if (Y != X) {
			printf("%x\n", Y);
			Y = X;
		}
	}
}

// ***************************************************************************************
void col_20() {
	wait_3;
}

void col_19() {
	gpio_put(ILI9341_RD, GPIO_ON);
	wait_1;
}

void col_18() {
	gpio_put(ILI9341_CS, GPIO_ON);
	wait_1;
}

void col_17() {
	wait_2;
}

void col_16() {
	gpio_put(ILI9341_RD, GPIO_OFF);
	wait_1;
}

void col_15() {
	wait_2;
}

void col_14() {
	wait_1;
}

void col_13() {
	wait_1;
}

void col_12() {
	gpio_put(ILI9341_RD, GPIO_ON);
	wait_1;
}

void col_11() {
	wait_3;
}

void col_10() {
	gpio_put(ILI9341_RD, GPIO_OFF);
	wait_1;
}

void col_09() {
	gpio_put(pauseLCD, GPIO_ON);
	wait_pause;
	gpio_put(pauseLCD, GPIO_OFF);
}

void col_08() {
	wait_1;
}

void col_07() {
	gpio_put(ILI9341_CD, GPIO_ON);
	wait_1;
}

void col_06() {
	wait_1;
}

void col_05() {
	gpio_put(ILI9341_WR, GPIO_ON);
	wait_1;
}

void col_04() {
	wait_3;
}

void col_03() {
	gpio_put(ILI9341_WR, GPIO_OFF);
	wait_1;
}

void col_02() {
	gpio_put(ILI9341_CD, GPIO_OFF);
	wait_1;
}

void col_01() {
	gpio_put(ILI9341_CS, GPIO_OFF);
	wait_1;
}

void col_00() {
	printf("*******************\n");
	gpio_put(ILI9341_CS, GPIO_ON);
	gpio_put(ILI9341_CD, GPIO_ON);
	gpio_put(ILI9341_WR, GPIO_ON);
	gpio_put(ILI9341_RD, GPIO_ON);
	wait_2000;
}

// ***************************************************************************************
int main() {
	stdio_usb_init();

	gpio_init_mask(GPIOs_mask);

	gpio_set_dir_out_masked(interface_mask);
	// gpio_set_dir_in_masked(comm_n_data_mask);

	multicore_launch_core1(main2);

	gpio_init(pauseLCD);
	gpio_set_dir(pauseLCD, GPIO_OUT);
	gpio_put(pauseLCD, GPIO_OFF);

	while(true) {
		col_00();
		col_01();
		col_02();
		col_03();
		col_04();
		col_05();
		col_06();
		col_07();
		col_08();
		col_09();
		col_10();
		col_11();
		col_12();
		col_13();
		col_14();
		col_15();
		col_16();
		col_17();
		col_18();
		col_19();
		col_20();

		gpio_clr_mask(0x3c);
		wait_2000;
	}

	return 0;
}

// *********************************************************************
// To get the printout, execute command:
// minicom -D /dev/ttyACM0 -b 115200
