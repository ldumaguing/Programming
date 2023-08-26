#define LED_1 27
#define LED_2 1 // 33

#define GPIO_OUT_W1TS_REG 0x3FF44008
#define GPIO_OUT_W1TC_REG 0x3FF4400C
#define GPIO_ENABLE_REG   0x3FF44020

#define GPIO_OUT1_W1TS_REG 0x3FF44014
#define GPIO_OUT1_W1TC_REG 0x3FF44018
#define GPIO_ENABLE1_REG   0x3FF4402C

#define sleep_ms(x) vTaskDelay(x / portTICK_PERIOD_MS)

#define ACHTUNG1 *gpio_out_w1ts_reg = (1 << LED_1); sleep_ms(250); *gpio_out_w1tc_reg = (1 << LED_1); sleep_ms(250)
#define ACHTUNG2 *gpio_out1_w1ts_reg = (1 << LED_2); sleep_ms(250); *gpio_out1_w1tc_reg = (1 << LED_2); sleep_ms(250)

volatile uint32_t* gpio_out_w1ts_reg = (volatile uint32_t*) GPIO_OUT_W1TS_REG;
volatile uint32_t* gpio_out_w1tc_reg = (volatile uint32_t*) GPIO_OUT_W1TC_REG;
volatile uint32_t* gpio_enable_reg = (volatile uint32_t*) GPIO_ENABLE_REG;

volatile uint32_t* gpio_out1_w1ts_reg = (volatile uint32_t*) GPIO_OUT1_W1TS_REG;
volatile uint32_t* gpio_out1_w1tc_reg = (volatile uint32_t*) GPIO_OUT1_W1TC_REG;
volatile uint32_t* gpio_enable1_reg = (volatile uint32_t*) GPIO_ENABLE1_REG;

static inline void init_pins() {
	*gpio_enable_reg = (1 << LED_1);
	*gpio_out_w1tc_reg = (1 << LED_1);

	*gpio_enable1_reg = (1 << LED_2);
	*gpio_out1_w1tc_reg = (1 << LED_2);
};

void app_main(void) {
	init_pins();

	while(1) {
		ACHTUNG1;
		ACHTUNG2;
	}
}
