// #define FUNC_NAME

#include <stdio.h>
#include <stdlib.h>
#include <json-c/json.h>
#include <string.h>
#include "myne.h"

struct json_object *get_Punch();
struct json_object *get_Kick();

// *******************************************************************************
struct json_object *get_PunchOrKick(char *PK) {
#ifdef FUNC_NAME
   puts("> get_PunchOrKick");
   puts(PK);
#endif

   if (strcmp("Punch", PK) == 0)
      return get_Punch();
   else
      return get_Kick();
}

// *******************************************************************************
struct json_object *get_Kick() {
#ifdef FUNC_NAME
   puts("...get_Kick");
#endif

   char *str = "{       \
   \"Name\":\"Kick\",       \
   \"Class\": \"Weapon (Reach)\",       \
   \"Weight\":\"0\",       \
   \"Usage\":[\"Thrust\"],       \
   \"One Hand\":{       \
      \"Skill\":\"x\",       \
      \"Defaults\":[\"Brawling-2\", \"Karate-2\", \"DX-2\"],       \
      \"Thrust\":{       \
         \"ST\":\"0\",       \
         \"Damage\":\"-1\",       \
         \"Type\":\"cr\",       \
         \"Reach\":\"C\",       \
         \"Parry\":\"0\"       \
      }       \
   }       \
}";

   return  json_tokener_parse(str);
}

// *******************************************************************************
struct json_object *get_Punch() {
#ifdef FUNC_NAME
   puts("...get_Punch");
#endif
   char *str = "{   \
   \"Name\":\"Punch\",       \
   \"Class\": \"Weapon (Reach)\",       \
   \"Weight\":\"0\",       \
   \"Usage\":[\"Thrust\"],       \
   \"One Hand\":{       \
      \"Skill\":\"x\",       \
      \"Defaults\":[\"Boxing\", \"Brawling\", \"Karate\", \"DX\"],       \
      \"Thrust\":{       \
         \"ST\":\"0\",       \
         \"Damage\":\"-1\",       \
         \"Type\":\"cr\",       \
         \"Reach\":\"C\",       \
         \"Parry\":\"0\"       \
      }       \
   }       \
}";

   return  json_tokener_parse(str);
}

