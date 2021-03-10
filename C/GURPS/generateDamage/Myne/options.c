#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "myne.h"

void knockback(char *, char *, int, int);

// *******************************************************************************
void options(char *dmgType, char *opts, int dmg, int rolled) {
   puts("options");
   printf("rolled:%d\n", rolled);

   if (!((strcmp(dmgType, "cut") == 0) | (strcmp(dmgType, "cr") == 0)))
      return;
   else
      knockback(opts, dmgType, dmg, rolled);
}

// ===============================================================================
void knockback(char *opts, char *dmgType, int dmg, int rolled) {
   if ((strcmp(dmgType, "cut") == 0) & (dmg > 0)) return;
   puts("knockback");

   char buff[80];
   char buff1[80];
   getGrep(buff, "ST:[0-9]*", opts);
   getGrep(buff1, "[0-9].*", buff);
   int X = atoi(buff1);
   X = X - 2;
}
