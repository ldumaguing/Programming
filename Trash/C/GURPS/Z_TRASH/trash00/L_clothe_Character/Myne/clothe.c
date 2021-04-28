#include <json-c/json.h>
#include <stdio.h>
#include <math.h>
#include <string.h>
#include <regex.h>
#include "myne.h"

void clothe(struct json_object *Wearable, struct json_object *Unit) {
   if (!isWearable(Wearable)) {
      printf("Not wearable.\n");
      exit(0);
   }

   struct json_object *Wearing;
   json_object_object_get_ex(Unit, "Wearing", &Wearing);
   json_object_array_add(Wearing, Wearable);
}

