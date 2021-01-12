// #define FUNC_NAME

#include <stdio.h>
#include <stdlib.h>
#include <json-c/json.h>
#include <string.h>
#include "myne.h"
#include "hexagon.h"

// ********************************************************************************
void Attack(struct json_object *Player, struct json_object *Target, char *argv[],
            int argc) {
#ifdef FUNC_NAME
   puts("Attacking...");
#endif


   // **********
   int EffectiveSkill = 0;
   char Damage[256] = "0";
   // **********


   mod_Weapon_Usage(Player, argv, argc, &EffectiveSkill, Damage);
   mod_Distance(Player, Target, Damage, argv, argc, &EffectiveSkill);


   strcat(Damage, ";Target:");
   strcat(Damage, argv[2]);
   printf("Effective Skill:%d;Damage:%s;Attacker:%s;\n", EffectiveSkill, Damage, argv[1]);
}


