#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <json-c/json.h>

void instructions();

// *****************************************************************************
int main(int argc, char *argv[]) {
   if (argc <= 1) {
      instructions();
      exit(0);
   }

   FILE *fptr;

   char filename[100], c;
   char buff_64K[65536];

   strcpy(filename, argv[1]);

   // Open file
   fptr = fopen(filename, "r");
   if (fptr == NULL) {
      printf("Cannot open file \n");
      exit(0);
   }

   // Read contents from file
   c = fgetc(fptr);
   int counter = 0;
   while (c != EOF) {
      buff_64K[counter] = c;
      counter++;
      c = fgetc(fptr);
   }
   buff_64K[counter] = '\0';

   fclose(fptr);

   // Create the object based on the file that was just been read.
   struct json_object *jobj;
   jobj = json_tokener_parse(buff_64K);
   printf("%s\n", json_object_to_json_string_ext(jobj, JSON_C_TO_STRING_SPACED | JSON_C_TO_STRING_PRETTY));

   return 0;
}

// *****************************************************************************
void instructions() {
   printf("T_prettyJSON jsonfile\n");
}
