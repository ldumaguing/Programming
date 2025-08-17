; cl65 -o test -u __EXEHDR__ -t c64 -I ~/cc65/include -L ~/cc65/lib -C c64-asm.cfg highres_Bank1.s && mv test ~/Vice/vicefs/
; run

   ; ***** set bitmap mode
   lda $d011
   ora #32
   sta $d011

   ; ***** Bank 1
   lda $dd00
   ora #2         ; $4000 to $7fff
   sta $dd00

   ; ***** (high nibble; 2) Video Matrix: $800; refers to cell
   ; ***** (low nibble; 8)  Use upper half
   lda #$28
   sta $d018

   ; ******************************************************************************** Start drawing
   lda #$67
   sta $800       ; a cell with the two colors

   ldx #$0        ; index for img array
   ldy #8         ; number of bytes to read from
loop1:
   lda img,x
   sta $2000,x
   inx
   dey
   bne loop1

















loop:
   jmp loop

img: .byte $28, $28, $ee, 0, $ee, $28, $28, 0



