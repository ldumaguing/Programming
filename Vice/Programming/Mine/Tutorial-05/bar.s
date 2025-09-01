.export _SetColor
.export _SetColor2
.export _SetColor3

_SetColor:
   lda #$00
   sta $d020

   lda #$01
   sta $d021

   rts

_SetColor2:
   sta $d020
   sta $d021

   rts

_SetColor3:
   sta $d020   ; border
   stx $d021   ; background

   rts
