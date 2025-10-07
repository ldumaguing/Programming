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

    ; ***** saving
    lda #$01        ; logical file number 1
    ldx #$09        ; device 9 (disk drive)
    ldy #$02        ; secondary address 2
    jsr $ffba       ; call SETLFS

    lda #3          ; length of filename
    ldx #<filename
    ldy #>filename
    jsr $ffbd       ; call SETNAM

    ; set start and end addresses in zero page for save
    ; 1024 = $0400; 1028 = $0404; $0404+1 = $0405
    lda #$00        ; <start_addr_low>
    sta $2a
    lda #$04        ; <start_addr_high>
    sta $2b

    ldx #$05        ; <end_addr_low>
    ldy #$04        ; <end_addr_high>

    lda #$2a
    jsr $ffd8       ; call SAVE kernal routine

    rts

filename: .byte "abc"

