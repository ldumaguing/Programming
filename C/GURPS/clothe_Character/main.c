#include <stdio.h>
#include <stdlib.h>
#include <json-c/json.h>
#include <string.h>
#include "Myne/myne.h"

void instructions();
struct json_object *get_JSON(char *);

// *****************************************************************************
int main(int argc, char *argv[]) {
   if (argc < 2) {
      instructions();
      exit(0);
   }

   struct json_object *Unit;
   struct json_object *Wearable;
   Unit = get_JSON(argv[1]);
   Wearable = get_JSON(argv[2]);

   clothe(Wearable, Unit);

   puts(json_object_to_json_string_ext(Unit, 0));


   return 0;
}

// *****************************************************************************
struct json_object *get_JSON(char *argv) {
   FILE *fptr;
   char filename[100], c;
   char buff_64K[65536];

   strcpy(filename, argv);

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

   return json_tokener_parse(buff_64K);
}

// *****************************************************************************
void instructions() {
   printf("clothe_Character   NAME.json   ARMOR.json\n");
}
