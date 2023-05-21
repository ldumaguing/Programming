#include "pico/stdlib.h"
#include "defines.h"
#include <stdio.h>

int main() {
   stdio_usb_init();

   gpio_init(ILI9341_CS);
   gpio_init(ILI9341_CD);  // D/CX
   gpio_init(ILI9341_WR);  // WRX
   gpio_init(ILI9341_RD);  // RDX
   gpio_init(ILI9341_D0);
   gpio_init(ILI9341_D1);
   gpio_init(ILI9341_D2);
   gpio_init(ILI9341_D3);
   gpio_init(ILI9341_D4);
   gpio_init(ILI9341_D5);
   gpio_init(ILI9341_D6);
   gpio_init(ILI9341_D7);
   gpio_init(ILI9341_RST);


while(1) {
printf("fish\n");



   // Start
   gpio_set_dir(ILI9341_CS, GPIO_OUT);
   gpio_put(ILI9341_CS, 1);
   gpio_set_dir(ILI9341_RST, GPIO_OUT);
   gpio_put(ILI9341_RST, 1);
   gpio_set_dir(ILI9341_CD, GPIO_OUT);   // D/CX
   gpio_put(ILI9341_CD, 1);
   gpio_set_dir(ILI9341_WR, GPIO_OUT);
   gpio_put(ILI9341_WR, 1);
   gpio_set_dir(ILI9341_RD, GPIO_OUT);
   gpio_put(ILI9341_RD, 1);
   
   // Chip select
   gpio_put(ILI9341_CS, 0);   // active low
   sleep_ms(100);
   
  
   // D/CX
   gpio_put(ILI9341_CD, 0);
   sleep_ms(100);
   
   // command address
   gpio_put(ILI9341_WR, 0);

   gpio_put(ILI9341_D0, 0);
   gpio_put(ILI9341_D1, 0);
   gpio_put(ILI9341_D2, 1);
   gpio_put(ILI9341_D3, 0);
   gpio_put(ILI9341_D4, 0);
   gpio_put(ILI9341_D5, 0);
   gpio_put(ILI9341_D6, 0);
   gpio_put(ILI9341_D7, 0);
   sleep_ms(100);  // ?





   // read strobe
   gpio_put(ILI9341_RD, 0);
   sleep_ms(100);  // ?
   gpio_put(ILI9341_RD, 1);
   sleep_ms(100);  // ?
   
   // read data
   gpio_put(ILI9341_RD, 0);
   sleep_ms(100);  // ?
   for (int i=ILI9341_D0; i<=ILI9341_D7; ++i) {
       gpio_set_dir(i, GPIO_IN);
   }
   sleep_ms(100);  // ?

   printf("1) ");
   for (int i=ILI9341_D0; i<=ILI9341_D7; ++i) {
      if (gpio_get(i) == 0) {
         printf("0");
      }
      else {
         printf("1");
      }
   }
   printf("\n");
   sleep_ms(100);  // ?










   // read strobe
   gpio_put(ILI9341_RD, 0);
   sleep_ms(100);  // ?
   gpio_put(ILI9341_RD, 1);
   sleep_ms(100);  // ?
   
   // read data
   gpio_put(ILI9341_RD, 0);
   sleep_ms(100);  // ?
   for (int i=ILI9341_D0; i<=ILI9341_D7; ++i) {
       gpio_set_dir(i, GPIO_IN);
   }
   sleep_ms(100);  // ?

   printf("2) ");
   for (int i=ILI9341_D0; i<=ILI9341_D7; ++i) {
      if (gpio_get(i) == 0) {
         printf("0");
      }
      else {
         printf("1");
      }
   }
   printf("\n");
   sleep_ms(100);  // ?


















   // read strobe
   gpio_put(ILI9341_RD, 0);
   sleep_ms(100);  // ?
   gpio_put(ILI9341_RD, 1);
   sleep_ms(100);  // ?
   
   // read data
   gpio_put(ILI9341_RD, 0);
   sleep_ms(100);  // ?
   for (int i=ILI9341_D0; i<=ILI9341_D7; ++i) {
       gpio_set_dir(i, GPIO_IN);
   }
   sleep_ms(100);  // ?

   printf("3) ");
   for (int i=ILI9341_D0; i<=ILI9341_D7; ++i) {
      if (gpio_get(i) == 0) {
         printf("0");
      }
      else {
         printf("1");
      }
   }
   printf("\n");
   sleep_ms(100);  // ?















   // read strobe
   gpio_put(ILI9341_RD, 0);
   sleep_ms(100);  // ?
   gpio_put(ILI9341_RD, 1);
   sleep_ms(100);  // ?
   
   // read data
   gpio_put(ILI9341_RD, 0);
   sleep_ms(100);  // ?
   for (int i=ILI9341_D0; i<=ILI9341_D7; ++i) {
       gpio_set_dir(i, GPIO_IN);
   }
   sleep_ms(100);  // ?

   printf("4) ");
   for (int i=ILI9341_D0; i<=ILI9341_D7; ++i) {
      if (gpio_get(i) == 0) {
         printf("0");
      }
      else {
         printf("1");
      }
   }
   printf("\n");
   sleep_ms(100);  // ?














   
   
   
   
   
   

      sleep_ms(2000);
   }
   
/*
   gpio_init(LED_PIN);
   gpio_set_dir(LED_PIN, GPIO_OUT);


   while(true) {
      printf("fish\n");
      gpio_put(LED_PIN, GPIO_ON);
      sleep_ms(2000);

      printf("monger\n");
      gpio_put(LED_PIN, GPIO_OFF);
      sleep_ms(2000);
   }
*/
   return 0;
}

// *********************************************************************
// To get the printout, execute command:
// minicom -D /dev/ttyACM0 -b 115200

