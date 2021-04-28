#include <regex.h>
#include <stdio.h>
#include <stdlib.h>

int main(void) {
   regex_t preg;

   char *string = "I'm a link to somewhere";
   char *pattern = ".*\\(link\\).*";

   size_t     nmatch = 2;
   regmatch_t pmatch[2];


   regcomp(&preg, pattern, 0);
   regexec(&preg, string, nmatch, pmatch, 0);

   printf("a matched substring \"%.*s\" is found at position %d to %d.\n",
          pmatch[1].rm_eo - pmatch[1].rm_so,
          &string[pmatch[1].rm_so],
          pmatch[1].rm_so,
          pmatch[1].rm_eo - 1);

   printf("%d\n", pmatch[1].rm_eo - pmatch[1].rm_so);
   printf("%s\n", &string[pmatch[1].rm_so]);
   printf("%.*s\n", 4, &string[pmatch[1].rm_so]);
   printf("%d\n", pmatch[1].rm_so);
   printf("%d\n", pmatch[1].rm_eo - 1);

   regfree(&preg);

   return 0;
}
