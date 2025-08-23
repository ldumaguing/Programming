; cl65 -o test -u __EXEHDR__ -t c64 -I ~/cc65/include -L ~/cc65/lib -C c64-asm.cfg Tutorial-04.s && mv test ~/Vice/vicefs/ && rm *.o
; cl65 -o test -u __EXEHDR__ -t c64 -C c64-asm.cfg Tutorial-04.s && mv test ~/Vice/vicefs/ && rm *.o
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
   lda #12
   sta $d021           ; background color (defines one color during multicolor mode. Not used during hires)

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

   ; ***** multicolor mode
   lda $d016
   ora #$10
   sta $d016

   ; 11 10 01 00
   ldy #0
   lda #$e4
   sta ($2),y
   iny
   sta ($2),y
   iny
   sta ($2),y

   iny
   iny
   iny
   iny
   iny
   iny
   ; 11 10 01 00
   lda #$e4
   sta ($2),y
   iny
   sta ($2),y
   iny
   sta ($2),y

   lda #<Bank2
   sta $2
   lda #>Bank2
   sta $3
   lda #$92     ; screen memory (defines two colors)
   ldy #0
   sta ($2),y

   lda #5       ; green
   sta $d800    ; color memory (defines one color. Not used during hires)


main:
   jmp main

; ******************************************************
;The color called for by the bit-pair 00 (color 0) will be the
;background color, which is stored in the background color
;register at 53281.

;The color called for by the bit-pair 01 (color 1) will be the color
;stored in the left four bits (bits 4-7) of the corresponding byte in
;screen memory.

;The color called for by the bit-pair 10 (color 2) will be the color
;stored in the right four bits (bits 0-3) of the corresponding byte in
;screen memory.

;The color called for by the bit-pair 11 (color 3) will be the color
;stored in the right four bits (bits 0-3) of the corresponding byte in
;color memory.














;. ........
;1 00111111 = 319

;319/8 = 39 r7

;r = 319 and 7 = 7th bit from the left



;shift right 3 time
;.........
;000100111 = 39

