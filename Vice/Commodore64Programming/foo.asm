BasicUpstart2(main)
	* = $1000

.var temp = $c000
main:
	lda #<temp
	sta $df02
	lda #>temp
	sta $df03

	rts
