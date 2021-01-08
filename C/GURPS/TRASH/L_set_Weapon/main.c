#include <stdio.h>
#include <stdlib.h>
#include <json-c/json.h>
#include <string.h>
#include "Myne/myne.h"

void instructions();
struct json_object *get_Unit();

// *****************************************************************************
int main(int argc, char **argv) {
   if (argc < 2) {
      instructions();
      exit(0);
   }

   struct json_object *Unit;
   Unit = get_Unit();


   struct json_object *NewUnitSetting = setWeapon(Unit, argv[1]);


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
struct json_object *get_Unit() {
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

   return json_tokener_parse(buff);
}

// *****************************************************************************
void instructions() {
   printf("cat NAME.json | L_set_Weapon   \"OtherHand\"\n");
   printf("                               \"BothHands\"\n");
   printf("                               \"toRight\"\n");
   printf("                               \"toLeft\"\n");
}

