#include <regex.h>
#include <stdio.h>
#include <json-c/json.h>
#include <string.h>
#include "myne.h"

// *****************************************************************************
_Bool hasMatch(char *pattern, char *subject) {
   regex_t regex;
   int result;

   regcomp(&regex, pattern, REG_EXTENDED);
   result = regexec(&regex, subject, 0, NULL, 0);

   regfree(&regex);

   return (result == 0);
}

// *****************************************************************************
_Bool isEmptyHanded(struct json_object *Unit) {
   struct json_object *AttackSrc;
   json_object_object_get_ex(Unit, "AttackSrc", &AttackSrc);

   char buff[100];
   strcpy(buff, json_object_get_string(AttackSrc));

   return (strcmp(buff, "PunchKick") == 0);
}




