BasicUpstart2(main)
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
	cpx    #20
	bne    write

	ldx #$00
setcolor:
	lda #$07
	sta $d800,x
	inx
	cpx #$20
	bne setcolor

loop:
	jmp loop

msg: .text "C64 AZWERTYUIOPLKJHGrial by digitalerr0r of Dark Codex"

	* = $2000
.import binary "fish.bin"
