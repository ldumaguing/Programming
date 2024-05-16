chrout	= $ffd2

	ldx #0
loop:
	lda #2
	sta 53280
	lda #0
	sta 53281
	lda text,x
	beq done
	jsr chrout
	inx
	bne loop

done:
	rts

text:
	.byte "hello world"
	.byte 0

