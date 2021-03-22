#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <regex.h>
#include "myne.h"


void generateDamage(int argc, char *argv[]) {
   int basicDMG = 0;
   char cmd[80];
   FILE *pipeDice;

   char buff1[80];


   // ********** define basic damage.
   if ('r' == argv[1][0]) {
      getGrep(buff1, "[0-9].*", argv[1]);
      basicDMG = atoi(buff1);
   } else {
      strcpy(cmd, "~/bin/dice");

      getGrep(buff1, "^[0-9dx+-]*", argv[1]);
      strcat(cmd, " ");
      strcat(cmd, buff1);

      if ((pipeDice = popen(cmd, "r")) == NULL) {
         perror("popen");
         return;
      }

      fgets(buff1, 80, pipeDice);
      basicDMG = atoi(buff1);
      pclose(pipeDice);
   }

   buff1[0] = 0;


   // ********** define 1/2D
   if (argc >= 4) {
      getGrep(buff1, "1/2D", argv[5]);
      if (strlen(buff1) > 0)
         basicDMG = basicDMG / 2;
   }

   buff1[0] = 0;


   // ***** calc minimum basic damage.
   if (basicDMG < 1) {
      if (strcmp(argv[2], "cr") == 0)
         basicDMG = 0;
      else
         basicDMG = 1;
   }


   // ********** define divisor
   getGrep(buff1, "[0-9]*)", argv[1]);

   if (strlen(buff1) > 0)
      printf("%d(%s %s\n", basicDMG, buff1, argv[2]);
   else
      printf("%d %s\n", basicDMG, argv[2]);
}

// *******************************************************************************
void getGrep(char *kv, char *pattern, char *subject) {
   regex_t regex;
   regmatch_t match;

   regcomp(&regex, pattern, REG_EXTENDED);

   int w = 0;
   int begin, end, len;
   char *word = NULL;
   if (regexec(&regex, subject, 1, &match, 0) == 0) {
      begin = (int) match.rm_so;
      end = (int) match.rm_eo;
      len = end - begin;
      word = malloc(len + 1);

      for (int i = begin; i < end; i++) {
         word[w] = subject[i];
         w++;
      }
      word[w] = 0;
   } else
      return;

   strcpy(kv, word);

   free(word);
   regfree(&regex);
}
