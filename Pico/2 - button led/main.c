#include "pico/stdlib.h"

#define GPIO_ON  1
#define GPIO_OFF 0

#define LED_PIN     25
#define BUTTON_PIN  7

int main() {
   stdio_usb_init();

   gpio_init(LED_PIN);
   gpio_set_dir(LED_PIN, GPIO_OUT);

   gpio_init(BUTTON_PIN);
   gpio_set_dir(BUTTON_PIN, GPIO_IN);
   gpio_pull_up(BUTTON_PIN);  // required



   while(true) {
      if(!gpio_get(BUTTON_PIN)) {
         printf("button was pressed\n");
         gpio_put(LED_PIN, GPIO_ON);
         sleep_ms(2000);

         gpio_put(LED_PIN, GPIO_OFF);
      }
   }

   return 0;
}

// *********************************************************************
// To get the printout, execute command:
// minicom -D /dev/ttyACM0 -b 115200

