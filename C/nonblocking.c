#include <stdio.h>
#include <termios.h>
#include <unistd.h>

int main(void)
{
  struct termios orig_term, raw_term;

  // Get terminal settings and save a copy for later
  tcgetattr(STDIN_FILENO, &orig_term);
  raw_term = orig_term;

  // Turn off echoing and canonical mode
  raw_term.c_lflag &= ~(ECHO | ICANON);

  // Set min character limit and timeout to 0 so read() returns immediately
  // whether there is a character available or not
  raw_term.c_cc[VMIN] = 0;
  raw_term.c_cc[VTIME] = 0;

  // Apply new terminal settings
  tcsetattr(STDIN_FILENO, TCSANOW, &raw_term);

  char ch = 0;
  do {
    int len = read(STDIN_FILENO, &ch, 1);
    if (len == 1) {
      printf("You pressed char 0x%02x : %c\n", ch,
             (ch >= 32 && ch < 127) ? ch : ' ');
    }
  } while (ch != 27);

  // Make sure no characters are left in the input stream as
  // plenty of keys emit ESC sequences, otherwise they'll appear
  // on the command-line after we exit.
  while(read(STDIN_FILENO, &ch, 1)==1);

  // Restore original terminal settings
  tcsetattr(STDIN_FILENO, TCSANOW, &orig_term);
  return 0;
}
