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
   ;tax
   ldx delta_X
   stx tmp
@LoopX:
   ldy #100
   lda #$03
   jsr put_dot

   dec tmp
   dec tmp
   ldx tmp
   ldy #100
   lda #$03
   jsr put_dot


   ;bne @LoopX

   ldx #159
   ldy #199
   lda #$03
   jsr put_dot




   rts






