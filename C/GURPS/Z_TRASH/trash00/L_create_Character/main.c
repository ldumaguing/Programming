#include <stdio.h>
#include <stdlib.h>
#include <json-c/json.h>
#include <string.h>
#include "Myne/myne.h"

void instructions();
struct json_object *get_Unit();

// *****************************************************************************
int main(int argc, char **argv) {
   struct json_object *Unit;

   switch (argc) {
      case 2:
         Unit = get_Unit();
         two(Unit, argv[1]);
         set_secondaries(Unit);
         // set_damage(Unit);
         set_SpeedMoveDodge(Unit);
         set_Addendum(Unit);
         break;
      case 6:
         Unit = get_Unit();
         two(Unit, argv[1]);
         six(Unit, argv);
         set_secondaries(Unit);
         // set_damage(Unit);
         set_SpeedMoveDodge(Unit);
         set_Addendum(Unit);
         break;
      case 8:
         Unit = get_Unit();
         two(Unit, argv[1]);
         six(Unit, argv);
         set_secondaries(Unit);
         // set_damage(Unit);
         set_SpeedMoveDodge(Unit);
         set_Addendum(Unit);
         eight(Unit, argv);
         break;
      case 10:
         Unit = get_Unit();
         two(Unit, argv[1]);
         six(Unit, argv);
         set_secondaries(Unit);
         // set_damage(Unit);
         set_SpeedMoveDodge(Unit);
         ten(Unit, argv);
         set_Addendum(Unit);
         break;
      case 12:
         Unit = get_Unit();
         two(Unit, argv[1]);
         six(Unit, argv);
         set_secondaries(Unit);
         // set_damage(Unit);
         set_SpeedMoveDodge(Unit);
         ten(Unit, argv);
         set_Addendum(Unit);
         twelve(Unit, argv);
         break;
      default:
         instructions();
         exit(0);
   }


   // ********** Save Unit
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
   printf("cat Human.json | L_create_Character   NAME\n");
   printf("   or\n");
   printf("cat Human.json | L_create_Character   NAME   ST IQ DX HT\n");
   printf("   or\n");
   printf("cat Human.json | L_create_Character   NAME   ST IQ DX HT   Spd Mov\n");
   printf("   or\n");
   printf("cat Human.json | L_create_Character   NAME   ST IQ DX HT   HP Per Will FP\n");
   printf("   or\n");
   printf("cat Human.json | L_create_Character   NAME   ST IQ DX HT   HP Per Will FP   Spd Mov\n");
}

