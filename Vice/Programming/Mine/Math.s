; cl65 -o test -u __EXEHDR__ -t c64 -C ../c64-asm.cfg Math.s && mv test ~/Vice/vicefs/
; LOAD"MAIN",9,1

BUFFER = 2                   ; zero page memory address 2

   ; ***** set X = 321; $141
   lda #$41
   sta BUFFER
   lda #$01
   sta BUFFER+1

   ; ***** set Y = 4
   lda #0
   sta BUFFER+2

   ; ***** execute
   jsr divide

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
   ; ***** counter is +3; this is the result
   ; ***** no remainder stored
divide:
   lda BUFFER+2
   cmp #1
   beq do_nothing
zero:
   cmp #0
   beq zero                  ; divide by zero?  Infinite loop.

   lda #0
   sta BUFFER+3              ; clear counter

   clc
   ldy BUFFER+2
:
   dec BUFFER
   beq :+                   ; branch to aaa when BUFFER becomes 0
   dey                       ; loop Y times
   bne :-
   inc BUFFER+3              ; counter++
   ldy BUFFER+2
   jmp :-
:
   dec BUFFER+1              ; decrement high byte
   bmi done
   lda #$ff
   sta BUFFER
   jmp :--
done:
   inc BUFFER+3
   lda BUFFER+3
   sta BUFFER
do_nothing:
   rts


