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

   ; ***** (high nibble; 1) Video Matrix: $400
   ; ***** (low nibble; 8)  Use upper half
   lda #$18
   sta $d018

   ; ******************************************************************************** Start drawing
   lda #$01       ; black & white
   sta $8400      ; a cell with the two colors.  (Bank 2 value) plus (Video Matrix location)
   lda #$23
   sta $8401
   lda #$45
   sta $8402
   lda #$67
   sta $8403

   ldx #$0        ; index for img array
   ldy #8         ; number of bytes to read from
loop1:
   lda img,x
   sta $a000,x    ; (Bank 2 value) plus (Upper half (usually $2000))
   sta $a008,x
   sta $a010,x
   sta $a018,x
   inx
   dey
   bne loop1

main:
   jmp main

img: .byte $28, $28, $ee, 0, $ee, $28, $28, 0




