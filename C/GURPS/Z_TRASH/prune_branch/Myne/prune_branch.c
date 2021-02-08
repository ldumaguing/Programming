#include <stdio.h>
#include <json-c/json.h>
#include <string.h>
#include "myne.h"

void rm_Nude(struct json_object *, char *);

// ********************************************************************************
void prune_branch(struct json_object *Tree, char *path) {
   rm_Nude(Tree, path);

   return;
}

// ********************************************************************************
void rm_Nude(struct json_object *nude, char *path) {
   char *section = get_Section(path, "[a-zA-z _0-9]*");
   struct json_object *Nude;
   json_object_object_get_ex(nude, section, &Nude);

   int sectionLength = get_CharCount(section);
   int pathLength = get_CharCount(path);
   if (sectionLength == pathLength) {
      json_object_object_del(nude, section);
      free(section);
      return;
   }

   char *c;
   c = path;
   for (int i = 0; i <= sectionLength; i++)
      c++;

   rm_Nude(Nude, c);
   free(section);
};

