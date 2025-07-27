BasicUpstart2(main)

	* = $1000

main:
	lda #$00
	sta $d020
	sta $d021
	tax
	lda #$20

loop:
	sta $0400,x
	sta $0500,x
	sta $0600,x
	sta $0700,x
	dex
	bne loop
