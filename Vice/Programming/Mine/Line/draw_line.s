; ***************************************************************************************
draw_line:
   ; ***** clear deltas and flags
   lda #0
   sta delta_X
   sta delta_X+1
   sta delta_Y
   sta delta_Y+1
   sta flags

   ; ***** define deltaX
   sec
   lda x2
   sbc x1
   sta delta_X
   bpl :+
   inc flags
:
   ; ***** define deltaY
   sec
   lda y2
   sbc y1
   sta delta_Y
   bpl :+
   lda flags
   ora #2
   sta flags
:
   lda flags
   cmp #1
   beq :+
   cmp #2
   beq :++
   cmp #3
   beq :+++
   jmp default
:                            ;  y,-x
   ldx #5
   ldy #5
   lda #2
   jsr put_dot
   jmp continue0
:                            ; -y, x
   ldx #10
   ldy #10
   lda #2
   jsr put_dot
   jmp continue0
:                            ; -y,-x
   ldx #15
   ldy #15
   lda #2
   jsr put_dot
   jmp continue0
default:                     ;  y, x
   ;jsr do_quad_I
   ldx #20
   ldy #20
   lda #3
   jsr put_dot
continue0:
   nop






   rts

; *******************************************************
;  A       B
; (10,10) (90,90) = 20
; (90,90) (10,10) = 15
; (10,90) (10,90) = 20
; (10,90) (90,10) = 10
; (90,10) (10,90) =  5
















