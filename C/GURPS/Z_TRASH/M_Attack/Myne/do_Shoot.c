#define FUNC_NAME

#include <stdio.h>
#include <stdlib.h>
#include <json-c/json.h>
#include <string.h>
#include "myne.h"
#include "UtilityStuffs.h"

// *******************************************************************************
void do_Shoot(struct json_object *p, struct json_object *w, char *stk, int *ES,
              char *dmg) {
#ifdef FUNC_NAME
   puts("do_Shoot");
#endif

   struct json_object *ST;
   json_object_object_get_ex(w, "ST", &ST);

   char buff[80];
   strcpy(buff, json_object_get_string(ST));
   int X = roundNum(getFirstIntVal(buff));

   struct json_object *Attributes;
   json_object_object_get_ex(p, "Attributes", &Attributes);
   struct json_object *pST;
   json_object_object_get_ex(Attributes, "ST", &pST);
   int Z = json_object_get_int(pST);

   if (is_OneHand_BothHands(p, w, ""))
      X = roundNum(X * 1.5);

   if (Z < X) {
      *ES = *ES + (Z - X);
      addTag(p, "Unready");
   }

   defineRangeDmg(w, stk, dmg);
}


