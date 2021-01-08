// #define FUNC_NAME

#include <stdio.h>
#include <stdlib.h>
#include <json-c/json.h>
#include <string.h>
#include "myne.h"
#include "UtilityStuffs.h"

// *******************************************************************************
void do_Bash(struct json_object *p, struct json_object *w, char *stk, int *ES,
             char *dmg) {
#ifdef FUNC_NAME
   puts("> do_Bash");
   puts(stk);
#endif


   char handling[80];
   strcpy(handling, "Both");
   struct json_object *Hand;
   json_object_object_get_ex(w, "Both Hands", &Hand);


   if (Hand == NULL) {
      json_object_object_get_ex(w, "One Hand", &Hand);
      strcpy(handling, "One");
   }


   struct json_object *Stroke;
   json_object_object_get_ex(Hand, stk, &Stroke);
   if (Stroke == NULL) puts("Stroke is null");
   struct json_object *ST;
   json_object_object_get_ex(Stroke, "ST", &ST);
   if (ST == NULL) puts("ST is null.");

   char buff[80];
   strcpy(buff, json_object_get_string(ST));

   int X = roundNum(getFirstIntVal(buff));

   struct json_object *Attributes;
   json_object_object_get_ex(p, "Attributes", &Attributes);
   struct json_object *pST;
   json_object_object_get_ex(Attributes, "ST", &pST);
   int Z = json_object_get_int(pST);

   if (Z < X)
      *ES = *ES + (Z - X);

   int maxST = WeaponRequiredST(w, stk) * 3;
   if (Z > maxST)
      Z = maxST;

   defineReachDmg(p, w, stk, dmg, handling, Z);
}





















