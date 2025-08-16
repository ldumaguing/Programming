; cl65 -o highres -t c64 -I ~/cc65/include -L ~/cc65/lib -C c64-asm.cfg-MINE highres.s && mv highres ~/Vice/vicefs/
; sys49152

   ; ***** set bitmap mode
   lda $d011
   ora #32
   sta $d011

   ; ***** Video Matrix: $400
   ; ***** Use upper half
   lda #$18
   sta $d018

   lda #0
   tax      ; x = 0
   lda #$01 ; black & white
VidMem_loop:
   sta $400,x
   sta $500,x
   sta $600,x
   sta $700,x
   inx
   bne VidMem_loop

   lda #0
   tax
Bank_loop:
   lda #$55
   sta $2000,x
   sta $2100,x
   sta $2200,x
   sta $2300,x
   lda #$aa
   sta $2001,x
   sta $2101,x
   sta $2201,x
   sta $2301,x
   inx
   inx
   bne Bank_loop

loop:
   jmp loop





