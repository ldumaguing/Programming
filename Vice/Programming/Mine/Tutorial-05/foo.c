#include <stdio.h>

extern void SetColor(void);
extern void SetColor2(char);
extern void SetColor3(char, char);

int main(void) {
    printf("yo");
    // SetColor();
    // SetColor2(13);
    SetColor3(0,1);    // (x, a)
    return 0;
}
