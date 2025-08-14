; first row, first column --- 1024
; third row, first column --- 1104

; cl65 -o loading -t c64 -I ~/cc65/include -L ~/cc65/lib -C c64-asm.cfg-MINE loading.s && mv loading ~/Vice/vicefs/
; sys49152

    ; ***** ABC; filename; use ASCII
    lda #65
    sta 1024
    lda #66
    sta 1025
    lda #67
    sta 1026

    ; ***** loading
    lda #$01        ; logical file number 1
    ldx #$09        ; device 9 (disk drive)
    ldy #$00        ; 0: manually define address for memory storage
    jsr $ffba       ; call SETLFS

    lda #3          ; length of filename
    ; 1024 = $0400
    ldx #$00        ; low byte of filename address
    ldy #$04        ; high byte of filename address
    jsr $ffbd       ; call SETNAM

    lda #0          ; LOAD mode
    ; 1104 = $0450
    ldx #$50
    ldy #$04
    jsr $ffd5       ; call LOAD

    rts



