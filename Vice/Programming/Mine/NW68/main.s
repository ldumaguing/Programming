.include "defs.s"

; cl65 -o nw68 -u __EXEHDR__ -t c64 -C ../c64-asm.cfg main.s && mv nw68 ~/Vice/vicefs/
; LOAD"MAIN",9,1

   ; ************************* put a dot
   ldx #159
   ldy #199
   lda #$03                  ; [hard code color]; palette 0 to 3
   jsr put_dot

   rts

.include "functions.s"

; **********************************************************
; SUMMARY
;
; 00: from background color
; 01: (BANK + MEM_SETUP high nibble)
; 10: (BANK + MEM_SETUP high nibble)
; 11: COLOR_RAM
