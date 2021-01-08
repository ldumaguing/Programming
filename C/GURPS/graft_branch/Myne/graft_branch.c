#include <stdio.h>
#include <stdlib.h>
#include <json-c/json.h>
#include <string.h>
#include "myne.h"

void set_Nude(struct json_object *, char *, struct json_object *);

// ********************************************************************************
void graft_branch(struct json_object *Tree, struct json_object *Branch, char *path) {
// graft_branch Redner.json DB/Weapon/Bastard\ Sword.json "Holding.Left Hand"
   set_Nude(Tree, path, Branch);

   return;
}

// ********************************************************************************
void set_Nude(struct json_object *nude, char *path, struct json_object *branch) {
   char *section = get_Section(path, "[a-zA-z _0-9]*");
   struct json_object *Nude;
   json_object_object_get_ex(nude, section, &Nude);

   int sectionLength = get_CharCount(section);
   int pathLength = get_CharCount(path);
   if (sectionLength == pathLength) {
      json_object_object_add(nude, section, branch);
      free(section);
      return;
   }

   char *c;
   c = path;
   for (int i = 0; i <= sectionLength; i++)
      c++;

   set_Nude(Nude, c, branch);
   free(section);
};

