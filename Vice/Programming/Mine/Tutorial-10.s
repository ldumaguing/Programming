; cl65 -o test -u __EXEHDR__ -t c64 -C ../c64-asm.cfg Tutorial-10.s && mv test ~/Vice/vicefs/
; LOAD"MAIN",9,1

   lda #2
   sta 4
   jsr put_dot

   ; ***** print
   lda 4
   sta 1024
   rts

loop:
   jmp loop

; ***************************************************************************************
put_dot:
   lda 4
   sta 5                     ; save original

   ldx #3
:
   rol 4
   rol 4
   lda 5
   ora 4
   sta 4
   dex
   bne :-

   rts


