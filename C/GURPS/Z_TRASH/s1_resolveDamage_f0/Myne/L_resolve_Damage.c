#include <stdio.h>
#include <stdlib.h>
#include "UtilityStuffs.h"

void def_Target(char *, char *);

// *******************************************************************************
void L_resolve_Damage(char *TheDamage) {
   char Target[80];
   def_Target(Target, TheDamage);
   
   puts("---");
   puts(TheDamage);
   puts(Target);
}

// *******************************************************************************
void def_Target(char *tgt, char *DamageData) {
   getGrep(tgt, "Target.*", DamageData);
}
