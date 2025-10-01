; cl65 -o test -u __EXEHDR__ -t c64 -C ../c64-asm.cfg Math-Multiply.s && mv test ~/Vice/vicefs/
; LOAD"MAIN",9,1

BUFFER = 2                   ; zero page memory address 2
numer = BUFFER               ; location 2 and 3
multi = BUFFER+4             ; location 4 and 5
count = BUFFER+6             ; location 6 and 7

LINE1 = 1024

   ; ***** set numer(ator) = 321; $141
   lda #$f
   sta numer
   lda #0
   sta numer+1

   ; ***** set multi(plier)
   lda #3
   sta multi
   lda #0                    ; keep this as zero
   sta multi+1

   ; ***** pre-multiply
   jsr do_multiply

   ; ***** print
   ;lda numer
   ;sta LINE1
   ;lda numer+1
   ;sta LINE1+1

   rts

; ***************************************************************************************
do_multiply:
   ldx #$ff
aaa:
   inx
   sec
   lda multi
   sbc #1
   sta multi
   lda multi+1
   sbc #0
   sta multi+1
   beq aaa

   lda multi
   sta LINE1
   lda multi+1
   sta LINE1+1
   txa
   sta LINE1+2






   rts


