; first row, first column  --- 1024
; second row, first column --- 1064
; l --- 12
; a ---  1
; r --- 18
; y --- 25
; f ---  6
; o --- 15

; cl65 -o saving -t c64 -I ~/cc65/include -L ~/cc65/lib -C c64-asm.cfg-MINE saving.s && mv saving ~/Vice/vicefs/
; sys49152

    ; ***** larry; data to be save
    lda #12
    sta 1024
    lda #1
    sta 1025
    lda #18
    sta 1026
    lda #18
    sta 1027
    lda #25
    sta 1028

    ; ***** foo; filename
    lda #6
    sta 1064
    lda #15
    sta 1065
    lda #15
    sta 1066

    ; ***** saving







    rts
