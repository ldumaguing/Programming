do_quad_I:
   ldx #30
   ldy #30
   lda #3
   jsr put_dot

   lda delta_X
   cmp delta_Y
   bpl :+
   ldx #30
   ldy #40
   lda #3
   jsr put_dot
   rts
:
   jsr do_q1_a



   rts

; ***** Quad_I: X >= Y
do_q1_a:
   ldx #100
   ldy #100
   lda #3
   jsr put_dot


   rts





