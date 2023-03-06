@ sudo minicom -b 115200 -o -D /dev/ttyACM0

.thumb_func               @ Necessary because sdk uses BLX
.global main              @ Provide program starting address to linker

main:
    BL    stdio_init_all    @ initialize uart or usb

	LDR	R1, =mydword
MOV R4, R1
	LDM	R1!, {R2, R3}
MOV R5, R1
	STM	R1!, {R2, R3}
MOV R6, R1






loop:
    LDR R0, =print_this
    MOV R1, R4
    MOV R2, R5
    MOV R3, R6
    BL  printf
    B   loop





    
.data
.align  4
print_this: .asciz "> %x %x %x\n"
.align  4
mydword:	.QUAD 0x1234567887654321
mydword2:	.QUAD 0x0


@ ***********************************************************************
@ 20000e30 20000e38 20000e40   




