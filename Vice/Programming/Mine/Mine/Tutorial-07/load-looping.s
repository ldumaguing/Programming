.include "defs.s"
; first row, first column --- 1024
; third row, first column --- 1104

; cl65 -o loadv2 -t c64 -C ../c64-asm.cfg-MINE load-looping.s && mv loadv2 ~/Vice/vicefs/
; sys49152

    lda MESSAGE
    and #$3f        ; turn off messages
    sta MESSAGE

loop:
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

    lda $450
    sta BORDER

    jmp loop

    rts

; *************************************************************************************************
filename: .byte "host flag"

