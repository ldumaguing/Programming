// #define FUNC_NAME

#include <regex.h>
#include <stdio.h>
#include <json-c/json.h>
#include <string.h>
#include "UtilityStuffs.h"

void define_StrokeDmg(char *, char *, char *);
void define_WeaponDmg(char *, struct json_object *, char *, char *);

// *******************************************************************************
void defineRangeDmg(struct json_object *w, char *stk, char *dmg) {
#ifdef FUNC_NAME
   puts("defineRangeDmg");
#endif

   struct json_object *Damage;
   json_object_object_get_ex(w, "Damage", &Damage);
   strcpy(dmg, json_object_get_string(Damage));

   strcat(dmg, ";Acc:");
   struct json_object *Acc;
   json_object_object_get_ex(w, "Acc", &Acc);
   strcat(dmg, json_object_get_string(Acc));

   strcat(dmg, ";Range:");
   struct json_object *Range;
   json_object_object_get_ex(w, "Range", &Range);
   strcat(dmg, json_object_get_string(Range));

   strcat(dmg, ";RoF:");
   struct json_object *RoF;
   json_object_object_get_ex(w, "RoF", &RoF);
   strcat(dmg, json_object_get_string(RoF));

   strcat(dmg, ";Shots:");
   struct json_object *Shots;
   json_object_object_get_ex(w, "Shots", &Shots);
   strcat(dmg, json_object_get_string(Shots));

   strcat(dmg, ";Recoil:");
   struct json_object *Rcl;
   json_object_object_get_ex(w, "Rcl", &Rcl);
   strcat(dmg, json_object_get_string(Rcl));
}

// *******************************************************************************
void defineReachDmg(struct json_object *p, struct json_object *w, char *stk,
                    char *dmg, char *handling, int pST) {
#ifdef FUNC_NAME
   puts("defineReachDmg");
#endif

   char ReachDmg[80];
   char WeaponDmg[80];
   char Dmg[80];

   define_Damage(Dmg, pST);
   define_StrokeDmg(ReachDmg, Dmg, stk);

   strcpy(WeaponDmg, ReachDmg);
   define_WeaponDmg(WeaponDmg, w, stk, handling);

   strcpy(dmg, WeaponDmg);
}

// -------------------------------------------------------------------------------
void define_WeaponDmg(char *WeaponDmg, struct json_object *w, char *stk,
                      char *handling) {
#ifdef FUNC_NAME
   puts("define_WeaponDmg");
#endif

   struct json_object *Hand;
   struct json_object *Stroke;

   if (strcmp("One", handling) == 0) {
      json_object_object_get_ex(w, "One Hand", &Hand);
      if (Hand == NULL)
         json_object_object_get_ex(w, "Both Hands", &Hand);
   }
   else {
      json_object_object_get_ex(w, "Both Hands", &Hand);
      if (Hand == NULL)
         json_object_object_get_ex(w, "One Hand", &Hand);
   }

   json_object_object_get_ex(Hand, stk, &Stroke);


   struct json_object *Damage;
   struct json_object *Type;
   struct json_object *Reach;

   json_object_object_get_ex(Stroke, "Damage", &Damage);
   json_object_object_get_ex(Stroke, "Type", &Type);
json_object_object_get_ex(Stroke, "Reach", &Reach);

   char buff[80];
   strcpy(buff, json_object_get_string(Damage));
   if (isMatch("-", buff))
      strcat(WeaponDmg, " ");
   else
      strcat(WeaponDmg, " +");

   strcat(WeaponDmg, json_object_get_string(Damage));
   strcat(WeaponDmg, " ");
   strcat(WeaponDmg, json_object_get_string(Type));
   strcat(WeaponDmg, ";Reach:");
      strcat(WeaponDmg, json_object_get_string(Reach));
}

// -------------------------------------------------------------------------------
void define_StrokeDmg(char *ReachDmg, char *Dmg, char *stk) {
#ifdef FUNC_NAME
   puts("define_StrokeDmg");
#endif

   char subject[80];
   strcpy(subject, Dmg);

   char SwingPattern[] = "[0-9d+-]*$";
   char ThrustPattern[] = "^[0-9d+-]*";

   regex_t regex;
   regmatch_t match;

   if (strcmp("Swing", stk) == 0)
      regcomp(&regex, SwingPattern, REG_EXTENDED);
   else
      regcomp(&regex, ThrustPattern, REG_EXTENDED);

   int w = 0;
   int begin, end, len;
   char *word = NULL;
   if (regexec(&regex, subject, 1, &match, 0) == 0) {
      begin = (int)match.rm_so;
      end = (int)match.rm_eo;
      len = end - begin;
      word = malloc(len + 1);

      for (int i = begin; i < end; i++) {
         word[w] = subject[i];
         w++;
      }
      word[w] = 0;
   }
   else
      return;

   strcpy(ReachDmg, word);

   free(word);
   regfree(&regex);
}

// *******************************************************************************
void define_Damage(char *Dmg, int st) {
#ifdef FUNC_NAME
   puts("define_Damage");
#endif

   char damage[][20] = {"-",
                        "1d-6/1d-5a", "1d-6/1d-5b", "1d-5/1d-4c", "1d-5/1d-4d",
                        "1d-4/1d-3",  "1d-4/1d-3", "1d-3/1d-2",   "1d-3/1d-2",
                        "1d-2/1d-1",  "1d-2/1d",   "1d-1/1d+1",   "1d-1/1d+2",
                        "1d/2d-1",    "1d/2d",     "1d+1/2d+1",   "1d+1/2d+2",
                        "1d+2/3d-1",  "1d+2/3d",   "2d-1/3d+1",   "2d-1/3d+2",
                        "2d/4d-1",    "2d/4d",     "2d+1/4d+1",   "2d+1/4d+2",
                        "2d+2/5d-1",  "2d+2/5d",   "3d-1/5d+1",   "3d-1/5d+1",
                        "3d/5d+2",    "3d/5d+2",   "3d+1/6d-1",   "3d+1/6d-1",
                        "3d+2/6d",    "3d+2/6d",   "4d-1/6d+1",   "4d-1/6d+1",
                        "4d/6d+2",    "4d/6d+2",   "4d+1/7d-1",   "4d+1/7d-1",
                        "5d/7d+1",    "5d+2/8d-1", "6d/8d+1",     "7d-1/9d",
                        "7d+1/9d+2",  "8d/10d",    "8d+2/10d+2",  "9d/11d",
                        "9d+2/11d+2", "10d/12d",   "10d+2/12d+2", "11d/13d"
                       };

   if ((st >= 1) & (st <= 40)) {
      strcpy(Dmg, damage[st]);
      return;
   }
   if ((st > 40) & (st <= 100)) {
      strcpy(Dmg, damage[((st - 40) / 5) + 40]);
      return;
   }

   char buff[80];
   sprintf(buff, "%d%s%d%s", (((st - 100) / 10) + 11), "d/",
           (((st - 100) / 10) + 13), "d");
   strcpy(Dmg, buff);
}

// *******************************************************************************
void addTag(struct json_object *p, char *tag) {
#ifdef FUNC_NAME
   puts("addTag");
#endif

   struct json_object *Tags;
   json_object_object_get_ex(p, "Tags", &Tags);

   json_object *jstring = json_object_new_string(tag);

   json_object_array_add(Tags, jstring);
}

// *******************************************************************************
int roundNum(double f) {
#ifdef FUNC_NAME
   puts("roundNum");
#endif

   int X = (int)f;
   double Y = f - X;

   if (Y < .5)
      return X;

   return X + 1;
}

// *******************************************************************************
_Bool is_OneHand_BothHands(struct json_object *P, struct json_object *W,
                           char *stroke) {
#ifdef FUNC_NAME
   puts("is_OneHand_BothHands");
#endif

   // ********** Character HOLDING the weapon.
   struct json_object *AttackSrc;     // Left, Right, Both
   json_object_object_get_ex(P, "AttackSrc", &AttackSrc);

   char holding[80] = "\0";
   if ((strcmp("Left", json_object_get_string(AttackSrc)) == 0) |
         (strcmp("Right", json_object_get_string(AttackSrc)) == 0))
      strcpy(holding, "One");
   else
      strcpy(holding, "Both");


   struct json_object *WeaponClass;
   json_object_object_get_ex(W, "Class", &WeaponClass);
   if (strcmp("Weapon (Range)", json_object_get_string(WeaponClass)) == 0) {
      // ********** Weapon's handle type
      _Bool isTwoHanded = 0;
      if (hasCross(W, "") | hasDagger(W, ""))
         isTwoHanded = 1;


      if ((strcmp("One", holding) == 0) & isTwoHanded)
         return 1;

      return 0;
   }

   // ********** Weapon's handle type
   _Bool isTwoHanded = 0;
   if (hasCross(W, stroke) | hasDagger(W, stroke))
      isTwoHanded = 1;


   if ((strcmp("One", holding) == 0) & isTwoHanded)
      return 1;

   return 0;
}

// ********************************************************************************
int is_InArray(char *findThis, struct json_object *theArray) {
#ifdef FUNC_NAME
   puts("is_InArray");
#endif

   int len = json_object_array_length(theArray);
   if (len == 0) return -1;

   char subject[256];
   json_object *jval;
   for (int i = 0; i < len; i++) {
      jval = json_object_array_get_idx(theArray, i);
      strcpy(subject, json_object_get_string(jval));
      puts(subject);
      if (isMatch(findThis, subject)) return i;
   }

   return -1;  // Not in the array.
}

// ********************************************************************************
_Bool hasDagger(struct json_object *weapon, char *stroke) {
#ifdef FUNC_NAME
   puts("hasDagger");
#endif

   struct json_object *WeaponClass;
   json_object_object_get_ex(weapon, "Class", &WeaponClass);

   char StringBuff[80];

   if (strcmp("Weapon (Range)", json_object_get_string(WeaponClass)) == 0) {
      struct json_object *ST;
      json_object_object_get_ex(weapon, "ST", &ST);
      strcpy(StringBuff, json_object_get_string(ST));
      if (isMatch("‡", StringBuff))
         return 1;

      return 0;
   }


   struct json_object *Both_Hands;
   json_object_object_get_ex(weapon, "Both Hands", &Both_Hands);
   if (Both_Hands == NULL)
      return 0;             // Not a two-handed weapon

   struct json_object *stk;
   json_object_object_get_ex(Both_Hands, stroke, &stk);
   struct json_object *ST;
   json_object_object_get_ex(stk, "ST", &ST);
   strcpy(StringBuff, json_object_get_string(ST));
   if (isMatch("‡", StringBuff))
      return 1;

   return 0;
}

// ********************************************************************************
_Bool hasCross(struct json_object *weapon, char *stroke) {
#ifdef FUNC_NAME
   puts("hasCross");
#endif

   struct json_object *WeaponClass;
   json_object_object_get_ex(weapon, "Class", &WeaponClass);

   char StringBuff[80];

   if (strcmp("Weapon (Range)", json_object_get_string(WeaponClass)) == 0) {
      struct json_object *ST;
      json_object_object_get_ex(weapon, "ST", &ST);
      strcpy(StringBuff, json_object_get_string(ST));
      if (isMatch("†", StringBuff))
         return 1;

      return 0;
   }


   struct json_object *Both_Hands;
   json_object_object_get_ex(weapon, "Both Hands", &Both_Hands);
   if (Both_Hands == NULL)
      return 0;             // Not a two-handed weapon

   struct json_object *stk;
   json_object_object_get_ex(Both_Hands, stroke, &stk);
   struct json_object *ST;
   json_object_object_get_ex(stk, "ST", &ST);
   strcpy(StringBuff, json_object_get_string(ST));
   if (isMatch("†", StringBuff))
      return 1;

   return 0;
}

// *****************************************************************************
int getFirstIntVal(char *subject) {
#ifdef FUNC_NAME
   puts("getFirstIntVal");
#endif

   char pattern[] = "^[0-9C]*";

   regex_t regex;
   regmatch_t match;

   regcomp(&regex, pattern, REG_EXTENDED);

   int w = 0;
   int begin, end, len;
   char *word = NULL;
   if (regexec(&regex, subject, 1, &match, 0) == 0) {
      begin = (int)match.rm_so;
      end = (int)match.rm_eo;
      len = end - begin;
      word = malloc(len + 1);

      for (int i = begin; i < end; i++) {
         word[w] = subject[i];
         w++;
      }
      word[w] = 0;
   }
   else
      return 0;

   if (strcmp(word, "C") == 0) return 0;

   int X = atoi(word);

   free(word);
   regfree(&regex);

   return X;
}

// *****************************************************************************
int getLastIntVal(char *subject) {
#ifdef FUNC_NAME
   puts("getLastIntVal");
#endif

   char pattern[] = "[0-9C]*$";

   regex_t regex;
   regmatch_t match;

   regcomp(&regex, pattern, REG_EXTENDED);

   int w = 0;
   int begin, end, len;
   char *word = NULL;
   if (regexec(&regex, subject, 1, &match, 0) == 0) {
      begin = (int)match.rm_so;
      end = (int)match.rm_eo;
      len = end - begin;
      word = malloc(len + 1);

      for (int i = begin; i < end; i++) {
         word[w] = subject[i];
         w++;
      }
      word[w] = 0;
   }
   else
      return 0;

   if (strcmp(word, "C") == 0) return 0;

   int X = atoi(word);

   free(word);
   regfree(&regex);

   return X;
}

// *****************************************************************************
_Bool isMatch(char *pattern, char *subject) {
#ifdef FUNC_NAME
   puts("isMatch");
#endif

   regex_t regex;
   int result;

   regcomp(&regex, pattern, REG_EXTENDED);
   result = regexec(&regex, subject, 0, NULL, 0);

   regfree(&regex);

   return (result == 0);
}

// *****************************************************************************
_Bool isEmptyHanded(struct json_object *Unit) {
#ifdef FUNC_NAME
   puts("isEmptyHanded");
#endif

   struct json_object *AttackSrc;
   json_object_object_get_ex(Unit, "AttackSrc", &AttackSrc);

   char buff[100];
   strcpy(buff, json_object_get_string(AttackSrc));

   return (strcmp(buff, "PunchKick") == 0);
}

// *****************************************************************************
int WeaponRequiredST(struct json_object *w, char *stk) {
#ifdef FUNC_NAME
   puts("WeaponRequiredST");
#endif

   struct json_object *WeaponClass;
   json_object_object_get_ex(w, "Class", &WeaponClass);

   if (strcmp("Weapon (Range)", json_object_get_string(WeaponClass)) == 0) {
      return 0;
   }

   struct json_object *Hand;
   json_object_object_get_ex(w, "One Hand", &Hand);
   if (Hand == NULL)
      json_object_object_get_ex(w, "Both Hands", &Hand);

   struct json_object *stroke;
   json_object_object_get_ex(Hand, stk, &stroke);

   struct json_object *ST;
   json_object_object_get_ex(stroke, "ST", &ST);

   if (ST == NULL)
      return 0;

   char buff[80];
   strcpy(buff, json_object_get_string(ST));
   return getFirstIntVal(buff);
}





