#include <stdio.h>
#include <stdlib.h>
#include <dirent.h>
#include <string.h>
#include "myne/myne.h"

int main(int argc, char *argv[]) {
   struct dirent *de;

   DIR *dr = opendir("Units");

   if (dr == NULL) {
      printf("Could not open current directory");
      return 0;
   }

   while ((de = readdir(dr)) != NULL) {
      if (strstr(de->d_name, "json") != NULL)
         printPHP(de->d_name, argv[1]);
   }

   closedir(dr);
   return 0;
}
