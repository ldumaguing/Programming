// ************************************************************************************** ILI9341.h
// ************************************************************************************************
struct ILI9341 {
	ILI9341();

	void init();
	void set_command(uint8_t cmd);
	void command_param(uint8_t data);
	void write_data(void *buffer, int bytes);



	protected:
		uint8_t _cs, _cd, _wr, _rd, _rst, _d0;
		uint16_t _w, _h;
};


