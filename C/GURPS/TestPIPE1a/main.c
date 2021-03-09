#include <stdio.h>

int main(void) {
   FILE *pipein_fp;
   char readbuf[80];

   /* Create one way pipe line with call to popen() */
   if ((pipein_fp = popen("echo $PATH", "r")) == NULL) {
      perror("popen");
      return (1);
   }
   
   fgets(readbuf, 80, pipein_fp);
   puts (readbuf);
   
   /* Close the pipes */
   pclose(pipein_fp);

   return (0);
}
