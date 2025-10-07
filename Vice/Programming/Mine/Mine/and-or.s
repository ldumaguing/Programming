; cl65 -o test -u __EXEHDR__ -t c64 -I ~/cc65/include -L ~/cc65/lib -C c64-asm.cfg and-or.s && mv test ~/Vice/vicefs/
; run

   lda $dd00
   sta $400

   lda $dd00
   ora #2
   sta $401

   lda $dd00
   and #$fc
   sta $402


   rts



