; ***************************************************************************************
put_dot:
   stx dot_X
   sty dot_Y

   sta PALETTE
   sta PALETTE_ORIG

   ldx #3
:
   rol PALETTE
   rol PALETTE
   lda PALETTE_ORIG
   ora PALETTE
   sta PALETTE
   dex
   bne :-

   lda dot_X
   and #3
   sta dot_X+2       ; store remainder

   ; divide X by 4
   lsr dot_X
   lsr dot_X

   ; multiply X by 8
   clc
   asl dot_X
   asl dot_X
   asl dot_X
   bcc :+
   inc dot_X+1

:
   ; *************** let's deal with Y
   lda dot_Y
   and #7
   sta dot_Y+2       ; store remainder

   ; divide Y by 8
   lsr dot_Y
   lsr dot_Y
   lsr dot_Y

   ; ********** multiply Y by 320
   ; ***** multiply by 256
   lda dot_Y
   sta Y1
   clc
   ldx #8            ; loop times
loopA:
   asl Y1
   bcc :+
   asl Y1+1
   inc Y1+1
   jmp :++
:
   asl Y1+1
:
   dex
   bne loopA

   lda Y1
   lda Y1+1

   ; ***** multiply by 64
   lda dot_Y
   sta Y2
   clc
   ldx #6            ; loop times
loopB:
   asl Y2
   bcc :+
   asl Y2+1
   inc Y2+1
   jmp :++
:
   asl Y2+1
:
   dex
   bne loopB

   lda Y2
   lda Y2+1

   ; ***** dot_Y = Y1 + Y2
   clc
   lda Y1
   adc Y2
   sta dot_Y
   lda Y1+1
   adc Y2+1
   sta dot_Y+1
   ; ***** dot_Y += remainder
   clc
   lda dot_Y
   adc dot_Y+2
   sta dot_Y
   lda dot_Y+1
   adc #0
   sta dot_Y+1

   ; ***** dot_X + dot_Y and store in registers x and y
   clc
   lda dot_X
   adc dot_Y
   sta Y1

   lda dot_X+1
   adc dot_Y+1
   sta Y1+1

   lda #<SCREEN_MEM
   sta Y2
   lda #>SCREEN_MEM
   sta Y2+1

   clc
   lda Y1
   adc Y2
   sta 2                     ; store low byte address in zero page area
   lda Y1+1
   adc Y2+1
   sta 3                     ; store high byte address in zero page area

   ldy #0
   lda (2),y                 ; get screen byte
   sta 4                     ; save screen byte in zero page area

   lda dot_X+2
   cmp #3
   beq three
   jmp :+
three:
   lda #3
   jmp continue
:
   cmp #2
   beq two
   jmp :+
two:
   lda #12
   jmp continue
:
   cmp #1
   beq one
   jmp :+
one:
   lda #48
   jmp continue
:
   lda #192

continue:
   sta Y1                    ; save mask
   eor #$ff
   sta Y1+1                  ; save ~mask

   lda PALETTE
   and Y1
   sta Y2

   lda 4                     ; screen byte
   and Y1+1
   sta Y2+1

   lda Y2
   ora Y2+1

   ldy #0
   sta (2),y

   rts

dot_X: .byte 0, 0, 0 ; dot_X+2 is pixel placement
dot_Y: .byte 0, 0, 0

Y1: .byte 0, 0
Y2: .byte 0, 0

; ********************************************************* clear background with a color
fill_background:
   stx BACKGROUND
   sty BORDER

   lda #<SCREEN_MEM
   sta 2
   lda #>SCREEN_MEM
   sta 3

   ldy #0
   lda #0
   ldx #32
:
:
   sta (2),y
   iny
   bne :-
   inc 3
   dex
   bne :--

   rts
