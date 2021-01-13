#include <json-c/json.h>
#include <stdio.h>
#include <math.h>
#include <string.h>
#include <regex.h>
#include "myne.h"

void arming(struct json_object *, struct json_object *, char *);
void arming_2nd(struct json_object *, struct json_object *);
char *getHandiness(struct json_object *);

// *****************************************************************************
void armCharacter(struct json_object *Weapon, struct json_object *Unit) {
   if (!isWeapon(Weapon)) {
      printf("Not a weapon.\n");
      exit(0);
   }

   char *handiness = getHandiness(Unit);

   if (isEmptyHanded(Unit)) {
      arming(Weapon, Unit, handiness);
      free(handiness);
      return;
   }
   else {
      arming_2nd(Weapon, Unit);
      free(handiness);
      return;
   }
}

// *****************************************************************************
void arming_2nd(struct json_object *Weapon, struct json_object *Unit) {
   struct json_object *Holding;
   json_object_object_get_ex(Unit, "Holding", &Holding);

   struct json_object *AttackSrc;

   json_object_object_get_ex(Unit, "AttackSrc", &AttackSrc);
   char buff[20];
   sprintf(buff, "%s", json_object_get_string(AttackSrc));

   if (isMatch("Both", buff)) {
      printf("No room.\n");
      return;
   }
   if (isMatch("LeftRight", buff)) {
      printf("No room.\n");
      return;
   }

   if (isMatch("Right", buff)) {
      json_object_object_add(Holding, "Left Hand", Weapon);
      json_object *X = json_object_new_string("LeftRight");
      json_object_object_add(Unit, "AttackSrc", X);
      return;
   }
   else {
      json_object_object_add(Holding, "Right Hand", Weapon);
      json_object *X = json_object_new_string("LeftRight");
      json_object_object_add(Unit, "AttackSrc", X);
      return;
   }
}

// *****************************************************************************
void arming(struct json_object *Weapon, struct json_object *Unit,
            char *handiness) {
   struct json_object *Holding;
   json_object_object_get_ex(Unit, "Holding", &Holding);

   if (isMatch("Right", handiness)) {
      json_object_object_add(Holding, "Right Hand", Weapon);
      json_object *X = json_object_new_string("Right");
      json_object_object_add(Unit, "AttackSrc", X);
      return;
   }
   if (isMatch("Left", handiness)) {
      json_object_object_add(Holding, "Left Hand", Weapon);
      json_object *X = json_object_new_string("Left");
      json_object_object_add(Unit, "AttackSrc", X);
      return;
   }
}

// *****************************************************************************
char *getHandiness(struct json_object *Unit) {
   struct json_object *Holding;
   json_object_object_get_ex(Unit, "Holding", &Holding);

   struct json_object *Handiness;
   json_object_object_get_ex(Unit, "Handiness", &Handiness);

   char buff[20];
   sprintf(buff, "%s", json_object_get_string(Handiness));

   int X = strlen(buff);
   char *handiness = NULL;
   handiness = malloc(X + 1);

   int i = 0;
   for (i = 0; i < X; i++) {
      handiness[i] = buff[i];
   }
   handiness[i] = '\0';

   return handiness;
}
