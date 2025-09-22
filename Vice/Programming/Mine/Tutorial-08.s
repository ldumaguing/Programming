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
   bcc :+
   inc dot_X+1

:
   ; *************** let's deal with Y
   lda dot_Y
   and #7
   sta dot_Y+2       ; store remainder

   ; divide Y by 8
   lsr dot_Y
   lsr dot_Y
   lsr dot_Y

   ; ********** multiply Y by 320
   ; ***** multiply by 256
   lda dot_Y
   sta Y1
   clc
   ldx #8            ; loop times
loopA:
   asl Y1
   bcc :>
   asl Y1+1
   inc Y1+1
   jmp :>>
:
   asl Y1+1
:
   dex
   bne loopA

   lda Y1
   lda Y1+1

   ; ***** multiply by 64
   lda dot_Y
   sta Y2
   clc
   ldx #6            ; loop times
loopB:
   asl Y2
   bcc :>
   asl Y2+1
   inc Y2+1
   jmp :>>
:
   asl Y2+1
:
   dex
   bne loopB

   lda Y2
   lda Y2+1




   lda Y1
   sta 1024
   lda Y1+1
   sta 1025


   lda Y2
   sta 1064
   lda Y2+1
   sta 1065



   rts

dot_X: .byte 0, 0, 0
dot_Y: .byte 0, 0, 0

Y1: .byte 0, 0
Y2: .byte 0, 0





