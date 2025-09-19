; cl65 -o test -u __EXEHDR__ -t c64 -C ../c64-asm.cfg Tutorial-08.s && mv test ~/Vice/vicefs/
; LOAD"TEST",9,1

   ; ***** divided by 8; disregard remainder
   ldx #9
   stx $c000

   lda $c000
   ror
   clc
   ror
   clc
   ror
   sta $400


   rts

