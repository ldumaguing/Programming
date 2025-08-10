loop:
	ldy #$03
	sty $d020
	iny
	sty $d021
	jmp loop
