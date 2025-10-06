do_quad_I:
   lda delta_X
   cmp delta_Y
   bpl :+
   ; X < Y
   ldx #158
   ldy #1
   rts
:
   ; X >= Y
   ldx #159
   ldy #1

   rts






