; *************************************************************************************************
do_quad_I:
   lda delta_X
   cmp delta_Y
   bpl :+
   jsr do_q1_b               ; X < Y
   rts
:
   jsr do_q1_a               ; X >= Y
   rts

; ***** Quad_I: X >= Y
do_q1_a:
   ldx x1
   ldy y1
   lda #1
   jsr put_dot

   ldx x2
   ldy y2
   lda #2
   jsr put_dot

   rts

; ***** Quad_I: X < Y
do_q1_b:
   nop

   rts

; *************************************************************************************************

