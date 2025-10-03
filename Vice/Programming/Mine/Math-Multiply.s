; cl65 -o test -u __EXEHDR__ -t c64 -C ../c64-asm.cfg Math-Multiply.s && mv test ~/Vice/vicefs/
; LOAD"MAIN",9,1

BUFFER = 2                   ; zero page memory address 2
numer = BUFFER               ; location 2 and 3
multi = BUFFER+4             ; location 4 and 5
summy = BUFFER+6             ; location 6 and 7

LINE1 = 1024

   ; ***** set numer(ator) = 321; $141
   lda #$d
   sta numer
   lda #0
   sta numer+1

   ; ***** set multi(plier)
   lda #5
   sta multi
   lda #0                    ; keep this as zero
   sta multi+1

   ; ***** pre-multiply
   lda #0
   sta summy
   sta summy+1
   jsr do_multiply

   ; ***** print
   lda numer
   sta LINE1
   lda numer+1
   sta LINE1+1

   rts

; ***************************************************************************************
do_multiply:
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


