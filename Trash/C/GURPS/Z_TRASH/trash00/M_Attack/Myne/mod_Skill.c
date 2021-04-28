// #define FUNC_NAME

#include <stdio.h>
#include <stdlib.h>
#include <json-c/json.h>
#include <string.h>
#include "myne.h"
#include "UtilityStuffs.h"

_Bool gotRequiredSkill(struct json_object *, struct json_object *);
int getRequiredSkillVal(struct json_object *, struct json_object *);
_Bool gotDefaultSkill(struct json_object *, struct json_object *, int[]);
void get_Range_Data();

// *******************************************************************************
void mod_Skill(struct json_object *P, int *ES, char *Dmg,
               struct json_object *weapon, char *stroke, int isOffhand,
               char *WepClass) {
#ifdef FUNC_NAME
   puts("> mod_Skill");
#endif

   struct json_object *Skills;
   Skills = get_Skills(P, weapon);


   struct json_object *RequiredSkill;
   json_object_object_get_ex(Skills, "Skill", &RequiredSkill);

#ifdef FUNC_NAME
   puts(json_object_get_string(RequiredSkill));
#endif

   struct json_object *P_Skills;
   json_object_object_get_ex(P, "Skills", &P_Skills);


   if (gotRequiredSkill(RequiredSkill, P_Skills)) {
#ifdef FUNC_NAME
      puts("Got required skill.");
#endif

      *ES = getRequiredSkillVal(RequiredSkill, P_Skills);
      return;
   }


   struct json_object *Defaults;
   json_object_object_get_ex(Skills, "Defaults", &Defaults);
   int DefSki[2] = {0, 0};
   if (gotDefaultSkill(Defaults, P_Skills, DefSki)) {
      puts("Got default skill...");
      *ES = DefSki[1] - DefSki[0];
      return;
   }



   // ********** Final search. Using attributes.
#ifdef FUNC_NAME
   puts("Final search. Using attributes.");
#endif

   json_object *jarray = json_object_new_array();

   json_object *Attributes;
   json_object_object_get_ex(P, "Attributes", &Attributes);
   json_object *Attribute;
   json_object *jstring;
   char buff[80];

   json_object_object_get_ex(Attributes, "ST", &Attribute);
   sprintf(buff, "ST-%d", json_object_get_int(Attribute));
   jstring = json_object_new_string(buff);
   json_object_array_add(jarray, jstring);
   json_object_object_get_ex(Attributes, "DX", &Attribute);
   sprintf(buff, "DX-%d", json_object_get_int(Attribute));
   jstring = json_object_new_string(buff);
   json_object_array_add(jarray, jstring);
   json_object_object_get_ex(Attributes, "IQ", &Attribute);
   sprintf(buff, "IQ-%d", json_object_get_int(Attribute));
   jstring = json_object_new_string(buff);
   json_object_array_add(jarray, jstring);
   json_object_object_get_ex(Attributes, "HT", &Attribute);
   sprintf(buff, "HT-%d", json_object_get_int(Attribute));
   jstring = json_object_new_string(buff);
   json_object_array_add(jarray, jstring);

   //gotAttributeSkill(Defaults, jarray, DefSki);

   if (gotDefaultSkill(Defaults, jarray, DefSki)) {
#ifdef FUNC_NAME
      puts("Using attribute skill.");
#endif
      *ES = DefSki[1] - DefSki[0];
   }
}

// ======================================================================
_Bool gotDefaultSkill(struct json_object *dfs, struct json_object *pss,
                      int DefSki[]) {
#ifdef FUNC_NAME
   puts("...gotDefaultSkill");
#endif

   if (json_object_array_length(pss) == 0)
      return 0;   // No skills

   int dfslen = json_object_array_length(dfs);
   int psslen = json_object_array_length(pss);
   json_object *dfsval;
   json_object *pssval;
   char clippedDFS[80];
   char clippedPSS[80];
   for (int i = 0; i < dfslen; i++) {
      dfsval = json_object_array_get_idx(dfs, i);
      strcpy(clippedDFS, json_object_get_string(dfsval));
      for (int k = 79; k >= 0; k--) {
         if (clippedDFS[k] == '-') {
            clippedDFS[k] = '\0';
            break;
         }
      }
      for (int j = 0; j < psslen; j++) {
         pssval = json_object_array_get_idx(pss, j);
         strcpy(clippedPSS, json_object_get_string(pssval));
         for (int k = 79; k >= 0; k--) {
            if (clippedPSS[k] == '-') {
               clippedPSS[k] = '\0';
               break;
            }
         }
         if (strcmp(clippedDFS, clippedPSS) == 0) {
            char dfsString[80];
            strcpy(dfsString, json_object_get_string(dfsval));
            char pssString[80];
            strcpy(pssString, json_object_get_string(pssval));
            DefSki[0] = getLastIntVal(dfsString);
            DefSki[1] = getLastIntVal(pssString);
            return 1;
         }
      }
   }

   return 0;
}

// ======================================================================
int getRequiredSkillVal(struct json_object *rs,
                        struct json_object *pss) {
#ifdef FUNC_NAME
   puts("...getRequiredSkillVal");
#endif

   char pattern[80];
   strcpy(pattern, json_object_get_string(rs));
   char subject[160];

   int arraylen = json_object_array_length(pss);
   json_object *jval;
   for (int i = 0; i < arraylen; i++) {
      jval = json_object_array_get_idx(pss, i);
      strcpy(subject, json_object_get_string(jval));
      if (isMatch(pattern, subject)) {
         printf("val: %s\n", subject);
         return getLastIntVal(subject);
      }
   }

   return 0;
}

// *******************************************************************************
_Bool gotRequiredSkill(struct json_object *rs, struct json_object *pss) {
#ifdef FUNC_NAME
   puts("...gotRequiredSkill");
#endif

   if (json_object_array_length(pss) == 0)
      return 0;   // No skills

   char pattern[80];
   strcpy(pattern, json_object_get_string(rs));
   char subject[160];

   int arraylen = json_object_array_length(pss);
   json_object *jval;
   for (int i = 0; i < arraylen; i++) {
      jval = json_object_array_get_idx(pss, i);
      strcpy(subject, json_object_get_string(jval));
      if (isMatch(pattern, subject))
         return 1;
   }

   return 0;
}
