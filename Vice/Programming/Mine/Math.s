; cl65 -o test -u __EXEHDR__ -t c64 -C ../c64-asm.cfg Math.s && mv test ~/Vice/vicefs/
; LOAD"MAIN",9,1

BUFFER = 2                   ; zero page memory address 2
numer = BUFFER               ; location 2 and 3
denom = BUFFER + 4           ; location 4 and 5

LINE1 = 1024

   ; ***** set numer(ator) = 321; $141
   lda #$41
   sta numer
   lda #$01
   sta numer+1

   ; ***** set denom(inator) = 2
   lda #100
   sta denom
   lda #0
   sta denom+1

   ; ***** dividing
   lda denom
   adc denom+1
zero: beq zero               ; if divided by 0, infinate loop

   lda denom
   and #$fe
   beq :+                    ; if zero, continue test
   jsr do_divide
   jmp :++
:
   lda denom+1
   and #$ff
   beq do_nothing

:
   ; ***** print
   lda numer
   sta LINE1
   lda numer+1
   sta LINE1+1

do_nothing:
   rts

; ***************************************************************************************
do_divide:
   ldx #0
   sec
:
   inx
   lda numer
   sbc denom
   sta numer
   lda numer+1
   sbc denom+1
   sta numer+1
   bpl :-                    ; if positive, loop

   dex
   txa
   sta numer

   rts


