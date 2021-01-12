#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void concatStr(char *, char *);

int main(int argc, char *argv[]) {
   char comment[256];

   strcpy(comment, "Hello");
   puts(comment);

   strcat(comment, " world.");
   puts(comment);

   return 0;
}







