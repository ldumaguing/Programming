; cl65 -o test -u __EXEHDR__ -t c64 -I ~/cc65/include -L ~/cc65/lib -C c64-asm.cfg graphic_tools.s && mv test ~/Vice/vicefs/ && rm graphic_tools.o
; run

   ; ***** turn off BASIC
   lda $1
   and #$fc
   ora #2
   sta $1

   ; ***** turn on bitmap
   lda $d011
   ora #32
   sta $d011

   ; ***** Bank 2
   lda $dd00
   and #$fc
   ora #1         ; $8000 to $bfff
   sta $dd00

   ; ***** (high nibble; 0) Video Matrix: 0
   ; ***** (low nibble; 8)  Use upper half
   lda #$8
   sta $d018

   ; ******************************************************************************** Start drawing
   lda #$b       ; dark gray
   sta $d020     ; border


   lda #$10      ; white & black
   ldx #0
loop2:
   sta $8000,x
   sta $8100,x
   sta $8200,x
   sta $8300,x
   inx
   bne loop2


   lda #$05      ; 0 refers to the low nibble
   ldx #0
loop1:
   sta $a000,x
   inx
   bne loop1


main:
   jmp main

