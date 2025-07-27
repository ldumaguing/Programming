BasicUpstart(main)
	* = $1000

main:
	jsr $e544
	lda #$0d
	sta $d020
	lda #$05
	sta $d021
	lda #$18
	sta $d018
	ldx #$00

write:
	lda    msg,x
	jsr    $ffd2
	inx
	cpx    #54
	bne    write
	ldx #$00

setcolor:
	lda #$07
	sta $d800,x
	inx
	cpx #$54
	bne setcolor

loop:
	jmp loop

// .var msg = "C64 programming tutorial by digitalerr0r of Dark Codex"
msg: .text "C64 programming tutorial by digitalerr0r of Dark Codex"

.file [name="scrap_writer_iii_17.64c", segments="fish", allowOverlap]
	* = $2000 "fish"


.import c64 "scrap_writer_iii_17.64c"
