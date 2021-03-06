#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/time.h>
#include "Myne/myne.h"

void instructions();

int main(int argc, char *argv[]) {
   if (argc == 1) {
      instructions();
      return 0;
   }

   struct timeval start;
   gettimeofday(&start, NULL);
   long micros = start.tv_usec;
   srand(micros);

   if (strcmp(argv[1], "GURPS") == 0) {
      GURPS(argc, argv);
      return 0;
   }

   if (strlen(argv[1]) > 0) {
      rollDice(argc, argv);
   }

   return 0;
}

// *******************************************************************************
void instructions() {
   puts("dice   DiceString");
   puts("       GURPS   ESL");
   puts("               ESL1   ESL2");
   puts("---------------------------------------------------");
   puts("DiceString:   e.g. d6, d8+1, 3d6, 3d6x2, d100, etc.");
   puts("ESL:          Effective Skill Level");
   puts("ESLx:         Effective Skill Level of player x");
}
