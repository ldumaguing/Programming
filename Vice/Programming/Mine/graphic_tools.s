; cl65 -o test -u __EXEHDR__ -t c64 -I ~/cc65/include -L ~/cc65/lib -C c64-asm.cfg graphic_tools.s && mv test ~/Vice/vicefs/
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

   lda #$00
   sta $2
   lda #$80
   sta $3

   lda #$10      ; white & black
   ldy #0
loop1:
   sta ($2),y
   iny
   bne loop1

   inc $3
   inc $3
loop2:
   sta ($2),y
   iny
   bne loop2

main:
   jmp main

; ******************************************************

