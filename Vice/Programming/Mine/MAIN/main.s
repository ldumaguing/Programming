.include "defs.s"
; first row, first column --- 1024
; third row, first column --- 1104

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

   ; **********************************************************************************************
   ldx #0
loop:
   stx BORDER
   inx
   stx BACKGROUND
   inx
   jmp loop
