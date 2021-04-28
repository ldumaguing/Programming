// #define FUNC_NAME

#include <stdio.h>
#include <stdlib.h>
#include <json-c/json.h>
#include <string.h>
#include "myne.h"

// *******************************************************************************
void using_One_Hand(struct json_object *P, int *ES, char *Dmg,
                    struct json_object *weapon, char *stroke, int isOffhand) {
#ifdef FUNC_NAME
   puts("> using_One_Hand");
   puts(stroke);
#endif

   if (isOffhand) *ES += 4;

   struct json_object *WepClass;
   json_object_object_get_ex(weapon, "Class", &WepClass);
   char buff[80];
   strcpy(buff, json_object_get_string(WepClass));
   mod_Skill(P, ES, Dmg, weapon, stroke, isOffhand, buff);
   mod_ST(P, ES, Dmg, weapon, stroke, isOffhand);
}
