; cl65 -o test -u __EXEHDR__ -t c64 -C ../c64-asm.cfg Math-Line.s && mv test ~/Vice/vicefs/
; LOAD"TEST",9,1

.include "defs.s"

xA = BUFFER
yA = BUFFER+2
xB = BUFFER+4
yB = BUFFER+6

deltaX = BUFFER+8
deltaY = BUFFER+10

   ; ***** set Point A
   lda #45
   sta xA
   lda #46
   sta yA
   lda #0
   sta xA+1
   sta yA+1

   ; ***** set Point B
   lda #40
   sta xB
   lda #48
   sta yB
   lda #0
   sta xB+1
   sta yB+1

   ; ***** clear deltas
   lda #0
   sta deltaX
   sta deltaX+1
   sta deltaY
   sta deltaY+1

   ; ***** define deltaX
   sec
   lda xB
   sbc xA
   sta deltaX
   lda xB+1
   sbc xA+1
   sta deltaX+1

   ; ***** define deltaY
   sec
   lda yB
   sbc yA
   sta deltaY
   lda yB+1
   sbc yA+1
   sta deltaY+1

   ; ***** print
   lda xA
   sta LINE1
   lda yA
   sta LINE1+1

   lda xB
   sta LINE2
   lda yB
   sta LINE2+1

   lda deltaX
   sta LINE3
   lda deltaX+1
   sta LINE3+1

   rts

; ***************************************************************************************
; ***************************************************************************************
do_multiply:
   lda multi
   adc multi+1
   bne :+
   lda #0                    ; if multiply by 0, set clear numer
   sta numer
   sta numer+1
   rts
:
   clc
   lda multi
   adc multi+1
   cmp #1                    ; if multiply by 1, return
   bne :+
   rts
:
   lda #0
   sta summy
   sta summy+1

multiply_loop:
   clc
   lda summy
   adc numer
   sta summy
   lda summy+1
   adc numer+1
   sta summy+1

   sec
   lda multi
   sbc #1
   sta multi
   lda multi+1
   sbc #0
   sta multi+1
   beq multiply_loop

   ; ***** correction
   sec
   lda summy
   sbc numer
   sta numer
   lda summy+1
   sbc numer+1
   sta numer+1

   rts

; ***************************************************************************************
; ***************************************************************************************
do_divide:
   lda denom
   adc denom+1
zero: beq zero               ; if divided by 0, infinate loop. LOL

   lda denom
   and #$fe
   beq return

   lda #$ff
   sta count
   sta count+1
:
   clc
   lda count
   adc #1
   sta count
   lda count+1
   adc #0
   sta count+1

   sec
   lda numer
   sbc denom
   sta numer
   lda numer+1
   sbc denom+1
   sta numer+1
   bpl :-                    ; if positive, loop

   lda count
   sta numer
   lda count+1
   sta numer+1

return:
   rts


