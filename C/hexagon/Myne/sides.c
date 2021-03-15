#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <regex.h>
#include "myne.h"

void getPoints(int argc, char *argv[]) {
   double X = 0.288675134594;
   double scale = 1.0;
   double movX = 0.0;
   double movY = 0.0;
   char *ptr;

   scale = strtod(argv[2], &ptr);
   movX = strtod(argv[3], &ptr);
   movY = strtod(argv[4], &ptr);

   printf("%.12f\n%.12f\n", (X * scale)       + movX, (1.0 * scale) + movY);
   printf("%.12f\n%.12f\n", (0.0 * scale)     + movX, (0.5 * scale) + movY);
   printf("%.12f\n%.12f\n", (X * scale)       + movX, (0.0 * scale) + movY);
   printf("%.12f\n%.12f\n", (3.0 * X * scale) + movX, (0.0 * scale) + movY);
   printf("%.12f\n%.12f\n", (4.0 * X * scale) + movX, (0.5 * scale) + movY);
   printf("%.12f\n%.12f\n", (3.0 * X * scale) + movX, (1.0 * scale) + movY);
   printf("%.12f\n%.12f\n", (6.0 * X * scale) + movX, (0.5 * scale) + movY);
}

// *******************************************************************************
void edgeID(int argc, char *argv[]) {
   regex_t regex;
   int return_val;

   return_val = regcomp(&regex, "[A-F]", 0);
   return_val = regexec(&regex, argv[3], 0, NULL, 0);
   if (return_val > 0) return;

   if (argc != 4) return;

   char from[] = "0000";

   int len = strlen(argv[2]);
   int count = len;
   for (int i = 0; i < len; i++) {
      from[3 - i] = argv[2][--count];
   }

   int L1[2] = {0, 0};
   L1[0] = getX(from);
   L1[1] = getY(from);

   if ((L1[0] % 2) == 0) {
      if (strcmp(argv[3], "D") == 0) {
         L1[1]++;
         printf("%.2d%.2d%s\n", L1[0], L1[1], "A");
      } else {
         printf("%.2d%.2d%s\n", L1[0], L1[1], argv[3]);
      }
   } else {
      if (strcmp(argv[3], "A") == 0) {
         L1[0]--;
         printf("%.2d%.2d%s\n", L1[0], L1[1], "D");
      }
      if (strcmp(argv[3], "B") == 0) {
         L1[0]++;
         printf("%.2d%.2d%s\n", L1[0], L1[1], "E");
      }
      if (strcmp(argv[3], "C") == 0) {
         L1[0]++;
         L1[1]++;
         printf("%.2d%.2d%s\n", L1[0], L1[1], "F");
      }
      if (strcmp(argv[3], "D") == 0) {
         L1[0]--;
         L1[1]++;
         printf("%.2d%.2d%s\n", L1[0], L1[1], "D");
      }
      if (strcmp(argv[3], "E") == 0) {
         L1[0]--;
         L1[1]++;
         printf("%.2d%.2d%s\n", L1[0], L1[1], "B");
      }
      if (strcmp(argv[3], "F") == 0) {
         L1[0]--;
         printf("%.2d%.2d%s\n", L1[0], L1[1], "C");
      }
   }
}











