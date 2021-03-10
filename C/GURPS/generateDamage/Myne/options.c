#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void knockback();

// *******************************************************************************
void options(char *dmgType, char *opts) {
   puts("options");

   if (!((strcmp(dmgType, "cut") == 0) | (strcmp(dmgType, "cr") == 0)))
      return;
   else
      knockback();


   puts(dmgType);
   puts(opts);
}

// *******************************************************************************
void knockback() {

}
