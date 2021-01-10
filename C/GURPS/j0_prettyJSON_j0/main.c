#include <stdio.h>
#include <stdlib.h>
#include <json-c/json.h>
#include <string.h>

int main(int argc, char *argv[]) {
   char buff[65536];

   int counter = 0;
   int c;
   c = getchar();
   while (c != EOF) {
      buff[counter] = c;
      c = getchar();
      counter++;
   }
   buff[counter] = '\0';

   struct json_object *jobj;
   jobj = json_tokener_parse(buff);
   printf("%s\n", json_object_to_json_string_ext(jobj, JSON_C_TO_STRING_SPACED | JSON_C_TO_STRING_PRETTY));

   return 0;
}
