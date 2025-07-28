BasicUpstart2(main)
	* = $1000

main:
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
