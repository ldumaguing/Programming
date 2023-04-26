#include "pico/stdlib.h"
#include "pico/multicore.h"

void main2() {
   while(1) {
      sleep_ms(500);
      printf("2\n");
   }
}

int main() {
   stdio_usb_init();

   multicore_launch_core1(main2);

   while(true) {
      printf("1\n");
      sleep_ms(1000);
   }

   return 0;
}

// *********************************************************************
// To get the printout, execute command:
// minicom -D /dev/ttyACM0 -b 115200

