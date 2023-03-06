@
@ Examples of the MOV/ADD/SUB/Shift instructions.
@

.thumb_func                @ Necessary because sdk uses BLX
.global main               @ Provide program starting address to linker

main:
    BL   stdio_init_all    @ initialize uart or usb

    MOV    R2, #3          @ Move 3 into register R2
    MOV    R1, R2          @ R1 is now also 3
@    MOVS   R1, R2          @ the S explicitly states we want the first version.
    MOV    R9, R2          @ R9 now is 3

    ADD    R4, R2, #7      @ this immediate allows 3 bits, so values 0-7
                           @ R4 is now 10 (3 + 7)

    ADD    R4, R4, #255    @ this one allows 8-bits, so 0-255
                           @ R4 is now 265 (10 + 255)

    ADD    R4, #255        @ alternate for for R4 = R4 + 255
                           @ R4 is now 520(265 + 255)

    MOV    R7, #23         @ Can't load high registers with immediate
    MOV    R11, R7         @ So load R7 and move it
    MOV    R7, #54
    MOV    R10, R7         @ if one source register is the destination, it can be omitted

    ADD    R10, R10, R11   @ The one instruction to allow high registers
                           @ R10 is now 77 (23 + 54)

    ADD    SP, SP, #508    @ shouldn’t do this without matching subtraction
    SUB    SP, SP, #508    @ Undo the damage.
    ADD    R4, SP, #1020   @ 8-bit immediate but multiples of 4 so 0-1020 valid
                           @ need to check R4 in the debugger since it depends on the value of SP
                           @ when I ran I got 0x200423fc but if SDK changes this could change.

@ Repeat the above shifts using the Assembler mnemonics.
    MOV    R3, #8          @ will use this to shift or rotate 1-byte
    MOV    R2, #0xFF       @ R2 = 255
    MOV    R1, #4          @ R1 = 4
    LSL    R1, R1, #2      @ Shift register R1 left 2 bits (multiply by 4)
    LSL    R1, #2          @ Shorter form if the registers are the same
    LSR    R1, R2, #1      @ Shift R2 right by one bytes and place the result in R1



ADD R3, #508



MOV R6, R1
@ MOV R5, R2





loop:
    MOV    R1, R6
@    MOV    R2, R5
    LDR    R0, =sumstr     @ load address of sumstr to param1
    BL     printf          @ call printf
    B      loop            @ loop in case uart monitoring not started

.data
.align  4                  @ necessary alignment
sumstr: .asciz   "--->>> %d\n"



