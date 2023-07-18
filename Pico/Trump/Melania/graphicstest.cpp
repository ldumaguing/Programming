// *************************************************************************************************
void testText();

void dotTest();
void fillScreenTest();
void lineTest(int);
void listColors();
void testFastLines(int, int);

void yield() {
	ili.render();
	sleep_ms(500);
};

// *************************************************************************************************
int main() {
	ili.begin();

	//fillScreen();

	//dotTest();

	// for (int i=0; i<150; i++) {
	//	lineTest(i);
	//}

	//listColors();
	
	//for (int c1=0; c1<150; c1++) {
	//	for (int c2=149; c2>=0; c2--) {
	//		testFastLines(c1, c2);
	//		ili.render();
	//	}
	//}



	return 0;
}



















void testFastLines(int color1, int color2) {
  int           x, y, w = ili._width, h = ili._height;

  ili.fillScreen(0);
  for(y=0; y<h; y+=5) ili.drawFastHLine(0, y, w, color1);
  for(x=0; x<w; x+=5) ili.drawFastVLine(x, 0, h, color2);

}

void listColors() {
	for (int i=0; i<150; i++) {
		ili.drawLine(0, i, 40, i, i);
		if ((i%10) == 0) ili.drawLine(41, i, 44, i, 149);
	}
	ili.render();
}

void dotTest() {
	ili.fillScreen(90);

	ili.setRotation(0);
	ili.drawPixel(100, 120, 25);

	ili.setRotation(1);
	ili.drawPixel(100, 120, 25);
	ili.drawPixel(101, 120, 25);
	ili.drawPixel(102, 120, 25);

	ili.setRotation(2);
	ili.drawPixel(100, 120, 25);
	ili.drawPixel(102, 120, 25);
	ili.drawPixel(104, 120, 25);

	ili.setRotation(3);
	ili.drawPixel(100, 120, 25);
	ili.drawPixel(102, 120, 25);
	ili.drawPixel(104, 120, 25);
	ili.drawPixel(105, 120, 25);
	ili.drawPixel(106, 120, 25);
	ili.drawPixel(107, 120, 25);


	ili.render();
}

void fillScreenTest() {
	for (int i=0; i<150; i++) {
		ili.fillScreen(i);
		ili.render();
		sleep_ms(10);
	}
}

void testText() {

/*
  void start = micros();
  ili.setCursor(0, 0);
  ili.setTextColor(ILI9341_WHITE);  ili.setTextSize(1);
  ili.println("Hello World!");
  ili.setTextColor(ILI9341_YELLOW); ili.setTextSize(2);
  ili.println(1234.56);
  ili.setTextColor(ILI9341_RED);    ili.setTextSize(3);
  ili.println(0xDEADBEEF, HEX);
  ili.println();
  ili.setTextColor(ILI9341_GREEN);
  ili.setTextSize(5);
  ili.println("Groop");
  ili.setTextSize(2);
  ili.println("I implore thee,");
  ili.setTextSize(1);
  ili.println("my foonting turlingdromes.");
  ili.println("And hooptiously drangle me");
  ili.println("with crinkly bindlewurdles,");
  ili.println("Or I will rend thee");
  ili.println("in the gobberwarts");
  ili.println("with my blurglecruncheon,");
  ili.println("see if I don't!");
  */
}

void lineTest(int color) {
  int           x1, y1, x2, y2,
                w = ili._width,
                h = ili._height;

  ili.fillScreen(0);

  
  x1 = y1 = 0;
  y2    = h - 1;

  for(x2=0; x2<w; x2+=6) ili.drawLine(x1, y1, x2, y2, color);
  x2    = w - 1;
  for(y2=0; y2<h; y2+=6) ili.drawLine(x1, y1, x2, y2, color);


yield();
  ili.fillScreen(0);


  x1    = w - 1;
  y1    = 0;
  y2    = h - 1;

  for(x2=0; x2<w; x2+=6) ili.drawLine(x1, y1, x2, y2, color);
  x2    = 0;
  for(y2=0; y2<h; y2+=6) ili.drawLine(x1, y1, x2, y2, color);


yield();
  ili.fillScreen(0);


  x1    = 0;
  y1    = h - 1;
  y2    = 0;

  for(x2=0; x2<w; x2+=6) ili.drawLine(x1, y1, x2, y2, color);
  x2    = w - 1;
  for(y2=0; y2<h; y2+=6) ili.drawLine(x1, y1, x2, y2, color);


yield();
  ili.fillScreen(0);


  x1    = w - 1;
  y1    = h - 1;
  y2    = 0;

  for(x2=0; x2<w; x2+=6) ili.drawLine(x1, y1, x2, y2, color);
  x2    = 0;
  for(y2=0; y2<h; y2+=6) ili.drawLine(x1, y1, x2, y2, color);


  
}


