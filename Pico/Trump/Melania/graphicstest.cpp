// *************************************************************************************************
#define BUTTON_UP    15
#define BUTTON_DOWN  16

void testText();

void dotTest();
void fillScreenTest();
void lineTest(int);
void listColors();
void testFastLines(int, int);
void testRects(int);
void testFilledRects(int, int);
void testCircles(uint8_t, int);
void testRects_v2();

void yield() {
	ili.render();
	sleep_ms(500);
};

void initButtons() {
	gpio_init(BUTTON_UP);
   gpio_set_dir(BUTTON_UP, GPIO_IN);
   gpio_pull_up(BUTTON_UP);

	gpio_init(BUTTON_DOWN);
   gpio_set_dir(BUTTON_DOWN, GPIO_IN);
   gpio_pull_up(BUTTON_DOWN); 
}

int currColor = 0;

// *************************************************************************************************
void main2() {
	for(;;) {
      if(!gpio_get(BUTTON_UP)) {
			currColor++;
			if (currColor >= 150) currColor = 0;
		}
      if(!gpio_get(BUTTON_DOWN)) {
			currColor--;
			if (currColor < 0) currColor = 149;
		}
		sleep_ms(200);
	}
}

// *************************************************************************************************
int main() {
	initButtons();
   multicore_launch_core1(main2);

	ili.begin();

	//ili.fillScreen(TFT_RED);
	//ili.render();
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

	//testRects(TFT_RED);
	//testFilledRects(74, 9);
	//testCircles(10, 147);

	for(;;) {
		testRects_v2();
		ili.render();
		sleep_ms(10);
	}

	return 0;
}

void testRects_v2() {
	ili.fillScreen(currColor);
	ili.drawLine(41, currColor, 44, currColor, TFT_BLACK);

}




void testCircles(uint8_t radius, int color) {
  int           x, y, r2 = radius * 2,
                w = ili._width  + radius,
                h = ili._height + radius;


  for(x=0; x<w; x+=r2) {
    for(y=0; y<h; y+=r2) {
      ili.drawCircle(x, y, radius, color);
    }
  }

}























void testFilledRects(int color1, int color2) {
  int           n, i, i2,
                cx = ili._width  / 2 - 1,
                cy = ili._height / 2 - 1;

  ili.fillScreen(0);
  n = min(ili._width, ili._height);
  for(i=n; i>0; i-=6) {
    i2    = i / 2;
    ili.fillRect(cx-i2, cy-i2, i, i, color1);
    // Outlines are not included in timing results
    ili.drawRect(cx-i2, cy-i2, i, i, color2);
  }

}

void testRects(int color) {
  int           n, i, i2,
                cx = ili._width  / 2,
                cy = ili._height / 2;

  ili.fillScreen(0);
  n     = min(ili._width, ili._height);
  for(i=2; i<n; i+=6) {
    i2 = i / 2;
    ili.drawRect(cx-i2, cy-i2, i, i, color);
  }

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


