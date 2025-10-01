; cl65 -o test -u __EXEHDR__ -t c64 -C ../c64-asm.cfg Math.s && mv test ~/Vice/vicefs/
; LOAD"MAIN",9,1

BUFFER = 2                   ; zero page memory address 2
numer = BUFFER               ; location 2 and 3
denom = BUFFER+4             ; location 4 and 5
count = BUFFER+6             ; location 6 and 7

LINE1 = 1024

   ; ***** set numer(ator) = 321; $141
   lda #$ff
   sta numer
   lda #$7f
   sta numer+1

   ; ***** set denom(inator) = 2
   lda #22
   sta denom
   lda #0                    ; keep this as zero
   sta denom+1

   ; ***** pre-dividing
   lda denom
   adc denom+1
zero: beq zero               ; if divided by 0, infinate loop. LOL

   lda denom
   and #$fe
   beq :+
   jsr do_divide

:
   ; ***** print
   lda numer
   sta LINE1
   lda numer+1
   sta LINE1+1

   rts

; ***************************************************************************************
do_divide:
   lda #0
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

   ; ***** subtract 1 from count for correction
   sec
   lda count
   sbc #1
   sta count
   lda count+1
   sbc #0
   sta count+1

   lda count
   sta numer
   lda count+1
   sta numer+1

   rts


