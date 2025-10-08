; cl65 -o test -u __EXEHDR__ -t c64 -C /usr/share/cc65/cfg/c64-asm.cfg main.s && mv test ~/Vice/vicefs/
; cl65 -o test -u __EXEHDR__ -t c64 -C /usr/local/share/cc65/cfg/c64-asm.cfg main.s && mv test ~/Vice/vicefs/
; ~/github/cc65/bin/cl65 -o test -u __EXEHDR__ -t c64 -C ~/github/cc65/cfg/c64-asm.cfg foo1.s && mv test ~/Vice/vicefs/

   jmp main

.include "defs.s"
.include "vol_1.s"
.include "my_math.s"
.include "quadrants.s"

main:
   ; ***** set graphic mode
   jsr set_multi_color_mode

   ; ***** clear background
   ;ldx #BROWN
   ;ldy #ORANGE
   ;jsr fill_background

   lda #$e4
   sta SCREEN_MEM
   lda #$e4
   sta SCREEN_MEM+1
   lda #$e4
   sta SCREEN_MEM+2
   lda #$e4
   sta SCREEN_MEM+3

   lda #$4e
   sta SCREEN_MEM+4
   lda #$4e
   sta SCREEN_MEM+5
   lda #$4e
   sta SCREEN_MEM+6
   lda #$4e
   sta SCREEN_MEM+7

   ; ***** background
   lda #BLACK
   sta BACKGROUND

   ; ***** color RAM
   lda #WHITE
   sta COLOR_RAM

   lda #$5a
   sta BANK_2


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
