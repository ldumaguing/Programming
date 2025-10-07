.include "defs.s"

   lda #$1
   sta BORDER
   lda #$2
   sta BACKGROUND

main:
   jmp main
