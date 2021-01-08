// #define FUNC_NAME

#include <stdio.h>
#include <stdlib.h>
#include <json-c/json.h>
#include <string.h>
#include "myne.h"
#include "UtilityStuffs.h"

_Bool hasStroke(struct json_object *, char *, char *);

// *******************************************************************************
void mod_ST(struct json_object *P, int *ES, char *Dmg,
            struct json_object *weapon, char *stroke, int isOffhand) {
#ifdef FUNC_NAME
   puts("> mod_ST");
   puts(stroke);
#endif

   struct json_object *WeaponClass;
   json_object_object_get_ex(weapon, "Class", &WeaponClass);

   char Stroke[80];

   if (strcmp("Weapon (Reach)", json_object_get_string(WeaponClass)) == 0) {
      if (hasStroke(weapon, stroke, Stroke))
         strcpy(Stroke, stroke);
      // else Stroke gets defined by the function, hasStroke.
      if (is_OneHand_BothHands(P, weapon, Stroke))
         do_Strike(P, weapon, Stroke, ES, Dmg);
      else
         do_Bash(P, weapon, Stroke, ES, Dmg);
   }
   else
      do_Shoot(P, weapon, Stroke, ES, Dmg);
}

// *******************************************************************************
_Bool hasStroke(struct json_object *weapon, char *stroke, char *Stroke) {
#ifdef FUNC_NAME
   puts("hasStroke");
#endif

   if (strcmp("blank", stroke) == 0) {
      struct json_object *Usage;
      json_object_object_get_ex(weapon, "Usage", &Usage);
      json_object *jval;
      jval = json_object_array_get_idx(Usage, 0);  // getFirstWeaponStroke
      strcpy(Stroke, json_object_get_string(jval));

      return 0;
   }

   return 1;
}







