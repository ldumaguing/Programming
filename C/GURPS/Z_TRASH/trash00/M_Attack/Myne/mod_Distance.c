// #define FUNC_NAME
// #define PRINT_DEBUG

#include <stdio.h>
#include <stdlib.h>
#include <json-c/json.h>
#include <string.h>
#include "myne.h"
#include "hexagon.h"
#include "UtilityStuffs.h"

_Bool isWithinReach(struct json_object *, int, char *);
_Bool isWithinRange(struct json_object *, int, char *);
_Bool isWithinHalfRange(struct json_object *, int, char *);

// *******************************************************************************
void mod_Distance(struct json_object *Player, struct json_object *Target,
                  char *Dmg, char *argv[], int argc, int *ES) {
#ifdef FUNC_NAME
   puts("> mod_Distance");
#endif

   struct json_object *HexLoc;
   json_object_object_get_ex(Player, "HexLoc", &HexLoc);

   struct json_object *X = json_object_array_get_idx(HexLoc, 0);
   struct json_object *Y = json_object_array_get_idx(HexLoc, 1);
   int x = json_object_get_int(X);
   int y = json_object_get_int(Y);
   int A[2] = {x, y};

   json_object_object_get_ex(Target, "HexLoc", &HexLoc);
   X = json_object_array_get_idx(HexLoc, 0);
   Y = json_object_array_get_idx(HexLoc, 1);
   x = json_object_get_int(X);
   y = json_object_get_int(Y);
   int B[2] = {x, y};

   int dist = HexDistance(A, B);

   int isOffhand = 0;
   if (argc == 5) isOffhand = 1;
   if (argc == 4)
      if (strcmp("offhand", argv[3]) == 0) isOffhand = 1;

   int One_or_Both = 0;   // 0: "One", 1: "Both"
   struct json_object *weapon = get_Weapon(Player, isOffhand, &One_or_Both);


   if (weapon == NULL) {
      if (argc == 3) {
         if (strcmp("Kick", argv[2]) == 0) {
            weapon = get_PunchOrKick("Kick");
         }
         else {
            weapon = get_PunchOrKick("Punch");
         }
         if (!isWithinReach(weapon, dist, "Thrust")) {
            strcpy(Dmg, "---");
            return;
         }
         using_One_Hand(Player, ES, Dmg, weapon, "Thrust", 0);

         return;
      }

      if (argc >= 4) {
         if (strcmp("Punch", argv[3]) == 0) {
            weapon = get_PunchOrKick("Punch");
            if (!isWithinReach(weapon, dist, "Thrust")) {
               strcpy(Dmg, "---");
               return;
            }
            using_One_Hand(Player, ES, Dmg, weapon, "Thrust", 0);
            return;
         }
         if (strcmp("Kick", argv[3]) == 0) {
            weapon = get_PunchOrKick("Kick");
            if (!isWithinReach(weapon, dist, "Thrust")) {
               strcpy(Dmg, "---");
               return;
            }
            if (!isWithinReach(weapon, dist, "Thrust")) {
               strcpy(Dmg, "---");
               return;
            }
            using_One_Hand(Player, ES, Dmg, weapon, "Thrust", 0);
            return;
         }
      }
   }
   if (argc >= 4) {
      if (strcmp("Punch", argv[3]) == 0) {
         weapon = get_PunchOrKick("Punch");
         if (!isWithinReach(weapon, dist, "Thrust")) {
            strcpy(Dmg, "---");
            return;
         }
         using_One_Hand(Player, ES, Dmg, weapon, "Thrust", 0);
         return;
      }
      if (strcmp("Kick", argv[3]) == 0) {
         weapon = get_PunchOrKick("Kick");
         if (!isWithinReach(weapon, dist, "Thrust")) {
            strcpy(Dmg, "---");
            return;
         }
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


   struct json_object *WeaponClass;
   json_object_object_get_ex(weapon, "Class", &WeaponClass);

   if (strcmp("Weapon (Reach)", json_object_get_string(WeaponClass)) == 0) {
#ifdef PRINT_DEBUG
      puts("Reach");
#endif
      if (!isWithinReach(weapon, dist, stroke)) {
         strcpy(Dmg, "---");
         return;
      }
   }
   else {
#ifdef PRINT_DEBUG
      puts("Range");
#endif
      if (!isWithinRange(weapon, dist, Dmg)) {
         strcpy(Dmg, "---");
         return;
      }
      if (isWithinHalfRange(weapon, dist, Dmg)) strcat(Dmg, ";½D");
   }
}

// *******************************************************************************
_Bool isWithinHalfRange(struct json_object *w, int dist, char *dmg) {
#ifdef FUNC_NAME
   puts("...isWithinHalfRange");
#endif

   char buff[80];

   struct json_object *Range;
   json_object_object_get_ex(w, "Range", &Range);

   strcpy(buff, json_object_get_string(Range));
   int halfDist = getFirstIntVal(buff);
   int maxDist = getLastIntVal(buff);
#ifdef PRINT_DEBUG
   printf("    ½D: %d\n", halfDist);
   printf("   max: %d\n", maxDist);
#endif
   if ((dist <= maxDist) & (dist >= halfDist)) return 1;


   return 0;
}

// *******************************************************************************
_Bool isWithinRange(struct json_object *w, int dist, char *dmg) {
#ifdef FUNC_NAME
   puts("...isWithinRange");
#endif

   char buff[80];

   struct json_object *Range;
   json_object_object_get_ex(w, "Range", &Range);

   strcpy(buff, json_object_get_string(Range));
   int maxDist = getLastIntVal(buff);
#ifdef PRINT_DEBUG
   printf("    ½D: %d\n", halfDist);
   printf("   max: %d\n", maxDist);
#endif
   if (dist <= maxDist) return 1;


   return 0;
}

// *******************************************************************************
_Bool isWithinReach(struct json_object *w, int dist, char *stk) {
#ifdef FUNC_NAME
   puts("...isWithinReach");
#endif
#ifdef PRINT_DEBUG
   puts(stk);
#endif

   char buff[80];

   if (strcmp("blank", stk) == 0) {
      struct json_object *Usage;
      json_object_object_get_ex(w, "Usage", &Usage);
      json_object *jval;
      jval = json_object_array_get_idx(Usage, 0);  // getFirstWeaponStroke
      strcpy(buff, json_object_get_string(jval));
   }
   else
      strcpy(buff, stk);

   struct json_object *handle;
   json_object_object_get_ex(w, "One Hand", &handle);
   if (handle == NULL)
      json_object_object_get_ex(w, "Both Hands", &handle);

   struct json_object *Stroke;
   json_object_object_get_ex(handle, buff, &Stroke);

   struct json_object *Reach;
   json_object_object_get_ex(Stroke, "Reach", &Reach);

   strcpy(buff, json_object_get_string(Reach));
   int minDist = getFirstIntVal(buff);
   int maxDist = getLastIntVal(buff);
#ifdef PRINT_DEBUG
   printf("   min: %d\n", minDist);
   printf("   max: %d\n", maxDist);
#endif

   if ((dist <= maxDist) & (dist >= minDist)) return 1;

   return 0;
}













