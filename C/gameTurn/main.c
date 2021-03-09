#include <stdio.h>
#include <stdlib.h>

void instructions();

int main(int argc, char *argv[]) {
   if (argc == 1) {
      instructions();
      return 0;
   }

   return 0;
}

// *******************************************************************************
void instructions() {
    puts("gameTurn   init");
    puts("           current");
    puts("           increment");
}
