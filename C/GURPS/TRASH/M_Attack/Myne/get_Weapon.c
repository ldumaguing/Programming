// #define FUNC_NAME

#include <stdio.h>
#include <stdlib.h>
#include <json-c/json.h>
#include <string.h>

// *******************************************************************************
struct json_object *get_Weapon(struct json_object *P, int isOffhand,
                               int *One_or_Both) {
#ifdef FUNC_NAME
   puts("get_weapon");
#endif

   if (isOffhand) puts("Offhand");

   struct json_object *Handiness;
   json_object_object_get_ex(P, "Handiness", &Handiness);

   struct json_object *Holding;
   json_object_object_get_ex(P, "Holding", &Holding);

   struct json_object *Left_Hand;
   json_object_object_get_ex(Holding, "Left Hand", &Left_Hand);

   struct json_object *Right_Hand;
   json_object_object_get_ex(Holding, "Right Hand", &Right_Hand);

   struct json_object *Both_Hands;
   json_object_object_get_ex(Holding, "Both Hands", &Both_Hands);

   char buff[80];
   strcpy(buff, json_object_get_string(Handiness));

   struct json_object *weapon;

   if (isOffhand) {
      if (strcmp("Right", buff) == 0)
         weapon = Left_Hand;
      if (strcmp("Left", buff) == 0)
         weapon = Right_Hand;
   }
   else {
      if (strcmp("Right", buff) == 0)
         weapon = Right_Hand;
      if (strcmp("Left", buff) == 0)
         weapon = Left_Hand;
   }

   struct json_object *Name;
   json_object_object_get_ex(weapon, "Name", &Name);

   if (Name != NULL) return weapon;

   weapon = Both_Hands;
   *One_or_Both = 1;
   json_object_object_get_ex(weapon, "Name", &Name);
   if (Name != NULL) return weapon;

   return NULL;
}

