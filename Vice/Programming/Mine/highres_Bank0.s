; cl65 -o test -u __EXEHDR__ -t c64 -I ~/cc65/include -L ~/cc65/lib -C c64-asm.cfg highres_Bank0.s && mv test ~/Vice/vicefs/
; run

   ; ***** set bitmap mode
   lda $d011
   ora #32
   sta $d011

   ; ***** Bank 0
   lda $dd00
   and #$fc
   ora #3         ; $0000 to $3fff
   sta $dd00

   ; ***** (high nibble; 1) Video Matrix: $400
   ; ***** (low nibble; 8)  Use upper half
   lda #$18
   sta $d018

   ; ******************************************************************************** Start drawing
   lda #$01       ; black & white
   sta $400       ; a cell with the two colors
   lda #$23
   sta $401
   lda #$45
   sta $402
   lda #$67
   sta $403



   ldx #$0        ; index for img array
   ldy #8         ; number of bytes to read from
loop1:
   lda img,x
   sta $2000,x
   sta $2008,x
   sta $2010,x
   sta $2018,x
   inx
   dey
   bne loop1

;loop:
;   jmp loop

   rts

img: .byte $28, $28, $ee, 0, $ee, $28, $28, 0



