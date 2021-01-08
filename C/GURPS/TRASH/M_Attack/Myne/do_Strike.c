#define FUNC_NAME

#include <stdio.h>
#include <stdlib.h>
#include <json-c/json.h>
#include <string.h>
#include <math.h>
#include "myne.h"
#include "UtilityStuffs.h"

// *******************************************************************************
void do_Strike(struct json_object *p, struct json_object *w, char *stk, int *ES,
               char *dmg) {
#ifdef FUNC_NAME
   puts("do_Strike");
#endif

   struct json_object *Both_Hands;
   json_object_object_get_ex(w, "Both Hands", &Both_Hands);
   struct json_object *Stroke;
   json_object_object_get_ex(Both_Hands, stk, &Stroke);
   struct json_object *ST;
   json_object_object_get_ex(Stroke, "ST", &ST);

   char buff[80];
   strcpy(buff, json_object_get_string(ST));

   int X = roundNum(getFirstIntVal(buff) * 1.5);
   int Y = 0;
   if (hasDagger(w, stk))
      Y = X * 2;
   else
      Y = X * 3;

   struct json_object *Attributes;
   json_object_object_get_ex(p, "Attributes", &Attributes);
   struct json_object *pST;
   json_object_object_get_ex(Attributes, "ST", &pST);
   int Z = json_object_get_int(pST);

   if (Z < X) {
      *ES = -1000;  // too heavy to use.
      return;
   }

   if (Z < Y)
      addTag(p, "Unready");
   else {
      int maxST = WeaponRequiredST(w, stk);
      if (Z > maxST)
         Z = maxST;
   }


   defineReachDmg(p, w, stk, dmg, "One", Z);
}







