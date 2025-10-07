; cl65 -o test -u __EXEHDR__ -t c64 -C ../c64-asm.cfg Tutorial-11.s && mv test ~/Vice/vicefs/

.include "defs.s"

   lda #1
   pha
   lda #2
   pha
   lda #3
   pha
   lda #4
   pha

   pla
   sta LINE1
   pla
   sta LINE1+1
   pla
   sta LINE1+2
   pla
   sta LINE1+3



   rts


