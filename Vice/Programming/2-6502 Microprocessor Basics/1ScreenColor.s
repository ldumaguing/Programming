loop:
	lda #$03
	sta $d021
	sta $d020
	jmp loop
