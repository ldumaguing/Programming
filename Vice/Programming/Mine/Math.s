; cl65 -o test -u __EXEHDR__ -t c64 -C ../c64-asm.cfg Math.s && mv test ~/Vice/vicefs/
; LOAD"MAIN",9,1

BUFFER = 2                   ; zero page memory address 2
numer = BUFFER               ; location 2 and 3
denom = BUFFER + 4           ; location 4 and 5
count = BUFFER + 6           ; location 6 and 7
result = BUFFER              ; reusing memory 2 and 3

   ; ***** set numer(ator) = 321; $141
   lda #$41
   sta numer
   lda #$01
   sta numer+1

   ; ***** set denom(inator) = 4
   lda #1
   sta denom
   lda #0
   sta denom+1

   jsr do_divide

   ; ***** print
   lda result
   sta 1024
   lda result+1
   sta 1025


   rts

; ***************************************************************************************
do_divide:
   ; ***** if denom is 1, do nothing
   lda denom
   ora #1
   bne do_nothing

zero:
   ; ***** if denom is 0, infinite loop. LOL
   cmp #0
   beq zero

   ; ***** clear count
   lda #0
   sta count
   sta count+1















do_nothing:
   lda #69
   sta result
   sta result+1
   rts


