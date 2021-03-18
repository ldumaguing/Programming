#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "Myne/myne.h"

void instructions();

int main(int argc, char *argv[]) {
   if (argc == 1) {
      instructions();
      return 0;
   }

   if (strcmp(argv[1], "getpoints") == 0) {
      getPoints(argc, argv);
      return 0;
   }

   if (strcmp(argv[1], "hdist") == 0) {
      hdist(argc, argv);
      return 0;
   }

   if (strcmp(argv[1], "cdist") == 0) {
      cdist(argc, argv);
      return 0;
   }

   if (strcmp(argv[1], "path") == 0) {
      path(argc, argv);
      return 0;
   }

   if (strcmp(argv[1], "deg") == 0) {
      deg(argc, argv);
      return 0;
   }

   if (strcmp(argv[1], "other") == 0) {
      other(argc, argv);
      return 0;
   }

   if (strcmp(argv[1], "edgeID") == 0) {   // to do
      edgeID(argc, argv);
      return 0;
   }

   instructions();
   return 0;
}

// *******************************************************************************
void instructions() {
   puts("hexagonRow   getpoints   scale");
   puts("             hdist       FROM   TO");
   puts("             cdist       FROM   TO");
   puts("             path        FROM   TO");
   puts("             deg         FROM   TO");
   puts("             other       FROM   Direction");
   puts("             edgeID      FROM   Direction");
   puts("-----------------------------------------------");
   puts("FROM:       0 to 9999");
   puts("TO:         0 to 9999");
   puts("Direction:  A, B, C, D, E, or F");
}
