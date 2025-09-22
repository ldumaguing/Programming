; cl65 -o test -u __EXEHDR__ -t c64 -C ../c64-asm.cfg Tutorial-08.s
; && mv test ~/Vice/vicefs/
; LOAD"TEST",9,1

   ldx #75
   ldy #75
   jsr put_dot

   stx 1024
   sty 1025

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
   bcc :+
   asl Y1+1
   inc Y1+1
   jmp :++
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
   bcc :+
   asl Y2+1
   inc Y2+1
   jmp :++
:
   asl Y2+1
:
   dex
   bne loopB

   lda Y2
   lda Y2+1

   ; ***** dot_Y = Y1 + Y2
   clc
   lda Y1
   adc Y2
   sta dot_Y
   lda Y1+1
   adc Y2+1
   sta dot_Y+1
   ; ***** dot_Y += remainder
   clc
   lda dot_Y
   adc dot_Y+2
   sta dot_Y
   lda dot_Y+1
   adc #0
   sta dot_Y+1

   ; ***** dot_X + dot_Y and store in registers x and y
   clc
   lda dot_X
   adc dot_Y
   tax
   lda dot_X+1
   adc dot_Y+1
   tay

   rts

dot_X: .byte 0, 0, 0
dot_Y: .byte 0, 0, 0

Y1: .byte 0, 0
Y2: .byte 0, 0





