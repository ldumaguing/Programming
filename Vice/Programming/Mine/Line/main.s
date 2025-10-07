; cl65 -o test -u __EXEHDR__ -t c64 -C /usr/share/cc65/cfg/c64-asm.cfg main.s && mv test ~/Vice/vicefs/
; cl65 -o test -u __EXEHDR__ -t c64 -C /usr/local/share/cc65/cfg/c64-asm.cfg main.s && mv test ~/Vice/vicefs/
; ~/github/cc65/bin/cl65 -o test -u __EXEHDR__ -t c64 -C ~/github/cc65/cfg/c64-asm.cfg main.s && mv test ~/Vice/vicefs/

   jmp main

.include "defs.s"
.include "vol_1.s"
.include "my_math.s"
.include "quadrants.s"

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
   lda #0
   sta y1

   lda #150
   sta x2
   lda #150
   sta y2

   jsr draw_line

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
