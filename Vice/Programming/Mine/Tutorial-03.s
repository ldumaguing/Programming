; cl65 -o test -u __EXEHDR__ -t c64 -I ~/cc65/include -L ~/cc65/lib -C c64-asm.cfg Tutorial-03.s && mv test ~/Vice/vicefs/ && rm *.o
; cl65 -o test -u __EXEHDR__ -t c64 -C c64-asm.cfg Tutorial-03.s && mv test ~/Vice/vicefs/ && rm *.o
; run

   Bank2 = $8000
   two_colors = $10
   draw_area = Bank2 + $2000
   byte_pattern = $0

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
   ora #1              ; $8000 to $bfff
   sta $dd00

   ; ***** (high nibble; 0) Video Matrix: 0
   ; ***** (low nibble; 8)  Use upper half. Add $2000 to Bank value.
   lda #$8
   sta $d018

   ; ******************************************************************************** Default two color palette
   lda #$b
   sta $d020           ; border color

   ; ***** point to Bank 2 using the first byte of the within the Zero Page
   lda #<Bank2
   sta $2
   lda #>Bank2
   sta $3

two_color_palette:
   lda #3              ; loop a number of times
   sta $4              ; use this address for looping
   lda #two_colors
   ldy #0
@loop2:                ; will loop 4 times
   @loop1:
      sta ($2),y
      iny
      bne @loop1
   inc $3
   dec $4
   bne @loop2

   lda #<Bank2
   sta $2
   lda #>Bank2 + 3
   sta $3
   lda #two_colors
   ldy #231
@loop3:
   sta ($2), y
   dey
   bne @loop3
   sta ($2), y

   ; ********************************************************************************
zero_out_the_bytes:
   lda #<draw_area
   sta $2
   lda #>draw_area
   sta $3

   lda #31             ; loop a number of times
   sta $4              ; use this address for looping
   lda #byte_pattern
@loop2:
   ldy #0
   @loop1:
      sta ($2),y
      iny
      bne @loop1
   inc $3
   dec $4
   bne @loop2

   lda #byte_pattern
   ldy #63
@loop3:
   sta ($2),y
   dey
   bne @loop3
   sta ($2),y

   ; ******************************************************************************** put a pixel
   lda #<draw_area
   sta $2
   lda #>draw_area
   sta $3

   lda #$1
   ldy #0
   inc $3
   inc $3
   inc $3
   sta ($2),y
   iny
   sta ($2),y
   iny
   sta ($2),y
   iny
   sta ($2),y
   iny
   sta ($2),y
   iny
   sta ($2),y
   iny
   sta ($2),y
   iny
   sta ($2),y
   iny
   sta ($2),y
   iny
   sta ($2),y
   iny
   sta ($2),y
   iny
   sta ($2),y
   iny
   sta ($2),y

main:
   jmp main

; ******************************************************


;. ........
;1 00111111 = 319

;319/8 = 39 r7

;r = 319 and 7 = 7th bit from the left



;shift right 3 time
;.........
;000100111 = 39

