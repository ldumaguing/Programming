// ************************************************************************************** ILI9341.h
// ************************************************************************************************
struct ILI9341 {
	ILI9341(uint8_t cs, uint8_t cd, uint8_t wr, uint8_t rd, uint8_t rst, uint8_t d0, int16_t w,
		int16_t h);

	void init();
	void set_command(uint8_t cmd);
	void command_param(uint8_t data);
	// void write_data(void *buffer, int bytes);



	protected:
		uint8_t _cs, _cd, _wr, _rd, _rst, _d0;
		uint16_t _w, _h;
};


