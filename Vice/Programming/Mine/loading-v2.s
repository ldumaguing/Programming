; first row, first column --- 1024
; third row, first column --- 1104

; cl65 -o loading -t c64 -I ~/cc65/include -L ~/cc65/lib -C c64-asm.cfg-MINE loading.s && mv loading ~/Vice/vicefs/
; sys49152

    ; ***** loading
    lda #$01        ; logical file number 1
    ldx #$09        ; device 9 (disk drive)
    ldy #$00        ; 0: manually define address for memory storage
    jsr $ffba       ; call SETLFS

    lda #3          ; length of filename
    ldx #<filename
    ldy #>filename
    jsr $ffbd       ; call SETNAM

    lda #0          ; LOAD mode
    ; 1104 = $0450
    ldx #$50
    ldy #$04
    jsr $ffd5       ; call LOAD

    rts

filename: .byte "abc"

