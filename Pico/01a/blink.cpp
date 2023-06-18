#include "pico/stdlib.h"

#include <iostream>

using namespace std;

#define GPIO_ON  1
#define GPIO_OFF 0

#define LED_PIN  25

int main() {
   gpio_init(LED_PIN);
   gpio_set_dir(LED_PIN, GPIO_OUT);
   stdio_usb_init();

   while(true) {
      cout << "fish\n";
      gpio_put(LED_PIN, GPIO_ON);
      sleep_ms(2000);

      cout << "monger\n";
      gpio_put(LED_PIN, GPIO_OFF);
      sleep_ms(2000);
   }

   return 0;
}
