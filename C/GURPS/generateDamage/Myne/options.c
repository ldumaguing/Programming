#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "myne.h"
#include <unistd.h>

void knockback(char *, char *, int, int);
void flexibleArmor(char *, char *, int, int);

// *******************************************************************************
void options(char *dmgType, char *opts, int dmg, int rolled) {
   knockback(opts, dmgType, dmg, rolled);
   flexibleArmor(opts, dmgType, dmg, rolled);
}

// ===============================================================================
void flexibleArmor(char *opts, char *dmgType, int dmg, int rolled) {
   if (dmg > 0) return;


   char buff[80] = "";
   getGrep(buff, "FlexArmor", opts);
   if (strlen(buff) <= 0) return;


   int X;
   if ((strcmp(dmgType, "cut") == 0)
         | (strcmp(dmgType, "imp") == 0)
         | (strcmp(dmgType, "pi-") == 0)
         | (strcmp(dmgType, "pi") == 0)
         | (strcmp(dmgType, "pi+") == 0)
         | (strcmp(dmgType, "pi++") == 0)
      ) {
      X = rolled / 10;
      printf("BluntTraumaDMG:%d\n", X);
   }
   if (strcmp(dmgType, "cr") == 0) {
      X = rolled / 5;
      printf("BluntTraumaDMG:%d\n", X);
   }
}

// ===============================================================================
void knockback(char *opts, char *dmgType, int dmg, int rolled) {
   if (!((strcmp(dmgType, "cut") == 0) | (strcmp(dmgType, "cr") == 0)))
      return;
   if ((strcmp(dmgType, "cut") == 0) & (dmg > 0))
      return;

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
   if (kbyds == 0) return;
   printf("KB:%d\n", kbyds);


   char cmd[80];
   getGrep(buff, "DX:[0-9]*", opts);
   getGrep(buff1, "[0-9].*", buff);
   int DX = atoi(buff1);
   FILE *pipeDice;
   strcpy(cmd, "~/bin/dice GURPS ");
   strcat(cmd, buff1);
   if ((pipeDice = popen(cmd, "r")) == NULL) {
      perror("popen");
      return;
   }

   fgets(buff1, 80, pipeDice);

   if ((strncmp(buff1, "fail", 4) == 0) | (strncmp(buff1, "crit-fail", 6) == 0))
      puts("prone");

   pclose(pipeDice);
}
