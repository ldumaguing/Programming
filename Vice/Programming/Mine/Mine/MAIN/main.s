.include "defs.s"

; cl65 -o main -u __EXEHDR__ -t c64 -C ../c64-asm.cfg main.s && mv main ~/Vice/vicefs/
; LOAD"MAIN",9,1
; RUN

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
   ora #2         ; Bank 1 ($4000 to $7fff)
   sta VIC_BANK

   ; ***** (high nibble; 1) $400
   ; ***** (low nibble; 8)  $2000
   lda MEM_SETUP
   ora #$18
   sta MEM_SETUP

   ; ******************************************************************************** Start drawing
   lda #$1b       ; 00 01 10 11
   sta $6000      ; $4000 + $2000
   sta $6001
   sta $6002
   sta $6003
   lda #$e4       ; 11 10 01 00
   sta $6004
   sta $6005
   sta $6006
   sta $6007

   ; ***** adding color to a cell
   lda #$01         ; 01 : 10 (BANK + MEM_SETUP high nibble)
   sta $4400

   lda #$02
   sta COLOR_RAM    ; 11

   lda #$03
   sta BACKGROUND   ; 00

   ; ******************************** another cell
   lda #$1b          ; 00 01 10 11
   sta $6008
   sta $6009
   sta $600a
   sta $600b
   lda #$e4          ; 11 10 01 00
   sta $600c
   sta $600d
   sta $600e
   sta $600f

   lda #$45          ; 01 : 10 (BANK + MEM_SETUP high nibble)
   sta $4401

   lda #$06
   sta COLOR_RAM + 1 ; 11

loop:
   jmp loop

; **********************************************************
; SUMMARY
;
; 00: from background color
; 01: (BANK + MEM_SETUP high nibble)
; 10: (BANK + MEM_SETUP high nibble)
; 11: COLOR_RAM
