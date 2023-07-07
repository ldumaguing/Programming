// ************************************************************************************* ILI9341.cpp
static inline void init_pins() {
	gpio_init_mask(ILI9341_MASK);
	gpio_set_dir_out_masked(ILI9341_MASK);
	gpio_set_mask(ILI9341_MASK);
};

static inline void CS_Active() {
    gpio_put(ILI9341_CS, 0);  // Active low
};

static inline void CS_Idle() {
    gpio_put(ILI9341_CS, 1);
};

static inline void WR_Strobe() {
	gpio_put(ILI9341_WR, 0);
	gpio_put(ILI9341_WR, 1);
};

static inline void WR_Idle() {
	gpio_put(ILI9341_WR, 1);
};

static inline void CD_Command() {
	gpio_put(ILI9341_CD, 0);
};

static inline void CD_Data() {
	gpio_put(ILI9341_CD, 1);
};

static inline void sio_write(const uint8_t *src, size_t len) {
	do {
		gpio_put_masked((0xff << ILI9341_D0), (*src << ILI9341_D0));
		WR_Strobe();

		len--;
		src++;
	} while (len > 0);
}

static inline void sio_write(void *src, size_t len) {
	char *x = (char *)src;
	do {
		gpio_put_masked((0xff << ILI9341_D0), (*x << ILI9341_D0));
		WR_Strobe();

		len--;
		x++;
	} while (len > 0);
}

// *************************************************************************************************
ILI9341::ILI9341(int16_t w, int16_t h): MAGA_GFX(w, h) {
	WIDTH = w;
	HEIGHT = h;
};

void ILI9341::init() {
	init_pins();
	set_command(0x01); //soft reset
	sleep_ms(1000);

	set_command(ILI9341_GAMMASET);
	command_param(0x01);

	// positive gamma correction
	set_command(ILI9341_GMCTRP1);
    write_data((const uint8_t[15]){ 0x0f, 0x31, 0x2b, 0x0c, 0x0e, 0x08, 0x4e, 0xf1, 0x37, 0x07, 0x10, 0x03, 0x0e, 0x09, 0x00 }, 15);

	// negative gamma correction
	set_command(ILI9341_GMCTRN1);
	write_data((const uint8_t[15]){ 0x00, 0x0e, 0x14, 0x03, 0x11, 0x07, 0x31, 0xc1, 0x48, 0x08, 0x0f, 0x0c, 0x31, 0x36, 0x0f }, 15);

	// memory access control
	set_command(ILI9341_MADCTL);
	command_param(0x48);

	// pixel format
	set_command(ILI9341_PIXFMT);
	command_param(0x55);  // 16-bit

	// frame rate; default, 70 Hz
	set_command(ILI9341_FRMCTR1);
	command_param(0x00);
	command_param(0x1B);

	// exit sleep
	set_command(ILI9341_SLPOUT);

	// display on
	set_command(ILI9341_DISPON);

	// column address set
	set_command(ILI9341_CASET);
	command_param(0x00);
	command_param(0x00);  // start column
	command_param(0x00);
	command_param(0xef);  // end column -> 239

	// page address set
	set_command(ILI9341_PASET);
	command_param(0x00);
	command_param(0x00);  // start page
	command_param(0x01);
	command_param(0x3f);  // end page -> 319

	set_command(ILI9341_RAMWR);


};

void ILI9341::set_command(uint8_t cmd) {
	CS_Active();
	CD_Command();
	sio_write(&cmd, 1);
	CD_Data();
	CS_Idle();
};

void ILI9341::command_param(uint8_t data) {
	CS_Active();
	sio_write(&data, 1);
	CS_Idle();
};

void ILI9341::write_data(void *buffer, int bytes) {
	CS_Active();
	sio_write(buffer, bytes);
	CS_Idle();
};

void ILI9341::write_data(const uint8_t *buffer, int bytes) {
	CS_Active();
	sio_write(buffer, bytes);
	CS_Idle();
};

// *********************************************************************************** Adafruit base
void ILI9341::begin() {
	init();
};

// ***********************************************
ILI9341 ili = ILI9341(ILI9341_TFTWIDTH, ILI9341_TFTHEIGHT);

