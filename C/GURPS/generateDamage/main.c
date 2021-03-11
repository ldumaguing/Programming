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
   puts("     \"           \"       \"         DR*");
   puts("     \"           \"       \"               HardenedLevel*");
   puts("     \"           \"       \"                    \"           options");
   puts("----------------------------------------------------------------------");
   puts("Examples:");
   puts("   generateDamage   3d6+1        p++");
   puts("   generateDamage   '3d6+1(2)'   p++");
   puts("   generateDamage   '3d6+1(2)'   p++   5");
   puts("   generateDamage   '3d6+1(2)'   p++   5   2");
   puts("   generateDamage   r42          p++   5   2");
   puts("   generateDamage   r42          p++   5   2   'ST:10;DX:10;1/2D;...'");
   puts("");
   puts("* - Target's damage resistance.");
   puts("r - Manually rolled.");
   puts("ST:10;DX:10 - Target's stats for Knockback rule.");
   puts("1/2D        - calculate in for a ranged weapon's 1/2D rule.");
   puts("PerfBal     - apply Perfect Balance rule.");
}
