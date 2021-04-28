#include <stdio.h>
#include "depend1.h"
#include "depend2.h"

int main() {
   printf("yo\n");
   depend1();
   depend2();

   return 0;
}

