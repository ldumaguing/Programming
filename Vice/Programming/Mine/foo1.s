; cl65 -o test -u __EXEHDR__ -t c64 -I ~/cc65/include -L ~/cc65/lib -C c64-asm.cfg foo1.s && mv test ~/Vice/vicefs/ && rm *.o
; cl65 -o test -u __EXEHDR__ -t c64 -C c64-asm.cfg highres_Bank2.s && mv test ~/Vice/vicefs/
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
   ; ***** (low nibble; 8)  Use upper half. Add $2000 to Bank value.
   lda #$8
   sta $d018

   ; ******************************************************************************** Start drawing
   lda #$b
   sta $d020     ; border color

   ; ***** point to Bank 2 using the first byte of the within the Zero Page
   lda #$00
   sta $2
   lda #$80
   sta $3

   lda #3        ; loop a number of times
   sta $4        ; use this address for looping
   lda #$89      ; two colors
   ldy #0
loop2:           ; will loop 4 times
loop1:
   sta ($2),y
   iny
   bne loop1
   inc $3
   dec $4
   bne loop2


   lda #$01
   sta $2
   lda #$83
   sta $3
   lda #$98
   ldy #0
   sta ($2),y












main:
   jmp main

; ******************************************************

