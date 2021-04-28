#include <regex.h>
#include <stdio.h>
#include <json-c/json.h>
#include <string.h>
#include "myne.h"

// *****************************************************************************
_Bool isWeapon(struct json_object *Weapon) {
   struct json_object *Classification;
   json_object_object_get_ex(Weapon, "Class", &Classification);

   char buff[100];
   sprintf(buff, "%s\n", json_object_get_string(Classification));

   return (isMatch("Weapon", buff));
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

// *****************************************************************************
_Bool isEmptyHanded(struct json_object *Unit) {
   struct json_object *Holding;
   json_object_object_get_ex(Unit, "Holding", &Holding);

   struct json_object *Right_Hand;
   json_object_object_get_ex(Holding, "Right Hand", &Right_Hand);
   struct json_object *Left_Hand;
   json_object_object_get_ex(Holding, "Left Hand", &Left_Hand);
   struct json_object *Both_Hands;
   json_object_object_get_ex(Holding, "Both Hands", &Both_Hands);

   _Bool r_hnd = json_object_object_length(Right_Hand) == 0;
   _Bool l_hnd = json_object_object_length(Left_Hand) == 0;
   _Bool b_hnd = json_object_object_length(Both_Hands) == 0;

   return (r_hnd && l_hnd && b_hnd);
}


