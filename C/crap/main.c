#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void moveA(int *);
void moveB(int *);
void moveC(int *);
void moveD(int *);
void moveE(int *);
void moveF(int *);

// *******************************************************************************
int main(int argc, char *argv[]) {
   int L[] = {0, 0};
   L[0] = atoi(argv[1]);
   L[1] = atoi(argv[2]);

   char X = atoi(argv[3]);

   switch (X) {
      case 0:
         moveA(L);
         break;
      case 1:
         moveB(L);
         break;
      case 2:
         moveC(L);
         break;
      case 3:
         moveD(L);
         break;
      case 4:
         moveE(L);
         break;
      default:
         moveF(L);
   }

   printf("%d,%d\n", L[0], L[1]);

   return 0;
}

// *******************************************************************************
void moveA(int *L) {
   L[0]++;
}
void moveB(int *L) {
   if ((L[1] % 2) != 0)
      L[0]++;
   L[1]++;
}
void moveC(int *L) {
   if ((L[1] % 2) == 0)
      L[0]--;
   L[1]++;
}
void moveD(int *L) {
   L[0]--;
}
void moveE(int *L) {
   if ((L[1] % 2) == 0)
      L[0]--;
   L[1]--;
}
void moveF(int *L) {
   if ((L[1] % 2) != 0)
      L[0]++;
   L[1]--;
}
