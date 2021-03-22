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

   generateDamage(argc, argv);

   return 0;
}

// *******************************************************************************
void instructions() {
   puts("generateDamage   Dice   DamageType");
   puts("     \"           \"       \"         flags");
   puts("----------------------------------------------------------------------");
   puts("Examples:");
   puts("   generateDamage   3d6+1        pi++");
   puts("   generateDamage   '3d6+1(2)'   pi++");
   puts("   generateDamage   r42          pi++");
   puts("");
   puts("r - Manually rolled.");
   puts("");
   puts(" flags");
   puts("=======");
   puts("1/2D        - apply a ranged weapon's 1/2D rule.");
}
