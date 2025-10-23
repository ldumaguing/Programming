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


