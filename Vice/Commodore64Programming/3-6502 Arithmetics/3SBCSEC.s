loop:
	lda #$08
	sta $d020
	sec
	sbc #$08
	sta $d021
	jmp loop
