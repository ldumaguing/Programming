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
   ; lda #$18
   sta MEM_SETUP

   ; ******************************************************************************** Start drawing
   lda #$01       ; black & white
   sta $4400      ; a cell with the two colors.  (Bank 1 value) plus (Video Matrix location)
   lda #$23
   sta $4401
   lda #$45
   sta $4402
   lda #$67
   sta $4403

   ldx #$0        ; index for img array
   ldy #8         ; number of bytes to read from
loop1:
   lda img,x
   sta $6000,x    ; (Bank 1 value) plus (Upper half (usually $2000))
   sta $6008,x
   sta $6010,x
   sta $6018,x
   inx
   dey
   bne loop1


   lda #$1b
   sta $6000
   lda #$e4
   sta $6008

   ldx #0
loop:
   stx COLOR_RAM
   stx COLOR_RAM + 1
   inx
   jmp loop

img: .byte $28, $28, $ee, 0, $ee, $28, $28, 0



