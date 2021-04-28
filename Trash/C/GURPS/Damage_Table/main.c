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

   if (argc == 2) {
      both(argc, argv);
      return 0;
   }

   if (argc == 3) {
      if (strcmp("thrust", argv[2]) == 0) {
         thrust(argc, argv);
      } else {
         swing(argc, argv);
      }
   }


   return 0;
}

// *******************************************************************************
void instructions() {
   puts("Damage_Table   STR");
   puts("                     thrust");
   puts("                     swing");
}
