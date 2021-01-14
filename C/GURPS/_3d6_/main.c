#include <stdio.h>
#include <stdlib.h>
#include <time.h>

void define_AnyString(char *);
int d6();
int roll_3d6();

int main(int argc, char *argv[]) {
   char AnyString[200];
   define_AnyString(AnyString);

   int r = roll_3d6();

   char buff[256];
   sprintf(buff, "%sRolled:%d;", AnyString, r);
   puts(buff);

   return 0;
}

// *******************************************************************************
int roll_3d6() {
   srand((unsigned)time(NULL));

   int X = 0;
   srand((unsigned)time(NULL));
   for (int i = 0; i < 3; i++) {
      X += d6();
   }

   return X;
}

// *******************************************************************************
int d6() {
   int X = (rand() % 6) + 1;
   return X;
}

// *******************************************************************************
void define_AnyString(char *AnyStr) {
   int counter = 0;
   int c;
   c = getchar();
   while (c != EOF) {
      AnyStr[counter] = c;
      c = getchar();
      counter++;
   }
   AnyStr[--counter] = '\0';
}
