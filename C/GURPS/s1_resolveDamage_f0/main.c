#include <stdio.h>
#include <stdlib.h>
#include "Myne/myne.h"
#include "Myne/UtilityStuffs.h"

void define_TheDamage(char *);

// *******************************************************************************
int main(int argc, char *argv[]) {
   char TheDamage[200];
   define_TheDamage(TheDamage);

   if (isMatch("Miss", TheDamage)) return 0;
   if (isMatch("Fumble", TheDamage)) return 0;

   L_resolve_Damage(TheDamage);

   return 0;
}

// *******************************************************************************
void define_TheDamage(char *TheDmg) {
   int counter = 0;
   int c;
   c = getchar();
   while (c != EOF) {
      TheDmg[counter] = c;
      c = getchar();
      counter++;
   }
   TheDmg[--counter] = '\0';
}

