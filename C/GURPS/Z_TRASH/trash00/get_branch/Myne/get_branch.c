#include <stdio.h>
#include <stdlib.h>
#include <json-c/json.h>
#include <string.h>
#include "myne.h"

void get_Nude(struct json_object *, char *, struct json_object *);

// ********************************************************************************
void get_branch(struct json_object *Tree, char *path, struct json_object *Branch) {
   get_Nude(Tree, path, Branch);

   return;
}

// ********************************************************************************
void get_Nude(struct json_object *nude, char *path, struct json_object *branch) {
   char *section = get_Section(path, "[a-zA-z _0-9]*");
   struct json_object *Nude;
   json_object_object_get_ex(nude, section, &Nude);

   int sectionLength = get_CharCount(section);
   int pathLength = get_CharCount(path);
   if (sectionLength == pathLength) {
      struct json_object *X = json_object_object_get(nude, section);
      json_object_object_add(branch, section, X);
      free(section);
      return;
   }

   char *c;
   c = path;
   for (int i = 0; i <= sectionLength; i++)
      c++;

   get_Nude(Nude, c, branch);
   free(section);
};

