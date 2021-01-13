#include <stdio.h>
#include <stdlib.h>
#include <json-c/json.h>
#include <string.h>
#include "Myne/myne.h"

void instructions();
struct json_object *get_JSON(char *);

// *****************************************************************************
int main(int argc, char **argv) {
   if (argc < 3) {
      instructions();
      exit(0);
   }

   struct json_object *Unit;
   Unit = get_JSON(argv[1]);


   struct json_object *NewUnitSetting = handleWeapon(Unit, argv[2]);


   // ****************************** Saving Unit
   struct json_object *Name;
   json_object_object_get_ex(NewUnitSetting, "Name", &Name);
   char filename[100];
   char buff[50];
   sprintf(buff, "%s", json_object_get_string(Name));
   strcpy(filename, buff);
   strcat(filename, ".json");
   FILE *fp;
   fp = fopen(filename, "w");
   fputs(json_object_to_json_string_ext(NewUnitSetting, 0), fp);
   fclose(fp);


   return 0;
}

// *****************************************************************************
struct json_object *get_JSON(char *argv) {
   FILE *fptr;
   char filename[100], c;
   char buff_64K[65536];

   strcpy(filename, argv);
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
void instructions() {
   printf("T_handleWeapon   NAME   \"OtherHand\"\n");
   printf("                        \"BothHands\"\n");
   printf("                        \"toRight\"\n");
   printf("                        \"toLeft\"\n");
}

