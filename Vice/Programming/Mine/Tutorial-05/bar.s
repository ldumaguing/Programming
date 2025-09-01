.export _SetColor
.export _SetColor2
.export _SetColor3
.export _Letters

.autoimport on

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
   sta $d021   ; background
   jsr popa
   sta $d020   ; border

   rts

_Letters:
   sta 1024
   jsr popa
   sta 1025
   jsr popa
   sta 1026

   rts
