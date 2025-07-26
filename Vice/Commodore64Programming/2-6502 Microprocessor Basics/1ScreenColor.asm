BasicUpstart2(main)
	* = $1000

main:
loop:
	lda #$03
	sta $d021
	sta $d020
	jmp loop
