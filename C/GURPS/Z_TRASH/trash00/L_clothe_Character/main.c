#include <stdio.h>
#include <stdlib.h>
#include <json-c/json.h>
#include <string.h>
#include "Myne/myne.h"

void instructions();
struct json_object *get_Wearable();
struct json_object *get_Unit(char **);

// *****************************************************************************
int main(int argc, char **argv) {
   if (argc < 2) {
      instructions();
      exit(0);
   }

   struct json_object *Wearable;
   struct json_object *Unit;
   Wearable = get_Wearable();
   Unit = get_Unit(argv);


   clothe(Wearable, Unit);


   char filename[100];
   strcpy(filename, argv[1]);
   strcat(filename, ".json");
   FILE *fp;
   fp = fopen(filename, "w");
   fputs(json_object_to_json_string_ext(Unit, 0), fp);
   fclose(fp);


   return 0;
}

// *****************************************************************************
struct json_object *get_Unit(char **argv) {
   FILE *fptr;
   char filename[100], c;
   char buff_64K[65536];

   strcpy(filename, argv[1]);
   strcat(filename, ".json");

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
struct json_object *get_Wearable() {
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

   return json_tokener_parse(buff_64K);
}

// *****************************************************************************
void instructions() {
   printf("cat armor.json | L_clothe_Character   NAME\n");
}

