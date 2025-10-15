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
   stx tmp_X
   ldy y1
   lda #1
   jsr put_dot

   ldx x2
   ldy y2
   lda #2
   jsr put_dot



@loop:
   ldx x1
   ldy y1
   lda #3
   jsr put_dot
   jsr redefine_Y1
   inc x1
   lda x1
   cmp x2
   bne @loop

   rts

; ***** Quad_I: X < Y
do_q1_b:
   nop

   rts

; =================================================================================================
redefine_Y1:
   sec
   lda x1
   sbc tmp_X
   sta y1




   ;lda #15
   ;sta y1

   rts





