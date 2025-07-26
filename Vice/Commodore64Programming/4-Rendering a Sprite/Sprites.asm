BasicUpstart2(main)
	* = $1000

main:
	lda #$80
	sta $07f8
	lda #$01
	sta $d015
	lda #$80
	sta $d000
	sta $d001

loop:
	jmp loop

	* = $2000
	.import binary "sprite2.spr"
