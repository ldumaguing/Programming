#include <stdio.h>
#include <stdlib.h>
#include <json-c/json.h>
#include <string.h>
#include "Myne/myne.h"

void instructions();
struct json_object *get_JSON(char *);

// *****************************************************************************
int main(int argc, char **argv) {
   if (argc < 2) {
      instructions();
      exit(0);
   }

   struct json_object *Unit;
   struct json_object *Weapon;
   Unit = get_JSON(argv[1]);
   Weapon = get_JSON(argv[2]);

   arm(Weapon, Unit);

   puts(json_object_to_json_string_ext(Unit, 0));

   /*
      char filename[100];
      strcpy(filename, argv[1]);
      strcat(filename, ".json");
      FILE *fp;
      fp = fopen(filename, "w");
      fputs(json_object_to_json_string_ext(Unit, 0), fp);
      fclose(fp);
   */

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
   printf("arm_Character   NAME.json   WEAPON.json\n");
}
