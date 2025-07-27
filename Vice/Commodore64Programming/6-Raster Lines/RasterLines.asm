BasicUpstart2(main)
	* = $1000
main:
loop:
	lda $d012
	cmp #$ff
	bne loop
	inc $d021
	jmp loop
