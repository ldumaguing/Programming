#include <stdio.h>

int main (int argc, char *argv[]) {
   printf(
      "Access-Control-Allow-Origin: *\n"
      "Content-Type: appliction/json\n\n"
      "[[\"A\",\"B\",\"C\"],\n"
      "[1,2,3],\n"
      "{\"name\":\"fish\"},\n"
      "[1,2,3,4]"
      "]\n"
   );
}
