#include <stdio.h>
#include <stdlib.h>


int main(int argc, char *argv[]) {
   for (int i = 10; i < 100; i++) {
      char X[i];
      printf("%lu\n", sizeof(X));
      printf("%p\n", &X);
   }
   return 0;
}




