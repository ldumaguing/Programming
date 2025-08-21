; cl65 -o test -u __EXEHDR__ -t c64 -I ~/cc65/include -L ~/cc65/lib -C c64-asm.cfg graphic_tools.s && mv test ~/Vice/vicefs/
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
   lda #$b       ; dark gray
   sta $d020     ; border

   lda #$00
   sta $2
   lda #$80
   sta $3

   lda #4        ; loop 4 times
   sta $4        ; use this address for looping
   lda #$45      ; two colors
   ldy #0
loop2:           ; will loop 4 times
loop1:
   sta ($2),y
   iny
   bne loop1
   inc $3
   dec $4
   bne loop2



main:
   jmp main

; ******************************************************

