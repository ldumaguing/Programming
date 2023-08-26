// ************************************************************************************** ILI9341.c
// #define sleep_ms(a) vTaskDelay(a / portTICK_PERIOD_MS)   // defined in freertos

#define ILI9341_CS  26
#define ILI9341_CD  2
#define ILI9341_WR  4
#define ILI9341_RD  16

#define ILI9341_MISC1 27
#define ILI9341_MISC2 1 // 33

#define ILI9341_D0 17
#define ILI9341_D1 5
#define ILI9341_D2 18
#define ILI9341_D3 19
#define ILI9341_D4 21
#define ILI9341_D5 22
#define ILI9341_D6 23
#define ILI9341_D7 25

#define ILI9341_TFTWIDTH 240  ///< ILI9341 max TFT width
#define ILI9341_TFTHEIGHT 320 ///< ILI9341 max TFT height
#define ILI9341_SIZE (ILI9341_TFTHEIGHT * ILI9341_TFTWIDTH)

#define GPIO_OUT_W1TS_REG 0x3FF44008
#define GPIO_OUT_W1TC_REG 0x3FF4400C
#define GPIO_ENABLE_REG   0x3FF44020

#define GPIO_OUT1_W1TS_REG 0x3FF44014
#define GPIO_OUT1_W1TC_REG 0x3FF44018
#define GPIO_ENABLE1_REG   0x3FF4402C

#define controlPins 0x4010014
#define datumPins   0x2EE0020

#define CS_ACTIVE  *gpio_out_w1tc_reg = (1 << ILI9341_CS)
#define CS_IDLE    *gpio_out_w1ts_reg = (1 << ILI9341_CS)
#define CD_COMMAND *gpio_out_w1tc_reg = (1 << ILI9341_CD)
#define CD_DATA    *gpio_out_w1ts_reg = (1 << ILI9341_CD)
#define WR_IDLE    *gpio_out_w1ts_reg = (1 << ILI9341_IDLE)
#define WR_STROBE  *gpio_out_w1tc_reg = (1 << ILI9341_WR); *gpio_out_w1ts_reg = (1 << ILI9341_WR)
#define RD_STROBE  *gpio_out_w1tc_reg = (1 << ILI9341_RD); *gpio_out_w1ts_reg = (1 << ILI9341_RD)

// #define ACHTUNG1   *gpio_out_w1ts_reg = (1 << ILI9341_MISC1); sleep_ms(250); *gpio_out_w1tc_reg = (1 << ILI9341_MISC1); sleep_ms(250)
// #define ACHTUNG2   *gpio_out1_w1ts_reg = (1 << ILI9341_MISC2); sleep_ms(250); *gpio_out1_w1tc_reg = (1 << ILI9341_MISC2); sleep_ms(250)
#define ACHTUNG1_ON   *gpio_out_w1ts_reg = (1 << ILI9341_MISC1)
#define ACHTUNG1_OFF  *gpio_out_w1tc_reg = (1 << ILI9341_MISC1)
#define ACHTUNG2_ON   *gpio_out_w1ts_reg = (1 << ILI9341_MISC2)
#define ACHTUNG2_OFF  *gpio_out_w1tc_reg = (1 << ILI9341_MISC2)

uint16_t screenbuffer[ILI9341_SIZE];

volatile uint32_t* gpio_out_w1ts_reg = (volatile uint32_t*) GPIO_OUT_W1TS_REG;
volatile uint32_t* gpio_out_w1tc_reg = (volatile uint32_t*) GPIO_OUT_W1TC_REG;
volatile uint32_t* gpio_enable_reg = (volatile uint32_t*) GPIO_ENABLE_REG;

volatile uint32_t* gpio_out1_w1ts_reg = (volatile uint32_t*) GPIO_OUT1_W1TS_REG;
volatile uint32_t* gpio_out1_w1tc_reg = (volatile uint32_t*) GPIO_OUT1_W1TC_REG;
volatile uint32_t* gpio_enable1_reg = (volatile uint32_t*) GPIO_ENABLE1_REG;

static inline void init_pins() {
	*gpio_enable_reg = datumPins | controlPins | (1 << ILI9341_MISC1);
	*gpio_out_w1ts_reg = datumPins | controlPins;
	*gpio_out_w1tc_reg = datumPins;
	*gpio_out_w1tc_reg = (1 << ILI9341_MISC1);

	*gpio_enable1_reg = (1 << ILI9341_MISC2);
	*gpio_out1_w1tc_reg = (1 << ILI9341_MISC2);
};

static inline void sio_write(void *src, size_t len) {
	char *x = (char *)src;
	uint32_t datum;
	do {
		datum = 0;
		*gpio_out_w1tc_reg = datumPins;
/*
		if(*x&1) *gpio_out_w1ts_reg = (1 << ILI9341_D0);
		if(*x&2) *gpio_out_w1ts_reg = (1 << ILI9341_D1);
		if(*x&4) *gpio_out_w1ts_reg = (1 << ILI9341_D2);
		if(*x&8) *gpio_out_w1ts_reg = (1 << ILI9341_D3);
		if(*x&16) *gpio_out_w1ts_reg = (1 << ILI9341_D4);
		if(*x&32) *gpio_out_w1ts_reg = (1 << ILI9341_D5);
		if(*x&64) *gpio_out_w1ts_reg = (1 << ILI9341_D6);
		if(*x&128) *gpio_out_w1ts_reg = (1 << ILI9341_D7);

		datum |= ((*x&1) << ILI9341_D0);         // 17
		datum |= ((*x&2) << (ILI9341_D1-1));     // 5
		datum |= ((*x&4) << (ILI9341_D2-2));     // 18
		datum |= ((*x&8) << (ILI9341_D3-3));     // 19
		datum |= ((*x&16) << (ILI9341_D4-4));    // 21
		datum |= ((*x&32) << (ILI9341_D5-5));    // 22
		datum |= ((*x&64) << (ILI9341_D6-6));    // 23
		datum |= ((*x&128) << (ILI9341_D7-7));   // 25
*/
		datum |= ((*x&1) << 17);     // 17 - 0
		datum |= ((*x&2) << 4);      // 5  - 1
		datum |= ((*x&4) << 16);     // 18 - 2
		datum |= ((*x&8) << 16);     // 19 - 3
		datum |= ((*x&16) << 17);    // 21 - 4
		datum |= ((*x&32) << 17);    // 22 - 5
		datum |= ((*x&64) << 17);    // 23 - 6
		datum |= ((*x&128) << 18);   // 25 - 7

		*gpio_out_w1ts_reg = datum;
		WR_STROBE;

		len--;
		x++;
	} while (len > 0);
}

// ************************************************************************************************
void ILI9341_init() {
	init_pins();

	ILI9341_set_command(0x01); //soft reset
	// sleep_ms(1000);

	ILI9341_set_command(ILI9341_GAMMASET);
	ILI9341_command_param(0x01);

	// memory access control
	ILI9341_set_command(ILI9341_MADCTL);
	ILI9341_command_param(0x48);

	// pixel format
	ILI9341_set_command(ILI9341_PIXFMT);
	ILI9341_command_param(0x55);  // 16-bit

	// frame rate; default, 70 Hz
	ILI9341_set_command(ILI9341_FRMCTR1);
	ILI9341_command_param(0x00);
	ILI9341_command_param(0x1B);

	// exit sleep
	ILI9341_set_command(ILI9341_SLPOUT);

	// display on
	ILI9341_set_command(ILI9341_DISPON);

	// column address set
	ILI9341_set_command(ILI9341_CASET);
	ILI9341_command_param(0x00);
	ILI9341_command_param(0x00);  // start column
	ILI9341_command_param(0x00);
	ILI9341_command_param(0xef);  // end column -> 239

	// page address set
	ILI9341_set_command(ILI9341_PASET);
	ILI9341_command_param(0x00);
	ILI9341_command_param(0x00);  // start page
	ILI9341_command_param(0x01);
	ILI9341_command_param(0x3f);  // end page -> 319

	ILI9341_set_command(ILI9341_RAMWR);
	
	*gpio_out_w1tc_reg = datumPins;
	*gpio_out_w1ts_reg = controlPins;
};

void ILI9341_set_command(uint8_t cmd) {
	CS_ACTIVE;
	CD_COMMAND;
	sio_write(&cmd, 1);
	CD_DATA;
	CS_IDLE;
};

void ILI9341_command_param(uint8_t data) {
	CS_ACTIVE;
	sio_write(&data, 1);
	CS_IDLE;
};

void ILI9341_write_data(void *buffer, int bytes) {
	CS_ACTIVE;
	sio_write(buffer, bytes);
	CS_IDLE;
};

