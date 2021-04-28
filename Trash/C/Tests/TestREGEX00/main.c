#include <stdio.h>
#include <string.h>
#include <regex.h>

int main() {
   char *source = "___ abc123def ___ ghi456 ___";
   char *regexString = "[a-z]*([0-9]+)([a-z]*)";
   size_t maxMatches = 20;
   size_t maxGroups = 13;

   regex_t regexCompiled;
   regmatch_t groupArray[maxGroups];
   char *cursor;

   if (regcomp(&regexCompiled, regexString, REG_EXTENDED)) {
      printf("Could not compile regular expression.\n");
      return 1;
   };

   cursor = source;
   for (int m = 0; m < maxMatches; m ++) {
      // regexec(&regex,         subject, 0, NULL, 0);
      if (regexec(&regexCompiled, cursor, maxGroups, groupArray, 0))
         break;  // No more matches

      printf("...%s\n", &source[groupArray[m].rm_so]);



      //unsigned int g = 0;
      unsigned int offset = 0;
      for (int g = 0; g < maxGroups; g++) {
         printf("%d\n", g);
         if (groupArray[g].rm_so == (size_t) -1)
            break;  // No more groups


         if (g == 0)
            offset = groupArray[g].rm_eo;

         char cursorCopy[strlen(cursor) + 1];
         printf("%lu\n", sizeof(cursorCopy));
         printf("%p\n", &cursorCopy);
         strcpy(cursorCopy, cursor);
         cursorCopy[groupArray[g].rm_eo] = 0;
         printf("Match %u, Group %u: [%2u-%2u]: %s\n",
                m,
                g,
                groupArray[g].rm_so,
                groupArray[g].rm_eo,
                cursorCopy + groupArray[g].rm_so);
      }
      cursor += offset;
   }

   regfree(&regexCompiled);

   return 0;
}

