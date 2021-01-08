// #define FUNC_NAME

#include <regex.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "UtilityStuffs.h"
#include "myne.h"

void define_StrokeDmg(char *, char *, char *);

// *******************************************************************************
void getGrep(char *kv, char *pattern, char *subject) {
   regex_t regex;
   regmatch_t match;

   regcomp(&regex, pattern, REG_EXTENDED);

   int w = 0;
   int begin, end, len;
   char *word = NULL;
   if (regexec(&regex, subject, 1, &match, 0) == 0) {
      begin = (int)match.rm_so;
      end = (int)match.rm_eo;
      len = end - begin;
      word = malloc(len + 1);

      for (int i = begin; i < end; i++) {
         word[w] = subject[i];
         w++;
      }
      word[w] = 0;
   }
   else
      return;

   strcpy(kv, word);

   free(word);
   regfree(&regex);
}

// -------------------------------------------------------------------------------
void define_StrokeDmg(char *ReachDmg, char *Dmg, char *stk) {
#ifdef FUNC_NAME
   puts("define_StrokeDmg");
#endif

   char subject[80];
   strcpy(subject, Dmg);

   char SwingPattern[] = "[0-9d+-]*$";
   char ThrustPattern[] = "^[0-9d+-]*";

   regex_t regex;
   regmatch_t match;

   if (strcmp("Swing", stk) == 0)
      regcomp(&regex, SwingPattern, REG_EXTENDED);
   else
      regcomp(&regex, ThrustPattern, REG_EXTENDED);

   int w = 0;
   int begin, end, len;
   char *word = NULL;
   if (regexec(&regex, subject, 1, &match, 0) == 0) {
      begin = (int)match.rm_so;
      end = (int)match.rm_eo;
      len = end - begin;
      word = malloc(len + 1);

      for (int i = begin; i < end; i++) {
         word[w] = subject[i];
         w++;
      }
      word[w] = 0;
   }
   else
      return;

   strcpy(ReachDmg, word);

   free(word);
   regfree(&regex);
}

// *******************************************************************************
void define_Damage(char *Dmg, int st) {
#ifdef FUNC_NAME
   puts("define_Damage");
#endif

   char damage[][20] = {"-",
                        "1d-6/1d-5a", "1d-6/1d-5b", "1d-5/1d-4c", "1d-5/1d-4d",
                        "1d-4/1d-3",  "1d-4/1d-3", "1d-3/1d-2",   "1d-3/1d-2",
                        "1d-2/1d-1",  "1d-2/1d",   "1d-1/1d+1",   "1d-1/1d+2",
                        "1d/2d-1",    "1d/2d",     "1d+1/2d+1",   "1d+1/2d+2",
                        "1d+2/3d-1",  "1d+2/3d",   "2d-1/3d+1",   "2d-1/3d+2",
                        "2d/4d-1",    "2d/4d",     "2d+1/4d+1",   "2d+1/4d+2",
                        "2d+2/5d-1",  "2d+2/5d",   "3d-1/5d+1",   "3d-1/5d+1",
                        "3d/5d+2",    "3d/5d+2",   "3d+1/6d-1",   "3d+1/6d-1",
                        "3d+2/6d",    "3d+2/6d",   "4d-1/6d+1",   "4d-1/6d+1",
                        "4d/6d+2",    "4d/6d+2",   "4d+1/7d-1",   "4d+1/7d-1",
                        "5d/7d+1",    "5d+2/8d-1", "6d/8d+1",     "7d-1/9d",
                        "7d+1/9d+2",  "8d/10d",    "8d+2/10d+2",  "9d/11d",
                        "9d+2/11d+2", "10d/12d",   "10d+2/12d+2", "11d/13d"
                       };

   if ((st >= 1) & (st <= 40)) {
      strcpy(Dmg, damage[st]);
      return;
   }
   if ((st > 40) & (st <= 100)) {
      strcpy(Dmg, damage[((st - 40) / 5) + 40]);
      return;
   }

   char buff[80];
   sprintf(buff, "%d%s%d%s", (((st - 100) / 10) + 11), "d/",
           (((st - 100) / 10) + 13), "d");
   strcpy(Dmg, buff);
}

// *****************************************************************************
int getFirstIntVal(char *subject) {
#ifdef FUNC_NAME
   puts("getFirstIntVal");
#endif

   char pattern[] = "^[0-9C]*";

   regex_t regex;
   regmatch_t match;

   regcomp(&regex, pattern, REG_EXTENDED);

   int w = 0;
   int begin, end, len;
   char *word = NULL;
   if (regexec(&regex, subject, 1, &match, 0) == 0) {
      begin = (int)match.rm_so;
      end = (int)match.rm_eo;
      len = end - begin;
      word = malloc(len + 1);

      for (int i = begin; i < end; i++) {
         word[w] = subject[i];
         w++;
      }
      word[w] = 0;
   }
   else
      return 0;

   if (strcmp(word, "C") == 0) return 0;

   int X = atoi(word);

   free(word);
   regfree(&regex);

   return X;
}

// *****************************************************************************
int getLastIntVal(char *subject) {
#ifdef FUNC_NAME
   puts("getLastIntVal");
#endif

   char pattern[] = "[0-9C]*$";

   regex_t regex;
   regmatch_t match;

   regcomp(&regex, pattern, REG_EXTENDED);

   int w = 0;
   int begin, end, len;
   char *word = NULL;
   if (regexec(&regex, subject, 1, &match, 0) == 0) {
      begin = (int)match.rm_so;
      end = (int)match.rm_eo;
      len = end - begin;
      word = malloc(len + 1);

      for (int i = begin; i < end; i++) {
         word[w] = subject[i];
         w++;
      }
      word[w] = 0;
   }
   else
      return 0;

   if (strcmp(word, "C") == 0) return 0;

   int X = atoi(word);

   free(word);
   regfree(&regex);

   return X;
}

// *****************************************************************************
_Bool isMatch(char *pattern, char *subject) {
#ifdef FUNC_NAME
   puts("isMatch");
#endif

   regex_t regex;
   int result;

   regcomp(&regex, pattern, REG_EXTENDED);
   result = regexec(&regex, subject, 0, NULL, 0);

   regfree(&regex);

   return (result == 0);
}




