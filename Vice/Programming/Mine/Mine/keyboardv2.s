loop:
	lda $cb     ; read keyboard
	cmp #64     ; compare no input
	beq loop    ; if no input, loop [--- if (key == 64) loop ---]

	tax
	and #$0f    ; 00001111 AND accumulator
	sta $d020   ; store what was pressed into border color
	txa
	lsr a       ; accumulator bit shift right once
	lsr a
	lsr a
	lsr a
	sta $d021   ; store what was press into background color
	jmp loop    ; continue loop

; ***** same background and border colors; so, bit shifting works
; 17 R
; 34 J
; 51 HOME
