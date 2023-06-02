#include "pico/stdlib.h"
#include "pico/multicore.h"
#include <stdio.h>


#define GPIO_OFF   0
#define GPIO_ON    1

#define BUTTON_Y  15
#define ILI9341_CS  2
#define ILI9341_CD  3
#define ILI9341_WR  4
#define ILI9341_RD  5

#define interface_mask   0x3c   // GPIOs 2 - 5
#define comm_n_data_mask 0x3fc0 // GPIOs 6 - 13
#define GPIOs_mask       0x3ffc // GPIOs 2 - 13

#define wait_2sec  sleep_ms(2000)
#define wait_3sec  sleep_ms(3000)
#define wait_1     sleep_ms(1)
#define wait_2     sleep_ms(1)
#define wait_3     sleep_ms(1)
#define wait_pause sleep_ms(1)

// ***************************************************************************************
void high_zero() {
	gpio_set_dir_in_masked(comm_n_data_mask);
	gpio_pull_up(6);
	gpio_pull_up(7);
	gpio_pull_up(8);
	gpio_pull_up(9);
	gpio_pull_up(10);
	gpio_pull_up(11);
	gpio_pull_up(12);
	gpio_pull_up(13);
}

// ***************************************************************************************
void main2() {
	high_zero();
	wait_2sec;

	uint32_t X = 0;
    uint32_t Y = 10000;

	while(1) {
		X = gpio_get_all();
		X &= comm_n_data_mask;

		if (Y != X) {
			printf(". %x\n", Y);
			Y = X;
		}
	}
}

// ***************************************************************************************
void col_16() {
printf("******************* 16\n");
	gpio_put(ILI9341_RD, GPIO_ON);
	wait_1;
	uint32_t X = gpio_get_all();
	X &= comm_n_data_mask;
	printf(">>> %x\n", X);
}

void col_15() {
printf("******************* 15\n");
	wait_3;
}

void col_14() {
printf("******************* 14\n");
	gpio_put(ILI9341_RD, GPIO_OFF);
	//uint32_t X = gpio_get_all();
	//X &= comm_n_data_mask;
	//printf(">> %x\n", X);
	wait_1;
}

void col_13() {
printf("******************* 13\n");
	wait_3;
}

void col_12() {
printf("******************* 12\n");
	gpio_put(ILI9341_RD, GPIO_ON);
	wait_1;
}

void col_11() {
printf("******************* 11\n");
	wait_3;
}

void col_10() {
printf("******************* 10\n");
	gpio_put(ILI9341_RD, GPIO_OFF);
	wait_1;
}

void col_09() {
printf("******************* 9\n");
	wait_pause;
}

void col_08() {
printf("******************* 8\n");
	//high_zero();
	gpio_set_dir_in_masked(comm_n_data_mask);
	wait_1;
}

void col_07() {
printf("******************* 7\n");
	gpio_put(ILI9341_CD, GPIO_ON);
	wait_1;
}

void col_06() {
printf("******************* 6\n");
	wait_1;
}

void col_05() {
printf("******************* 5\n");
	gpio_put(ILI9341_WR, GPIO_ON);
	wait_1;
}

void col_04() {
printf("******************* 4\n");
	wait_3;
}

void col_03() {
printf("******************* 3\n");
	gpio_put(ILI9341_WR, GPIO_OFF);
	
	// gpio_init_mask(comm_n_data_mask);
/*
	gpio_disable_pulls(6);
	gpio_disable_pulls(7);
	gpio_disable_pulls(8);
	gpio_disable_pulls(9);
	gpio_disable_pulls(10);
	gpio_disable_pulls(11);
	gpio_disable_pulls(12);
	gpio_disable_pulls(13);
*/
	gpio_set_dir_out_masked(comm_n_data_mask);
	gpio_put(6, 0);
	gpio_put(7, 0);
	gpio_put(8, 1);
	gpio_put(9, 0);
	gpio_put(10, 0);
	gpio_put(11, 0);
	gpio_put(12, 0);
	gpio_put(13, 0);
	
	wait_1;
}

void col_02() {
printf("******************* 2\n");
	gpio_put(ILI9341_CD, GPIO_OFF);
	wait_1;
}

void col_01() {
printf("******************* 1\n");
	gpio_put(ILI9341_CS, GPIO_OFF);
	wait_1;
}

void col_00() {
	printf("**************************************\n");
	gpio_put(ILI9341_CS, GPIO_ON);
	gpio_put(ILI9341_CD, GPIO_ON);
	gpio_put(ILI9341_WR, GPIO_ON);
	gpio_put(ILI9341_RD, GPIO_ON);

	high_zero();

	wait_2sec;
}

// ***************************************************************************************
int main() {
	stdio_usb_init();

	gpio_init_mask(GPIOs_mask);

	gpio_set_dir_out_masked(interface_mask);

	multicore_launch_core1(main2);
wait_2sec;
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

		col_13();
		col_14();
		col_15();
		col_16();

		col_13();
		col_14();
		col_15();
		col_16();


		gpio_clr_mask(0x3c);
		wait_2sec;
	}

	return 0;
}

// *********************************************************************
// To get the printout, execute command:
// minicom -D /dev/ttyACM0 -b 115200
