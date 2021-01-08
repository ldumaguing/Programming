#include <regex.h>
#include <stdio.h>
#include <json-c/json.h>
#include <string.h>
#include "myne.h"

// *****************************************************************************
int get_CharCount(char *aString){
    int count = 0;
    char *c;
    c = aString;
    while(*c != '\0'){
        c++;
        count++;
    }
    
    return count;
}
// *****************************************************************************
char *get_Section(char *string, char *patrn) {
   int i, w = 0, len, begin, end;
   char *word = NULL;
   regex_t rgT;
   regmatch_t match;

   regcomp(&rgT, patrn, REG_EXTENDED);

   if ((regexec(&rgT, string, 1, &match, 0)) == 0) {
      begin = (int)match.rm_so;
      end = (int)match.rm_eo;
      len = end - begin;
      word = malloc(len + 1);
      for (i = begin; i < end; i++) {
         word[w] = string[i];
         w++;
      }
      word[w] = 0;
   }

   regfree(&rgT);

   return word;
}
