#include <stdio.h>
#include <stdlib.h>
#include <math.h>

int roundNum(double);

int main(int argc, char *argv[]) {
   double d = 1.2222;
   int X = round(d * 1.5);
   printf("x%d\n", X);

   double fish = pow(d, 2.1);
   
   printf("r%f\n", round(fish));
   
   printf("r%d\n", roundNum(1.3555555555));
   printf("r%d\n", roundNum(1.55555555));
   return 0;
}

int roundNum(double f) {
   int X = (int)f;
   double Y = f - X;

   if (Y < .5)
      return X;

   return X + 1;
}
