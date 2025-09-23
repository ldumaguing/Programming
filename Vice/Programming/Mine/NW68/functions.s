   ; ****************************************************** clear background with a color
fill_background:
   stx BACKGROUND
   sty BORDER

   lda #<SCREEN_MEM
   sta 2
   lda #>SCREEN_MEM
   sta 3

   ldy #0
   lda #0
   ldx #3
loop:
:
   sta (2),y
   iny
   bne :-

   rts
