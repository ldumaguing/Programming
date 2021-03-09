#include <stdio.h>

int main(void) {
   FILE *pipePULL;
   char readbuf[80];

   /* Create one way pipe line with call to popen() */
   if ((pipePULL = popen("dice 3d6", "r")) == NULL) {
      perror("popen");
      return (1);
   }
   
   fgets(readbuf, 80, pipePULL);
   puts (readbuf);
   
   /* Close the pipes */
   pclose(pipePULL);

   return (0);
}
