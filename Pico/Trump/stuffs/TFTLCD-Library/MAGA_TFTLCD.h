// *************************************************************************************************
// *************************************************************************************************
struct MAGA_TFTLCD : public MAGA_GFX {
	MAGA_TFTLCD(uint8_t cs, uint8_t cd, uint8_t wr, uint8_t rd, uint8_t rst, uint8_t d0, int16_t w,
		int16_t h);

	void foo();
	void reset();

	// ***** GPIO Pins manipulations
	void CD_Command();
	void CD_Data();

	void CS_Active();
	void CS_Idle();

	// void RD_Idle();

	void WR_Idle();
	void WR_Strobe();

	// ***** Mine
	void sio_write(uint8_t *src, size_t len);
	void sio_write(uint16_t *src, size_t len);
	void init_pins();

	// ***** GPIO functions
	void MAGA_gpio_init_mask(uint32_t aNum);
	void MAGA_gpio_set_dir_out_masked(uint32_t aNum);
	void MAGA_gpio_set_mask(uint32_t aNum);
	void MAGA_gpio_put(uint32_t aPin, bool yN);
	void MAGA_gpio_put_masked(uint32_t mask, uint32_t val);

	// ***** ILI9341 stuffs
	void ili9341_set_command(uint8_t cmd);
	void ili9341_command_param(uint8_t data);
	void ili9341_init();
	void ili9341_write_data(uint8_t *buffer, int bytes);
	void ili9341_write_data(uint16_t *buffer, int bytes);

	protected:
		uint8_t _cs, _cd, _wr, _rd, _rst, _d0;
};

