; cl65 -o test -u __EXEHDR__ -t c64 -C ../c64-asm.cfg Tutorial-09.s
; && mv test ~/Vice/vicefs/
; LOAD"TEST",9,1
; PRINT PEEK(49152)

   ; ***** define address $c000
   lda #0
   sta 2
   lda #$c0
   sta 3

   lda #13
   ldy #0
   sta (2),y         ; store 13 in memory $c000 (49152)

   rts




