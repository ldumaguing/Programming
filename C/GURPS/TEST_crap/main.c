#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <string.h>
#include <regex.h>

void getGrep(char *, char *, char *);
char OpineRoll(int, int);

// *******************************************************************************
int main(int argc, char *argv[]) {
   int ES;
   int rolled;
   int X = scanf("%d %d", &ES, &rolled);
   printf("ES: %d   rolled: %d\n", ES, rolled);

   switch (OpineRoll(ES, rolled)) {
      case 'h':
         puts("Hit");
         break;
      case 'm':
         puts("Miss");
         break;
      case 'c':
         puts("crit");
         break;
      default:
         puts("fumble");
   }

   return 0;
}

// *******************************************************************************
char OpineRoll(int ES, int rolled) {
   if (rolled < 3) rolled = 3;
   if (rolled > 18) rolled = 18;

   if (rolled <= 4) return 'c';     // crit
   if (rolled == 18) return 'f';    // fumble

   if ((ES - rolled) >= 10) return 'c';

   if ((rolled - ES) >= 10) return 'f';
   if ((rolled == 17) & (ES <= 15)) return 'f';

   if (ES >= rolled) return 'h';

   return 'm';
}
