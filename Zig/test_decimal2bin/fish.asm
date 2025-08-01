; da65 V2.18 - Fedora 2.19-12.fc42
; Created:    2025-07-31 21:48:57
; Input file: fish.bin
; Page:       1


        .setcpu "6502"

LF4A5           := $F4A5
LF5ED           := $F5ED
        lda     #$BC
        sta     $0330
        lda     #$02
        sta     $0331
        lda     #$C3
        sta     $0332
        lda     #$02
        sta     $0333
        rts

        ldx     #$08
        stx     $BA
        jmp     LF4A5

        ldx     #$08
        stx     $BA
        jmp     LF5ED

