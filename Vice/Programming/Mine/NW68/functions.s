; ***************************************************************************************
put_dot:
   ; ***** BUFFER16 *****
   ; +0: X
   ; +1: remainder X
   ; +2: Y
   ; +3: remainder Y
   ; +4: palette
   stx BUFFER16
   sty BUFFER16+2
   sta BUFFER16+4

   ; ***** print X, Y, A
   ;lda BUFFER16
   ;sta TEXT_MEM
   ;lda BUFFER16+2
   ;sta TEXT_MEM+2
   ;lda BUFFER16+4
   ;sta TEXT_MEM+4

   ; ************************* dealing with X
   lda BUFFER16
   sta BUFFER16+1
   and #3                    ; 0000.0011
   sta BUFFER16+1            ; store remainder
   lsr BUFFER16              ;; X divided
   lsr BUFFER16              ;; by 4

   ; ************************* dealing with Y
   lda BUFFER16+2
   sta BUFFER16+3
   and #7                    ; 0000.0111
   sta BUFFER16+3            ; store remainder
   lsr BUFFER16+2            ;; Y divided
   lsr BUFFER16+2            ;;
   lsr BUFFER16+2            ;; by 8

   ; ************************************************** (Y * 40) + X = CELL
   ; ************************* Y * 40
   ; ************************* 40 = 0010.1000
   ; ******************** Y << 5; Y * 32
   lda BUFFER16+2
   sta BUFFER16+6            ; using BUFFER16+6
   lda #0                    ; for
   sta BUFFER16+7            ; 16-bit integer

   clc
   ldx #5
:
   asl BUFFER16+6
   bcc :+
   inc BUFFER16+7
:
   dex
   bne :--

   ; ******************** Y << 3; Y * 8
   lda BUFFER16+2
   sta BUFFER16+8            ; using BUFFER16+8
   lda #0                    ; for
   sta BUFFER16+9            ; 16-bit integer

   clc
   ldx #3
:
   asl BUFFER16+8
   bcc :+
   inc BUFFER16+9
:
   dex
   bne :--

   ; ******************** BUFFER16+6 plus BUFFER16+8




   rts

; ********************************************************* clear background with a color
fill_background:
   stx BACKGROUND
   sty BORDER

   lda #<SCREEN_MEM
   sta MEM_TWO
   lda #>SCREEN_MEM
   sta MEM_TWO+1

   ldy #0
   lda #0
   ldx #32
:
:
   sta (MEM_TWO),y
   iny
   bne :-
   inc MEM_TWO+1
   dex
   bne :--

   rts
