loop:
	lda $cb     ; read keyboard
	cmp #64     ; compare no input
	beq loop    ; if no input, loop [--- if (key == 64) loop ---]
	sta $d021   ; store what was pressed into background color
	jmp loop    ; continue loop

