do_quad_I:
   lda delta_X
   cmp delta_Y
   bpl :+
   ; ***** X < Y
   ldx #158
   ldy #1
   rts
:
   ; ***** X >= Y
   ldx #80
   ldy #100
   lda #$03
   jsr put_dot


   ; ***** done
   ldx #159
   ldy #199
   lda #$03
   jsr put_dot




   rts






