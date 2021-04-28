#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <regex.h>
#include "myne.h"

void roll3d6(int, char **, char *);
void VS_scores(int, char **, char *);

// *******************************************************************************
void GURPS(int argc, char *argv[]) {
   char printString[80];

   if (argc == 4) {
      VS_scores(argc, argv, printString);

      return;
   }

   roll3d6(argc, argv, printString);
   printf("%s\n", printString);
}

// *******************************************************************************
void VS_scores(int argc, char *argv[], char *aString) {
   char player1[80];
   char player2[80];
   char *my_argv[3];
   int p1, p2;

   p1 = atoi(argv[2]);
   p2 = atoi(argv[3]);

   my_argv[0] = (char *) malloc(strlen("fake1") + 1);
   strcpy(my_argv[0], "fake1");

   my_argv[1] = (char *) malloc(strlen("fake2") + 1);
   strcpy(my_argv[1], "fake2");

   int diff;
   if ((p1 <= 6) & (p2 <= 6)) {
      if (p1 < p2) {
         diff = 10 - p1;
         p1 += diff;
         p2 += diff;
      } else {
         diff = 10 - p2;
         p1 += diff;
         p2 += diff;
      }
   }

   if ((p1 > 20) & (p2 > 20)) {
      if (p1 < p2) {
         diff = p1;
         p1 = 10;
         p2 = p2 * 10 / diff;
      } else {
         diff = p2;
         p2 = 10;
         p1 = p1 * 10 / diff;
      }
   }

   if (((p1 >= 14) & (p2 >= 14))
         & ((p1 <= 20) & (p2 <= 20))) {
      if (p1 < p2) {
         diff = p1 - 10;
         p1 = 10;
         p2 -= diff;
      } else {
         diff = p2 - 10;
         p1 -= diff;
         p2 = 10;
      }
   }

   char buff[80];

   sprintf(buff, "%d", p1);
   my_argv[2] = (char *) malloc(strlen(buff) + 1);
   strcpy(my_argv[2], buff);
   roll3d6(3, my_argv, player1);

   sprintf(buff, "%d", p2);
   strcpy(my_argv[2], buff);
   roll3d6(3, my_argv, player2);


   getGrep(buff, "[+-]?[0-9].*$", player1);
   p1 = atoi(buff);
   printf("p1;%s\n", player1);
   getGrep(buff, "[+-]?[0-9].*$", player2);
   p2 = atoi(buff);
   printf("p2;%s\n", player2);
}

// *******************************************************************************
void roll3d6(int argc, char *argv[], char *aString) {
   char diceStr[] = "3d6";
   int rolled =  getRoll(argc, diceStr);
   int esl = 10;

   char buff[40];
   if (argc >= 3) {
      strcpy(buff, argv[2]);
      esl = atoi(buff);
   }

   // printf ( "rolled:%d\n", rolled );
   if (rolled <= 4) {
      sprintf(aString, "crit-success:%d", esl - rolled);
      return;
   }

   if ((esl - rolled) >= 10) {
      sprintf(aString, "crit-success:%d", esl - rolled);
      return;
   }

   if (rolled == 18) {
      sprintf(aString, "crit-fail:%d", esl - rolled);
      return;
   }

   if ((rolled == 17) & (esl <= 15)) {
      sprintf(aString, "crit-fail:%d", esl - rolled);
      return;
   }

   if (rolled <= esl)
      sprintf(aString, "success:%d", esl - rolled);
   else
      sprintf(aString, "fail:%d", esl - rolled);
}
