#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "Myne/myne.h"

void instructions();

int main(int argc, char *argv[]) {
   if (argc < 3) {
      instructions();
      return 0;
   }

   generateDamage_(argc, argv);

   return 0;
}

// *******************************************************************************
void instructions() {
   puts("generateDamage_   Dice   DamageType");
   puts("     \"           \"       \"         flags");
   puts("----------------------------------------------------------------------");
   puts("Examples:");
   puts("   generateDamage_   3d6+1        pi++");
   puts("   generateDamage_   '3d6+1(2)'   pi++");
   puts("   generateDamage_   r42          pi++");
   puts("   generateDamage_   r42          pi++   1/2D");
   puts("");
   puts("r - Manually rolled.");
   puts("");
   puts(" flags");
   puts("=======");
   puts("1/2D        - apply a ranged weapon's 1/2D rule.");
}