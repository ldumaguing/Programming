; cl65 -o test -u __EXEHDR__ -t c64 -C /usr/local/share/cc65/cfg/c64-asm.cfg main.s && mv test ~/Vice/vicefs/
; ~/github/cc65/bin/cl65 -o test -u __EXEHDR__ -t c64 -C ~/github/cc65/cfg/c64-asm.cfg main.s && mv test ~/Vice/vicefs/

   jmp main

.include "defs.s"
.include "vol_1.s"
.include "my_math.s"
.include "quadrant_i.s"
.include "draw_ticks.s"
.include "draw_line.s"

main:
   jsr set_multi_color_mode

   lda #WHITE
   jsr set_color_ram

   lda #$26                  ; red / blue
   jsr set_color_cells

   ldx #LIGHT_GREY
   ldy #PINK
   jsr fill_background

   jsr draw_ticks

   ; ***** draw line
   ; --------------------------------
   lda #10
   sta x1
   lda #10
   sta y1

   lda #90
   sta x2
   lda #20
   sta y2
   jsr draw_line

   ; --------------------------------
   lda #10
   sta x1
   lda #10
   sta y1

   lda #90
   sta x2
   lda #90
   sta y2
   jsr draw_line

   ; ----------------------------------
   lda #10
   sta x1
   lda #10
   sta y1

   lda #90
   sta x2
   lda #10
   sta y2
   jsr draw_line

   ; ----------------------------------
   lda #10
   sta x1
   lda #10
   sta y1

   lda #90
   sta x2
   lda #80
   sta y2
   jsr draw_line

   ; ==================================
   lda #10
   sta x1
   lda #10
   sta y1

   lda #80
   sta x2
   lda #110
   sta y2
   jsr draw_line

   ; ----------------------------------
   lda #10
   sta x1
   lda #10
   sta y1

   lda #80
   sta x2
   lda #100
   sta y2
   jsr draw_line

   ; ----------------------------------
   lda #10
   sta x1
   lda #10
   sta y1

   lda #20
   sta x2
   lda #110
   sta y2
   jsr draw_line

   ; ----------------------------------
   lda #10
   sta x1
   lda #10
   sta y1

   lda #10
   sta x2
   lda #110
   sta y2
   jsr draw_line

loop: jmp loop

; **********************************************************
; SUMMARY
;
; 00: from background color
; 01: (BANK + MEM_SETUP high nibble)
; 10: (BANK + MEM_SETUP high nibble)
; 11: COLOR_RAM
