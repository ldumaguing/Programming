   ; ****************************************************** clear background with a color
fill_background:
   lda #BROWN
   sta BACKGROUND

   ldx #0
   lda #0
@loop:
   sta $a000,x       ; $8000 + $2000
   sta $a100,x
   sta $a200,x
   sta $a300,x
   sta $a400,x
   sta $a500,x
   sta $a600,x
   sta $a700,x
   sta $a800,x
   sta $a900,x
   sta $aa00,x
   sta $ab00,x
   sta $ac00,x
   sta $ad00,x
   sta $ae00,x
   sta $af00,x

   sta $b000,x
   sta $b100,x
   sta $b200,x
   sta $b300,x
   sta $b400,x
   sta $b500,x
   sta $b600,x
   sta $b700,x
   sta $b800,x
   sta $b900,x
   sta $ba00,x
   sta $bb00,x
   sta $bc00,x
   sta $bd00,x
   sta $be00,x
   sta $bf00,x
   inx
   bne @loop

   rts
