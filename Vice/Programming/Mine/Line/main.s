; cl65 -o test -u __EXEHDR__ -t c64 -C /usr/share/cc65/cfg/c64-asm.cfg main.s && mv test ~/Vice/vicefs/
; cl65 -o test -u __EXEHDR__ -t c64 -C /usr/local/share/cc65/cfg/c64-asm.cfg main.s && mv test ~/Vice/vicefs/

   jmp main

.include "defs.s"
.include "vol_1.s"

main:
   ; ***** set graphic mode
   jsr set_multi_color_mode

   ; ***** clear background
   ldx #BROWN
   ldy #ORANGE
   jsr fill_background

   ; ************************* draw line
   lda #10
   sta x1
   sta y1
   lda #50
   sta x2
   sta y2
   jsr draw_line

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

   ldx #1
   ldy #0
   lda #$02
   jsr put_dot

   ldx #2
   ldy #0
   lda #$01
   jsr put_dot

   ldx #3
   ldy #0
   lda #$03
   jsr put_dot

   ldx #100
   ldy #100
   lda #$03
   jsr put_dot

   ldx #101
   ldy #101
   lda #$02
   jsr put_dot

   ldx #102
   ldy #102
   lda #$01
   jsr put_dot

   ldx #123
   ldy #123
   lda #$03
   jsr put_dot

   ; ***** set cell's color palette
   ; 0: background
   ; 1: high nibble
   ; 2: low nibble
   ; 3: color RAM
   lda #$10                  ; high nibble is white, low nibble is black
   sta BANK
   lda #BLUE
   sta COLOR_RAM

loop: jmp loop

; **********************************************************
; SUMMARY
;
; 00: from background color
; 01: (BANK + MEM_SETUP high nibble)
; 10: (BANK + MEM_SETUP high nibble)
; 11: COLOR_RAM
