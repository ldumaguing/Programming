; cl65 -o test -u __EXEHDR__ -t c64 -C ../c64-asm.cfg Math.s && mv test ~/Vice/vicefs/
; LOAD"MAIN",9,1

BUFFER = 2                   ; zero page memory address 2

   ; ***** set X = 321; $141
   lda #$41
   sta BUFFER
   lda #$01
   sta BUFFER+1

   ; ***** set Y = 3
   lda #3
   sta BUFFER+2

   ; ***** print
   lda BUFFER
   sta 1024
   lda BUFFER+1
   sta 1025
   lda BUFFER+2
   sta 1026

   rts


; ***************************************************************************************
   ; ***** X / Y
   ; ***** X is 2-byte integer; +0, +1
   ; ***** Y is 1-byte integer; +2
   ; ***** store result in registers +0 & +1; low/high byte, respectively
   ; ***** counter is +3
divide:
   lda #0
   sta BUFFER+3              ; clear counter

   ldy BUFFER+2
loop:
   dec BUFFER
   beq aaa
   dey
   bne loop
aaa:
   dec BUFFER+1
   lda #$ff
   sta BUFFER



















   rts


