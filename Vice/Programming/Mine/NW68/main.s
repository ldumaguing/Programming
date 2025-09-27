.include "defs.s"

; cl65 -o nw68 -u __EXEHDR__ -t c64 -C ../c64-asm.cfg main.s && mv nw68 ~/Vice/vicefs/
; LOAD"MAIN",9,1

   ; ***** disable I/O & error messages
   lda MESSAGE
   and #$3f
   sta MESSAGE

   ; ***** turn off BASIC
   lda $1
   and #$fc
   ora #2
   sta $1

   ; ***** turn on bitmap
   lda SCREEN_CONTROL_1
   ora #32
   sta SCREEN_CONTROL_1

   ; ***** turn on multi-color
   lda SCREEN_CONTROL_2
   ora #16
   sta SCREEN_CONTROL_2

   ; ***** Bank
   lda VIC_BANK
   and #$fc
   ora #1            ; Bank #2, $8000-$BFFF, 32768-49151.
   sta VIC_BANK

   ; ***** (high nibble; 0) $0
   ; ***** (low nibble; 8)  $8
   lda #$8
   sta MEM_SETUP

   ; ***** clear background
   ldx #BROWN
   ldy #ORANGE
   jsr fill_background
   ; ************************* put a dot
   ldx #159
   ldy #199
   lda #$03                  ; [hard code color]; palette 0 to 3
   jsr put_dot

   ldx #0
   ldy #0
   lda #$03
   jsr put_dot

   ldx #159
   ldy #0
   lda #$03
   jsr put_dot

   ldx #0
   ldy #199
   lda #$03
   jsr put_dot

   ldx #80
   ldy #100
   lda #$02
   jsr put_dot

loop: jmp loop

.include "functions.s"

; **********************************************************
; SUMMARY
;
; 00: from background color
; 01: (BANK + MEM_SETUP high nibble)
; 10: (BANK + MEM_SETUP high nibble)
; 11: COLOR_RAM
