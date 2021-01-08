#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void foo(char [][80]);

int main(int argc, char *argv[]) {
   char names[][80] = {"Moe", "Curly", "Larry", "Shemp"};

   foo(names);

   puts(names[0]);

   return 0;
}


void foo(char n[][80]) {

   puts(n[0]);

}
