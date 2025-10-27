; cl65 -o test -u __EXEHDR__ -t c64 -C /usr/local/share/cc65/cfg/c64-asm.cfg main.s && mv test ~/Vice/vicefs/
; ~/github/cc65/bin/cl65 -o test -u __EXEHDR__ -t c64 -C ~/github/cc65/cfg/c64-asm.cfg foo1.s && mv test ~/Vice/vicefs/

   jmp main

.include "defs.s"
;.include "vol_1.s"
;.include "my_math.s"
;.include "direction_SE.s"
;.include "direction_NE.s"
;.include "draw_ticks.s"
;.include "draw_line.s"

main:
   ; ***** draw line
   lda #10
   sta x1

   lda #100
   sta x2

   jsr fook

   rts

; *************************************************************************************************
fook:
   ; ***** clear deltas and flags
   lda #0
   sta delta_X
   sta delta_X+1
   sta delta_Y
   sta delta_Y+1
   sta flags

   ; ***** define deltaX
   sec
   lda x2
   sbc x1
   sta delta_X
   lda x2+1
   sbc x1+1
   sta delta_X+1

   lda delta_X
   sta LINE1
   lda delta_X+1
   sta LINE1+1

   rts
