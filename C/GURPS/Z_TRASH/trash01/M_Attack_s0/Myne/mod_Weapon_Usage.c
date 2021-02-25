// #define FUNC_NAME

#include <stdio.h>
#include <stdlib.h>
#include <json-c/json.h>
#include <string.h>
#include "myne.h"

// *******************************************************************************
void mod_Weapon_Usage(struct json_object *Player, char *argv[], int argc,
                      int *ES, char *Dmg) {
#ifdef FUNC_NAME
   puts("> mod_Weapon_Usage");
#endif

   int isOffhand = 0;
   if (argc == 5) isOffhand = 1;
   if (argc == 4)
      if (strcmp("offhand", argv[3]) == 0) isOffhand = 1;

   int One_or_Both = 0;   // 0: "One", 1: "Both"
   struct json_object *weapon = get_Weapon(Player, isOffhand, &One_or_Both);

   if (weapon == NULL) {
      if (argc == 3) {
         if (strcmp("Kick", argv[2]) == 0)
            weapon = get_PunchOrKick("Kick");
         else
            weapon = get_PunchOrKick("Punch");

         using_One_Hand(Player, ES, Dmg, weapon, "Thrust", 0);

         return;
      }

      if (argc >= 4) {
         if (strcmp("Punch", argv[3]) == 0) {
            weapon = get_PunchOrKick("Punch");
            using_One_Hand(Player, ES, Dmg, weapon, "Thrust", 0);
            return;
         }
         if (strcmp("Kick", argv[3]) == 0) {
            weapon = get_PunchOrKick("Kick");
            using_One_Hand(Player, ES, Dmg, weapon, "Thrust", 0);
            return;
         }
      }
   }

   if (argc >= 4) {
      if (strcmp("Punch", argv[3]) == 0) {
         weapon = get_PunchOrKick("Punch");
         using_One_Hand(Player, ES, Dmg, weapon, "Thrust", 0);
         return;
      }
      if (strcmp("Kick", argv[3]) == 0) {
         weapon = get_PunchOrKick("Kick");
         using_One_Hand(Player, ES, Dmg, weapon, "Thrust", 0);
         return;
      }
   }


   char buff[80];
   if (argc >= 4)
      strcpy(buff, argv[3]);

   char strokes[3][10] = {"Swing", "Swing1", "Thrust"};
   char stroke[80] = "blank";
   for (int i = 0; i < 3; i++) {
      if (strcmp(buff, strokes[i]) == 0) {
         strcpy(stroke, strokes[i]);
         break;
      }
   }


   if (One_or_Both)
      using_Both_Hands(Player, ES, Dmg, weapon, stroke);
   else
      using_One_Hand(Player, ES, Dmg, weapon, stroke, isOffhand);
}






