#include <regex.h>
#include <stdio.h>
#include <json-c/json.h>
#include <string.h>
#include "myne.h"

// *****************************************************************************
_Bool isMatch(char *pattern, char *subject) {
   regex_t regex;
   int result;

   regcomp(&regex, pattern, REG_EXTENDED);
   result = regexec(&regex, subject, 0, NULL, 0);

   regfree(&regex);

   return (result == 0);
}
