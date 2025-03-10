// *************************************************************************************** ILI9341.h
// *************************************************************************************************
struct ILI9341 {
	ILI9341(int16_t w, int16_t h);

	void init();
	void set_command(uint8_t cmd);
	void command_param(uint8_t data);
	void write_data(void *buffer, int bytes);
	void write_data(const uint8_t *buffer, int bytes);
	void pin_reset();

	// ************************************************** Adafruit base
	void begin();

	// ************************************************** Defining the virtual functions
	
};

