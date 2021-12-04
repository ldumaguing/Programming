#include <stdio.h>
#include <termios.h>
#include <unistd.h>

int main(void)
{
  struct termios orig_term, raw_term;
  tcgetattr(STDIN_FILENO, &orig_term);
  raw_term = orig_term;
  raw_term.c_lflag &= ~(ECHO | ICANON);
  raw_term.c_cc[VMIN] = 0;
  raw_term.c_cc[VTIME] = 0;
  tcsetattr(STDIN_FILENO, TCSANOW, &raw_term);








  char ch = 0;
  do {
    int len = read(STDIN_FILENO, &ch, 1);
    if (len == 1) {
      printf("You pressed char 0x%02x : %c\n", ch,
             (ch >= 32 && ch < 127) ? ch : ' ');
    }
  } while (ch != 27);











  while(read(STDIN_FILENO, &ch, 1)==1);
  tcsetattr(STDIN_FILENO, TCSANOW, &orig_term);
  
  return 0;
}
