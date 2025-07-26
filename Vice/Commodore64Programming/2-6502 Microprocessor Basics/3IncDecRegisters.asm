BasicUpstart2(main)
	* = $1000

main:
loop:
	ldy #$03
	sty $d020
	iny
	sty $d021
	jmp loop
