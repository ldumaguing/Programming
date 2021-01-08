#include <stdio.h>
#include <stdlib.h>
#include "Myne/myne.h"

void define_DamageString(char *);

// *******************************************************************************
int main(int argc, char *argv[]) {
   char DamageString[200];
   define_DamageString(DamageString);

   L_generate_Damage(DamageString);

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

