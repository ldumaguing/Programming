; cl65 -o test -u __EXEHDR__ -t c64 -C ../c64-asm.cfg Math-Line.s && mv test ~/Vice/vicefs/
; LOAD"TEST",9,1

.include "defs.s"

x1 = BUFFER
y1 = BUFFER+2
x2 = BUFFER+4
y2 = BUFFER+6

   ; ***** set Point A
   lda #45
   sta x1
   lda #46
   sta y1
   lda #0
   sta x1+1
   sta y1+1

   ; ***** set Point B
   lda #47
   sta x2
   lda #48
   sta y2
   lda #0
   sta x2+1
   sta y2+1

   ; ***** print
   lda x1
   sta LINE1
   lda y1
   sta LINE1+1

   lda x2
   sta LINE2
   lda y2
   sta LINE2+1

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


