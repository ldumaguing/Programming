BasicUpstart2(main)
	* = $1000

main:
loop:
	lda #$08
	sta $d020
	sec
	sbc #$08
	sta $d021
	jmp loop
