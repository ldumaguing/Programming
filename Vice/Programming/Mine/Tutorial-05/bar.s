.export _SetColor

_SetColor:
   lda #$00
   sta $d020

   lda #$01
   sta $d021

   rts
