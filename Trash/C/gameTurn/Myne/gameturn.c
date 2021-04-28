#include <stdio.h>
#include <stdlib.h>

// *******************************************************************************
int increment() {
   FILE *fp = fopen("gameturn.log", "r+");
   if (fp == NULL) {
      fputs("Cannot open gameturn.log.\n", stderr);
      return EXIT_FAILURE;
   }

   char buff[80];
   if (fgets(buff, 80, fp) == NULL) {
      fputs("Cannot read gameturn.log.\n", stderr);
      if (fclose(fp) == EOF) fputs("Cannot close file.", stderr);
      return EXIT_FAILURE;
   };

   int X = atoi(buff);
   X++;

   sprintf(buff, "%d", X);
   rewind(fp);
   if (fputs(buff, fp) == EOF) {
      fputs("Cannot write gameturn.log.\n", stderr);
      return EXIT_FAILURE;
   } else {
      printf("%d\n", X);
   }

   if (fclose(fp) == EOF) {
      fputs("Cannot close file.", stderr);
      return EXIT_FAILURE;
   }

   return EXIT_SUCCESS;
}

// *******************************************************************************
int current() {
   FILE *fp = fopen("gameturn.log", "r");
   if (fp == NULL) {
      fputs("Cannot open gameturn.log.\n", stderr);
      return EXIT_FAILURE;
   }

   char buff[80];
   if (fgets(buff, 80, fp) == NULL) {
      fputs("Cannot read gameturn.log.\n", stderr);
      if (fclose(fp) == EOF) fputs("Cannot close file.", stderr);
      return EXIT_FAILURE;
   };

   printf("%s", buff);

   return EXIT_SUCCESS;
}

// *******************************************************************************
int init() {
   FILE *fp = fopen("gameturn.log", "w");
   if (fp == NULL) {
      fputs("Cannot open gameturn.log.\n", stderr);
      return EXIT_FAILURE;
   }

   if (fputs("1\n", fp) == EOF) {
      fputs("Cannot write gameturn.log.\n", stderr);
      return EXIT_FAILURE;
   } else {
      puts("1");
   }

   if (fclose(fp) == EOF) {
      fputs("Cannot close file.", stderr);
      return EXIT_FAILURE;
   }

   return EXIT_SUCCESS;
}
