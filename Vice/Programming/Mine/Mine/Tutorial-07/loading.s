.include "defs.s"
; first row, first column --- 1024
; third row, first column --- 1104

; cl65 -o loading -t c64 -C ../c64-asm.cfg-MINE loading.s && mv loading ~/Vice/vicefs/
; sys49152

    ; ***** loading
    lda #$01        ; logical file number 1
    ldx #$09        ; device 9 (disk drive)
    ldy #$00        ; 0: manually define address for memory storage
    jsr SETLFS

    lda #9          ; length of filename
    ldx #<filename  ; low byte of filename address
    ldy #>filename  ; high byte of filename address
    jsr SETNAM

    lda #0          ; LOAD mode
    ldx #$50        ; memory location to place datum
    ldy #$04
    jsr LOAD

    rts

; *************************************************************************************************
filename: .byte "host flag"

