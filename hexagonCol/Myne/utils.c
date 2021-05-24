#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <regex.h>
#include "myne.h"

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
