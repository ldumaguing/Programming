#include <json-c/json.h>
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <string.h>
#include <regex.h>
#include "myne.h"

void do_IntDouble(struct json_object *, char *, char *);
void do_Text(struct json_object *, char *, char *);
void withDot(struct json_object *, char *, char *);
void noDot(struct json_object *, char *, char *);
void insert_jobj(struct json_object *, struct json_object *, char *);

// *****************************************************************************
void insert_into(struct json_object *unit, char *theArray) {
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

   if (buff_64K[0] == '[') {
      printf("No arrays allowed.\n");
      return;
   }

   if (buff_64K[0] == '{') {
      json_object *jobj = json_tokener_parse(buff_64K);
      if (jobj != NULL)
         insert_jobj(unit, jobj, theArray);
      else
         printf("Invalid JSON object.\n");
   }
   else {
      if (isMatch("^[0-9\\.][0-9]+", buff_64K))
         do_IntDouble(unit, buff_64K, theArray);
      else
         do_Text(unit, buff_64K, theArray);
   }
}

// ================================================================================
void insert_jobj(struct json_object *unit, struct json_object *jobj, char *theArray) {
   struct json_object *Tags;
   json_object_object_get_ex(unit, theArray, &Tags);
   json_object_array_add(Tags, jobj);
}

// ================================================================================
void do_IntDouble(struct json_object *unit, char *buff, char *theArray) {
   puts(buff);
   if (isMatch("[0-9]\\.[0-9]+", buff))
      withDot(unit, buff, theArray);
   else
      noDot(unit, buff, theArray);
}

// ----------------------------------------
void withDot(struct json_object *unit, char *buff, char *theArray) {
   char *eptr;
   double result;
   result = strtod(buff, &eptr);
   json_object *jdouble = json_object_new_double(result);

   struct json_object *Tags;
   json_object_object_get_ex(unit, theArray, &Tags);
   json_object_array_add(Tags, jdouble);
}

// ----------------------------------------
void noDot(struct json_object *unit, char *buff, char *theArray) {
   int X = atoi(buff);
   json_object *jint = json_object_new_int(X);

   struct json_object *Tags;
   json_object_object_get_ex(unit, theArray, &Tags);
   json_object_array_add(Tags, jint);
}

// ================================================================================
void do_Text(struct json_object *unit, char *buff, char *theArray) {
   if (buff[strlen(buff) - 1] == '\n')
      buff[strlen(buff) - 1] = '\0';
   json_object *jstring = json_object_new_string(buff);

   struct json_object *Tags;
   json_object_object_get_ex(unit, theArray, &Tags);
   json_object_array_add(Tags, jstring);
}

