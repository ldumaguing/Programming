#include <stdio.h>
#include <stdlib.h>
#include <json-c/json.h>
#include <string.h>
#include <malloc.h>
#include "Myne/myne.h"

void instructions();

// *****************************************************************************
int main(int argc, char *argv[]) {
   if (argc < 3) {
      instructions();
      exit(0);
   }

   struct json_object *Player;
   struct json_object *Target;
   Player = get_Unit(argv[1]);
   Target = get_Unit(argv[2]);


   Attack(Player, Target, argv, argc);



 /* 
   // ********** Save Unit
   char filename[100];
  
   strcpy(filename, argv[1]);
   strcat(filename, "-instant.json");
   FILE *fp;

   fp = fopen(filename, "w");
   fputs(json_object_to_json_string_ext(Player, 0), fp);
   fclose(fp);


   */
//  printf("%s\n", json_object_get_string(Player));
   return 0;
}

// *******************************************************************************
void instructions() {
   printf("M_Attack   PLAYER   TARGET\n");
   printf("M_Attack   PLAYER   TARGET   offhand\n");
   printf("M_Attack   PLAYER   TARGET   Punch\n");
   printf("                             Kick\n");
   printf("                             Swing\n");
   printf("                             Swing1\n");
   printf("                             Thrust\n");
   printf("                             Swing    offhand\n");
   printf("                             Swing1   offhand\n");
   printf("                             Thrust   offhand\n");
}



