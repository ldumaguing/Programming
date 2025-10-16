; cl65 -o test -u __EXEHDR__ -t c64 -C /usr/local/share/cc65/cfg/c64-asm.cfg main.s && mv test ~/Vice/vicefs/
; ~/github/cc65/bin/cl65 -o test -u __EXEHDR__ -t c64 -C ~/github/cc65/cfg/c64-asm.cfg foo.s && mv test ~/Vice/vicefs/

   jmp main

.include "defs.s"
.include "vol_1.s"
.include "my_math.s"
.include "quadrants.s"
.include "draw_ticks.s"
.include "draw_line.s"

main:
   lda #31
   sta half
   sta LINE1

   lsr half
   lda half
   sta LINE2

   lda #14
   cmp LINE2
   bpl :+
   lda #0
   sta LINE1
   rts
:
   lda #1
   sta LINE1



   rts




