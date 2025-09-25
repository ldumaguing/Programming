PALETTE      = 42
PALETTE_ORIG = 82

DOT_X = 251   ; 251, 252, 253
DOT_Y = 820   ; 820, 821, 822

Y1 = 823      ; 823, 824
Y2 = 825      ; 825, 826

; ***************************************************************************************
put_dot:
   stx DOT_X
   sty DOT_Y

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

   lda DOT_X
   and #3
   sta DOT_X+2       ; store remainder

   ; divide X by 4
   lsr DOT_X
   lsr DOT_X

   ; multiply X by 8
   clc
   asl DOT_X
   asl DOT_X
   asl DOT_X
   bcc :+
   inc DOT_X+1

:
   ; *************** let's deal with Y
   lda DOT_Y
   and #7
   sta DOT_Y+2       ; store remainder

   ; divide Y by 8
   lsr DOT_Y
   lsr DOT_Y
   lsr DOT_Y

   ; ********** multiply Y by 320
   ; ***** multiply by 256
   lda DOT_Y
   sta Y1
   clc
   ldx #8            ; loop times
:
   asl Y1
   bcc :+
   asl Y1+1
   inc Y1+1
   jmp :++
:
   asl Y1+1
:
   dex
   bne :---

   lda Y1
   lda Y1+1

   ; ***** multiply by 64
   lda DOT_Y
   sta Y2
   clc
   ldx #6            ; loop times
:
   asl Y2
   bcc :+
   asl Y2+1
   inc Y2+1
   jmp :++
:
   asl Y2+1
:
   dex
   bne :---

   lda Y2
   lda Y2+1

   ; ***** DOT_Y = Y1 + Y2
   clc
   lda Y1
   adc Y2
   sta DOT_Y
   lda Y1+1
   adc Y2+1
   sta DOT_Y+1
   ; ***** DOT_Y += remainder
   clc
   lda DOT_Y
   adc DOT_Y+2
   sta DOT_Y
   lda DOT_Y+1
   adc #0
   sta DOT_Y+1

   ; ***** DOT_X + DOT_Y and store in registers x and y
   clc
   lda DOT_X
   adc DOT_Y
   sta Y1

   lda DOT_X+1
   adc DOT_Y+1
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

   lda DOT_X+2
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
