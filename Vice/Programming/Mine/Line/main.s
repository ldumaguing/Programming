; cl65 -o test -u __EXEHDR__ -t c64 -C /usr/local/share/cc65/cfg/c64-asm.cfg main.s && mv test ~/Vice/vicefs/
; ~/github/cc65/bin/cl65 -o test -u __EXEHDR__ -t c64 -C ~/github/cc65/cfg/c64-asm.cfg main.s && mv test ~/Vice/vicefs/

   jmp main

.include "defs.s"
.include "vol_1.s"
.include "my_math.s"
.include "quadrants.s"

main:
   jsr set_multi_color_mode
   jsr set_color_ram
   jsr set_color_cells
   jsr fill_background
   jsr draw_ticks

   ldx #66
   ldy #66
   lda #$3
   jsr put_dot

   ldx #67
   ldy #67
   lda #$2
   jsr put_dot

   ldx #68
   ldy #68
   lda #$1
   jsr put_dot

   ; ***** test color RAM
   lda #CYAN
   sta COLOR_RAM+336

   ; ***** test color memory
   lda #$e5           ; light blue / green
   sta BANK+336
   sta BANK+337

   ldx #69
   ldy #69
   lda #$3
   jsr put_dot

   ; ***** set cell's color palette
   ; 0: background
   ; 1: high nibble
   ; 2: low nibble
   ; 3: color RAM
   ;lda #$10                  ; high nibble is white, low nibble is black
   ;sta BANK
   ;lda #BLUE
   ;sta COLOR_RAM

loop: jmp loop

; **********************************************************
; SUMMARY
;
; 00: from background color
; 01: (BANK + MEM_SETUP high nibble)
; 10: (BANK + MEM_SETUP high nibble)
; 11: COLOR_RAM
