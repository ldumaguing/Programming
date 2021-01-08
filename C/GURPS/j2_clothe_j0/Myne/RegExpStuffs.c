#include <regex.h>
#include <stdio.h>
#include <json-c/json.h>
#include <string.h>
#include "myne.h"

// *****************************************************************************
_Bool isWearable(struct json_object *Wearable) {
   struct json_object *Classification;
   json_object_object_get_ex(Wearable, "Class", &Classification);

   char buff[100];
   sprintf(buff, "%s\n", json_object_get_string(Classification));

   return (isMatch("Armor", buff));
}

// *****************************************************************************
_Bool isMatch(char *pattern, char *subject) {
   regex_t regex;
   int result;

   regcomp(&regex, pattern, REG_EXTENDED);
   result = regexec(&regex, subject, 0, NULL, 0);

   regfree(&regex);

   return (result == 0);
}


