loop:
	lda #$00
	sta $d020
	clc
	adc #$08
	sta $d021
	jmp loop
