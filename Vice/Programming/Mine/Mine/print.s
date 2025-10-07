;	lda #1
;	sta $0400
;	rts

; ***********************************************
;	lda letters
;	sta $0400  ; a = 65; seems ascii
;	rts

; ***********************************************
;	lda letters
;	ldx #1
;	sta $0400,x  ; print on the second square with "a"
;	rts

; ***********************************************
;	ldx index
;	lda letters,x
;	sta $0400

;	inc index
;	ldx index
;	lda letters,x
;	sta $0401

;	rts

; ***********************************************
;	lda #0
;	sta index
;	ldx index
;	lda letters,x
;	sta $0400

;	inc index
;	ldx index
;	lda letters,x
;	sta $0400,x

;	inc index
;	ldx index
;	lda letters,x
;	sta $0400,x

;	rts

; ***********************************************
	lda #0
	sta index
	ldx index
	lda letters,x
	sbc #64
	sta $0400 ; a

	inc index
	ldx index
	lda letters,x
	sbc #64
	sta $0400,x ; b

	inc index
	ldx index
	lda letters,x
	sbc #64
	sta $0400,x ; c

	rts

letters: .byte "abcdefghijklmnopqrstuvwxyz", 0
index: .byte 0

