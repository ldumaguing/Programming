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
   lda #0
   sta x1+1
   sta x2+2
   sta y1+1
   sta y2+2

   ; ***** draw line
   lda #150
   sta x1
   lda #100
   sta y1

   lda #20
   sta x2
   lda #10
   sta y2

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

   ; ***** define delta_X
   sec
   lda x2
   sbc x1
   sta delta_X
   lda x2+1
   sbc x1+1
   sta delta_X+1
   bpl :+
   lda delta_X
   eor #$ff
   sta delta_X
   lda delta_X+1
   eor #$ff
   sta delta_X+1
   inc delta_X
   lda #2
   sta flags

:
   ; ***** define delta_Y
   sec
   lda y2
   sbc y1
   sta delta_Y
   lda y2+1
   sbc y1+1
   sta delta_Y+1
   bpl :+
   lda delta_Y
   eor #$ff
   sta delta_Y
   lda delta_Y+1
   eor #$ff
   sta delta_Y+1
   inc delta_Y
   inc flags
:
   ; ***** printing
   lda delta_X
   sta LINE1
   lda delta_X+1
   sta LINE1+1

   lda delta_Y
   sta LINE2
   lda delta_Y+1
   sta LINE2+1

   lda flags
   sta LINE2+2

   rts
