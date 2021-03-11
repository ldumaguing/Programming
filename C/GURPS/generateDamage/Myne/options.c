#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "myne.h"
#include <unistd.h>

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
   int ST = atoi(buff1);
   int X = ST - 2;



   int kbyds = 0;
   if (ST > 3)
      kbyds = rolled / X;
   else
      kbyds = rolled;
   printf("%dyds\n", kbyds);

   char cmd[80];
   getGrep(buff, "DX:[0-9]*", opts);
   getGrep(buff1, "[0-9].*", buff);
   int DX = atoi(buff1);
   FILE *pipeDice;
   strcpy(cmd, "~/bin/dice 3d6");
   if ((pipeDice = popen(cmd, "r")) == NULL) {
      perror("popen");
      return;
   }
   puts("*********");
   fgets(buff1, 80, pipeDice);
   puts(buff1);
   puts("*********");

   pclose(pipeDice);











}
