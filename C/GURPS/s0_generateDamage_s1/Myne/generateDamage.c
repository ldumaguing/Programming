// #define FUNC_NAME

#include <regex.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "myne.h"
#include "UtilityStuffs.h"

int ES(char *);
char OpineRoll(int, int);
void def_DamageRoll(char *, char *);
void def_DamageEquation(char *, char *);
void def_Target(char *, char *);
float get_DamageMultiplier(char *);

// *******************************************************************************
void generateDamage2(char *dmgString, int rolled) {
#ifdef FUNC_NAME
   puts("L_resolve_Damage");
   printf("%s\n", dmgString);
#endif

   if (isMatch("---", dmgString)) {
      puts("Out of range or reach.");
      return;
   }

   printf("ES:%d;Rolled:%d;", ES(dmgString), rolled);

   _Bool isNoDamage = 0;
   switch (OpineRoll(ES(dmgString), rolled)) {
      case 'h':
         printf("Hit:%d;", ES(dmgString) - rolled);
         break;
      case 'm':
         printf("Miss:%d\n", ES(dmgString) - rolled);
         isNoDamage = 1;
         break;
      case 'c':
         printf("Crit:%d;", ES(dmgString) - rolled);
         break;
      default:
         printf("Fumble:%d\n", ES(dmgString) - rolled);
         isNoDamage = 1;
   }

   if (isNoDamage) return;

   char DamageData[80];
   def_DamageRoll(DamageData, dmgString);
   char Target[80];
   def_Target(Target, dmgString);

   int DamageRoll = Roll_For_Damage(DamageData);
   float DamageMultiplier = get_DamageMultiplier(DamageData);
   printf("Damage:%d;Multiplier:%1.1f;%s\n", DamageRoll, DamageMultiplier,
          Target);
}

// *******************************************************************************
void generateDamage(char *dmgString) {
#ifdef FUNC_NAME
   puts("L_resolve_Damage");
   printf("%s\n", dmgString);
#endif

   if (isMatch("---", dmgString)) {
      puts("Out of range or reach.");
      return;
   }

   int rolled = roll_3d6();
   printf("ES:%d;Rolled:%d;", ES(dmgString), rolled);

   _Bool isNoDamage = 0;
   switch (OpineRoll(ES(dmgString), rolled)) {
      case 'h':
         printf("Hit:%d;", ES(dmgString) - rolled);
         break;
      case 'm':
         printf("Miss:%d\n", ES(dmgString) - rolled);
         isNoDamage = 1;
         break;
      case 'c':
         printf("Crit:%d;", ES(dmgString) - rolled);
         break;
      default:
         printf("Fumble:%d\n", ES(dmgString) - rolled);
         isNoDamage = 1;
   }

   if (isNoDamage) return;

   char DamageData[80];
   def_DamageRoll(DamageData, dmgString);
   char Target[80];
   def_Target(Target, dmgString);

   int DamageRoll = Roll_For_Damage(DamageData);
   float DamageMultiplier = get_DamageMultiplier(DamageData);
   printf("Damage:%d;Multiplier:%1.1f;%s\n", DamageRoll, DamageMultiplier,
          Target);
}

// *******************************************************************************
void def_Target(char *tgt, char *DamageData) {
   getGrep(tgt, "Target.*", DamageData);
}

// -------------------------------------------------------------------------------
float get_DamageMultiplier(char *DamageData) {
   char buff[80];
   getGrep(buff, "[a-z+-]*$", DamageData);


   if (strcmp(buff, "cut") == 0) return 1.5;
   if (strcmp(buff, "imp") == 0) return 2.0;
   if (strcmp(buff, "pi-") == 0) return 0.5;
   if (strcmp(buff, "pi+") == 0) return 1.5;
   if (strcmp(buff, "pi++") == 0) return 2.0;


   return 1.0;
}

// -------------------------------------------------------------------------------
void def_DamageEquation(char *DamageEquation, char *DmgData) {
   getGrep(DamageEquation, "[0-9d\\ +-]*", DmgData);
}

// -------------------------------------------------------------------------------
void def_DamageRoll(char *DmgRoll, char *dmgString) {
   char aString[80];
   getGrep(aString, "Damage:[0-9a-z\\ +-]*", dmgString);

   getGrep(DmgRoll, "[0-9a-z\\ +-]*$", aString);
}

// *******************************************************************************
int ES(char *dmg) {
   char KeyVal[80];
   getGrep(KeyVal, "Effective Skill:[0-9]*", dmg);

   return getLastIntVal(KeyVal);
}

// *******************************************************************************
char OpineRoll(int ES, int rolled) {
   if (rolled < 3) rolled = 3;
   if (rolled > 18) rolled = 18;

   if (rolled <= 4) return 'c';     // crit
   if (rolled == 18) return 'f';    // fumble

   if ((ES - rolled) >= 10) return 'c';

   if ((rolled - ES) >= 10) return 'f';
   if ((rolled == 17) & (ES <= 15)) return 'f';

   if (ES >= rolled) return 'h';   // hit

   return 'm';   // miss
}



