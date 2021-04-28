// #define FUNC_NAME

#include <stdio.h>
#include <stdlib.h>
#include <json-c/json.h>
#include <string.h>
#include "myne.h"

struct json_object *get_Reach_Skills(struct json_object *, struct json_object *);

// *******************************************************************************
struct json_object *get_Skills(struct json_object *P, struct json_object *W) {
#ifdef FUNC_NAME
   puts("get_DamageStats");
#endif

   struct json_object *WeaponClass;
   json_object_object_get_ex(W, "Class", &WeaponClass);

   if (strcmp("Weapon (Reach)", json_object_get_string(WeaponClass)) == 0)
      return get_Reach_Skills(P, W);
   else
      return W;
}

// *******************************************************************************
struct json_object *get_Reach_Skills(struct json_object *P,
                                     struct json_object *W) {
#ifdef FUNC_NAME
   puts("get_Reach_Skills");
#endif

   struct json_object *AttackSrc;     // Left, Right, Both
   json_object_object_get_ex(P, "AttackSrc", &AttackSrc);


   struct json_object *X;
   if ((strcmp("Left", json_object_get_string(AttackSrc)) == 0) |
         (strcmp("Right", json_object_get_string(AttackSrc)) == 0)) {
      json_object_object_get_ex(W, "One Hand", &X);
      if (X == NULL)
         json_object_object_get_ex(W, "Both Hands", &X);
   }
   else {
      json_object_object_get_ex(W, "Both Hands", &X);
      if (X == NULL)
         json_object_object_get_ex(W, "One Hand", &X);
   }


   return X;
}



