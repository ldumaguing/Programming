BasicUpstart2(main)
	* = $4000

.var temp = $c000

main:
	lda #0
	sta $df04
	sta $df05
	sta $df08
	sta $df0a
	lda #1
	sta $df07

	lda #<temp
	sta $df02
	lda #>temp
	sta $df03

	ldx #0
loop1:
	stx $df06
	stx temp
	lda #178
	sta $df01
	lda temp
	sta temp+1,x
	inx
	bne loop1

	ldy #177
	ldx #0
	stx old
loop2:
	stx $df06
	sty $df01
	lda temp
	cmp old
	bcc next
	sta old
	inx
	bne loop2
next:
	stx size
	ldy #176
	ldx #255
loop3:
	stx $df06
	lda temp+1,x
	sta temp
	sty $df01
	dex
	cpx #255
	bne loop3
	lda size

	sta $0400

	rts

old:  .byte 0
size: .byte 0

















