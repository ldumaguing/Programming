; cl65 -o test -u __EXEHDR__ -t c64 -C ../c64-asm.cfg MyMath.s && mv test ~/Vice/vicefs/
; LOAD"TEST",9,1

.include "defs.s"

   ; ************************************************************************************
   ; ***** set numer(ator) = 321; $141
   lda #$b
   sta numer
   lda #0
   sta numer+1

   ; ***** set multi(plier)
   lda #1
   sta multi
   lda #0                    ; keep this as zero
   sta multi+1

   ; ******************** do multiply
   jsr do_multiply

   ; ************************************************************************************
   ; ******************** set numer(ator) = 321; $141
   ;lda #$41
   ;sta numer
   ;lda #1
   ;sta numer+1

   ; ******************* set denom(inator) = 2
   ;lda #15
   ;sta denom
   ;lda #0                    ; keep this as zero
   ;sta denom+1

   ; ******************** do divide
   ;jsr do_divide

   ; ******************** print
   lda numer
   sta LINE1
   sta LINE2
   lda numer+1
   sta LINE1+1

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


