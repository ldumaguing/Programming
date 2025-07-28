BasicUpstart2(main)
	* = $1000

main:
	jsr $e544 // clear screen
	lda #$0d
	sta $d020 // border color
	lda #$00
	sta $d021 // background color
	lda #$18  // 0001 100_ ( 1 * 1024 = $400; 4 * 2048 = $2000)
	sta $d018 // VIC-II register

//	ldx    #2
//	lda    msg,x
//	jsr    $ffd2
// lda msg // .text is ascii
// sta $0400

lda #67 // letter C for $ffd2
jsr $ffd2

lda #68 // letter D for $ffd2, also $ffd2 shifts to the right
jsr $ffd2

	rts

//msg: .text "C64 AZWERTYUIOPLKJHGrial by digitalerr0r of Dark Codex"
// msg: .byte 0,1,2,3

	* = $2000
//.import c64 "scrap_writer_iii_17.64c"
.import binary "fish.bin"
