#include <stdio.h>
#include <stdlib.h>
#include "Myne/myne.h"

void define_DamageString(char *);

// *******************************************************************************
int main(int argc, char *argv[]) {
   char DamageString[200];
   define_DamageString(DamageString);

   if (argc == 2) {
      int X = atoi(argv[1]);
      generateDamage2(DamageString, X);  // manual roll
   }
   else
      generateDamage(DamageString);

   return 0;
}

// *******************************************************************************
void define_DamageString(char *DmgStr) {
   int counter = 0;
   int c;
   c = getchar();
   while (c != EOF) {
      DmgStr[counter] = c;
      c = getchar();
      counter++;
   }
   DmgStr[--counter] = '\0';
}

