.include "defs.s"
; first row, first column  --- 1024
; second row, first column --- 1064

; cl65 -o saving -t c64 -C ../c64-asm.cfg-MINE saving.s && mv saving ~/Vice/vicefs/
; sys49152

    ; ***** datum to be save
    lda #13
    sta 1024

    ; ***** saving
    lda #$01        ; logical file number 1
    ldx #$09        ; device 9 (disk drive)
    ldy #$02        ; secondary address 2
    jsr SETLFS

    lda #9          ; length of filename
    ldx #<filename  ; low byte of filename address
    ldy #>filename  ; high byte of filename address
    jsr SETNAM

    ; set start and end addresses in zero page for saving datum
    lda #$00        ; <start_addr_low>
    sta $2a
    lda #$04        ; <start_addr_high>
    sta $2b

    ldx #$01        ; <end_addr_low>
    ldy #$04        ; <end_addr_high>

    lda #$2a        ; use this address
    jsr SAVE

    rts

; *************************************************************************************************
filename: .byte "host flag"

