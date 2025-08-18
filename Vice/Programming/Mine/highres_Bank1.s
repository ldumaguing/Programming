; cl65 -o test -u __EXEHDR__ -t c64 -I ~/cc65/include -L ~/cc65/lib -C c64-asm.cfg highres_Bank1.s && mv test ~/Vice/vicefs/
; run

   ; ***** set bitmap mode
   lda $d011
   ora #32
   sta $d011

   ; ***** Bank 1
   lda $dd00
   and #$fc
   ora #2         ; $4000 to $7fff
   sta $dd00

   ; ***** (high nibble; 1) Video Matrix: $400
   ; ***** (low nibble; 8)  Use upper half
   lda #$18
   sta $d018

   ; ******************************************************************************** Start drawing
   lda #$01       ; black & white
   sta $4400      ; a cell with the two colors.  (Bank 1 value) plus (Video Matrix location)
   lda #$23
   sta $4401
   lda #$45
   sta $4402
   lda #$67
   sta $4403

   ldx #$0        ; index for img array
   ldy #8         ; number of bytes to read from
loop1:
   lda img,x
   sta $6000,x    ; (Bank 1 value) plus (Upper half (usually $2000))
   sta $6008,x
   sta $6010,x
   sta $6018,x
   inx
   dey
   bne loop1

   rts

img: .byte $28, $28, $ee, 0, $ee, $28, $28, 0




