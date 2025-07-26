BasicUpstart2(main)
	* = $1000

main:
loop:
	lda #$00
	sta $d020
	clc
	adc #$04
	sta $d021
	asl $d021
	jmp loop
