#include <json-c/json.h>
#include <stdio.h>
#include <math.h>
#include <string.h>
#include <regex.h>
#include "myne.h"

void do_IntDouble(struct json_object *, char *);
void do_Text(struct json_object *, char *);
void withDot(struct json_object *, char *);
void noDot(struct json_object *, char *);
void insert_jobj(struct json_object *, struct json_object *);

// *****************************************************************************
void insert_into_tags(struct json_object *unit) {
   char buff_64K[65536];

   int counter = 0;
   int c;
   c = getchar();
   while (c != EOF) {
      buff_64K[counter] = c;
      c = getchar();
      counter++;
   }
   buff_64K[counter] = '\0';

   if (buff_64K[0] == '{') {
      json_object *jobj = json_tokener_parse(buff_64K);
      if (jobj != NULL)
         insert_jobj(unit, jobj);
      else
         printf("Invalid JSON object.\n");
   }
   else {
      printf("not\n");
      if (isMatch("^[0-9\\.][0-9]+", buff_64K))
         do_IntDouble(unit, buff_64K);
      else
         do_Text(unit, buff_64K);
   }
}

// ================================================================================
void insert_jobj(struct json_object *unit, struct json_object *jobj) {
   struct json_object *Tags;
   json_object_object_get_ex(unit, "Tags", &Tags);
   json_object_array_add(Tags, jobj);
}

// ================================================================================
void do_IntDouble(struct json_object *unit, char *buff) {
   printf("IntDouble\n");
   puts(buff);
   if (isMatch("[0-9]\\.[0-9]+", buff))
      withDot(unit, buff);
   else
      noDot(unit, buff);
}

// ----------------------------------------
void withDot(struct json_object *unit, char *buff) {
   printf("withDot\n");
   json_object *jdouble = json_object_new_double(*buff);

   struct json_object *Tags;
   json_object_object_get_ex(unit, "Tags", &Tags);
   json_object_array_add(Tags, jdouble);
}

// ----------------------------------------
void noDot(struct json_object *unit, char *buff) {
   printf("noDot\n");
   json_object *jint = json_object_new_int(*buff);

   struct json_object *Tags;
   json_object_object_get_ex(unit, "Tags", &Tags);
   json_object_array_add(Tags, jint);
}

// ================================================================================
void do_Text(struct json_object *unit, char *buff) {
   printf("%s\n", buff);
   if (buff[strlen(buff) - 1] == '\n')
      buff[strlen(buff) - 1] = '\0';
   json_object *jstring = json_object_new_string(buff);

   struct json_object *Tags;
   json_object_object_get_ex(unit, "Tags", &Tags);
   json_object_array_add(Tags, jstring);
}

