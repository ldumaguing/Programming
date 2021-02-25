#include <stdio.h>
#include <stdlib.h>

void instructions();

int main(int argc, char *argv[]) {
   if (argc < 3) {
      instructions();
      return 0;
   }

   float P1 = atof(argv[1]);
   float P2 = atof(argv[2]);
   float X;

   if ((P1 <= 6) & (P2 <= 6)) {
      if (P1 > P2) {
         X = 10 - P2;
         P1 += X;
         P2 = 10;
      }
      else {
         X = 10 - P1;
         P2 += X;
         P1 = 10;
      }
      printf("Player1's Score: %d\n", (int)P1);
      printf("Player2's Score: %d\n", (int)P2);
      return 0;
   }

   if ((P1 > 20) & (P2 > 20)) {
      if (P1 > P2) {
         X = P2;
         P2 = 10;
         P1 = P1 * (10 / X);
      }
      else {
         X = P1;
         P1 = 10;
         P2 = P2 * (10 / X);
      }
      printf("Player1's Score: %d\n", (int)P1);
      printf("Player2's Score: %d\n", (int)P2);
      return 0;
   }

   if ((P1 >= 14) & (P2 >= 14)) {
      if (P1 > P2) {
         X = P2 - 10;
         P2 = 10;
         P1 -= X;
      }
      else {
         X = P1 - 10;
         P1 = 10;
         P2 -= X;
      }
      printf("Player1's Score: %d\n", (int)P1);
      printf("Player2's Score: %d\n", (int)P2);
      return 0;
   }

   printf("Player1's Score: %d\n", (int)P1);
   printf("Player2's Score: %d\n", (int)P2);

   return 0;
}

// ********************************************************************************
void instructions() {
   printf("calc_extremescores   \"Player1's Score\"   \"Player2's Score\"\n");
}
