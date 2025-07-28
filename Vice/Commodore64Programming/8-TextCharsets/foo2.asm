BasicUpstart2(main)
	* = $1000

main:
    // lda #65    // prints a spade image
    lda msg     // prints a spade image
    sta $0400
	rts

	* = $2000 // 8192
msg: .text "ABCabD"
//            ABCabD
//            ||||||
//            |||||+--- 68
//            ||||+---- random
//            |||+----- random
//            ||+------ 67
//            |+------- 66
//            +-------- 65
