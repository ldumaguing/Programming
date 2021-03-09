#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "Myne/myne.h"

void instructions();

int main(int argc, char *argv[]) {
   if (argc == 1) {
      instructions();
      return 0;
   }

   if (strcmp("init", argv[1]) == 0) init();
   
   return 0;
}

// *******************************************************************************
void instructions() {
    puts("gameTurn   init");
    puts("           current");
    puts("           increment");
}
