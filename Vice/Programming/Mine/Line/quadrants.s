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
   stx old_X
   ldy y1
   sty old_Y

   lda delta_X
   lsr
   cmp delta_Y
   bpl :++
:
   ldx x1
   ldy y1
   lda #3
   jsr put_dot
   jsr redefine_Y1_a
   inc x1
   lda x1
   cmp x2
   bne :-

   ldx x2
   ldy y2
   lda #2
   jsr put_dot

   rts
:
   ldx x1
   ldy y1
   lda #3
   jsr put_dot
   jsr redefine_Y1
   inc x1
   lda x1
   cmp x2
   bne :-

   ldx x2
   ldy y2
   lda #2
   jsr put_dot

   rts

; ***** Quad_I: X < Y *********************************************************************** DOING
do_q1_b:
   ldx x1
   stx old_X
   ldy y1
   sty old_Y


























   ldx #80
   ldy #110
   lda #2
   jsr put_dot

   rts

; =================================================================================================
redefine_Y1:
   ; A(10,10)
   ; B(90,80)

   ; ***** x1 - Ax
   sec
   lda x1
   sbc old_X

   ; ***** multiply by delta_Y
   sta numer
   lda #0
   sta numer+1
   sta multi+1
   lda delta_Y
   sta multi
   jsr do_multiply

   ; ***** divide by delta_X
   lda delta_X
   sta denom
   lda #0
   sta denom+1
   jsr do_divide

   lda numer
   sta y1

   ; ***** add Ay
   clc
   lda numer
   adc old_Y
   sta y1

   rts

; =================================================================================================
redefine_Y1_a:
   ; A(10,10)
   ; B(90,80)

   ; ***** x1 - Ax
   sec
   lda x1
   sbc old_X

   ; ***** multiply by delta_Y
   sta numer
   lda #0
   sta numer+1
   sta multi+1
   lda delta_Y
   sta multi
   jsr do_multiply

   ; ***** divide by delta_X
   lda delta_X
   sta denom
   lda #0
   sta denom+1
   jsr do_divide

   lda numer
   sta y1

   ; ***** add Ay
   clc
   lda numer
   adc old_Y
   sta y1

   inc y1

   rts



