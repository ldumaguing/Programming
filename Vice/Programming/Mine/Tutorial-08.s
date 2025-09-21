; cl65 -o test -u __EXEHDR__ -t c64 -C ../c64-asm.cfg Tutorial-08.s
; && mv test ~/Vice/vicefs/
; LOAD"TEST",9,1

   ldx #159
   ldy #75
   jsr put_dot

   rts

; ***************************************************************************************
put_dot:
   stx dot_X
   sty dot_Y

   lda dot_X
   and #3
   sta dot_X+2       ; store remainder

   ; divide X by 4
   lsr dot_X
   lsr dot_X

   ; multiply X by 8
   clc
   asl dot_X
   asl dot_X
   asl dot_X
   bcc cont
   inc dot_X+1

cont:
   ; ***** let's deal with Y
   lda dot_Y
   and #7
   sta dot_Y+2       ; store remainder

   ; divide Y by 8
   lsr dot_Y
   lsr dot_Y
   lsr dot_Y


   lda dot_Y
   sta 1024
   lda dot_Y+1
   sta 1025
   lda dot_Y+2
   sta 1026

   rts

dot_X: .byte 0, 0, 0
dot_Y: .byte 0, 0, 0




