#define	BLACK   0x0000
#define	BLUE    0x001F
#define	RED     0xF800
#define	GREEN   0x07E0
#define CYAN    0x07FF
#define MAGENTA 0xF81F
#define YELLOW  0xFFE0
#define WHITE   0xFFFF

#define LCD_CS    0
#define LCD_CD    1
#define LCD_WR    2
#define LCD_RD    3
#define LCD_RESET 4
#define LCD_D0    5

// *************************************************************************************************
void setup();
void loop();

// *************************************************************************************************
MAGA_TFTLCD tft = MAGA_TFTLCD(LCD_CS, LCD_CD, LCD_WR, LCD_RD, LCD_RESET, LCD_D0);

int main() {
	stdio_usb_init();

	

	setup();
	loop();
	
	return 0;
}

// *************************************************************************************************
void setup() {
	/*
	tft.reset();

	uint16_t identifier = tft.readID();
	if(identifier == 0x9341)
		std::cout << "Found ILI9341 LCD driver\n";
	else {
		std::cout << "Unknown LCD driver chip: " << identifier << "\n";
		return;
	}

	tft.begin(identifier);
	*/
}

void loop() {
	/*
	for(;;) {
		printf("%d, %d, %d\n", tft._d0, tft._d1, tft._d2);
		sleep_ms(5000);
	}
*/
}

