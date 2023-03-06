@
@ R0 - first parameter to printf
@ R1 - second parameter to printer
@ R7 - index counter
@

.thumb_func               @ Necessary because sdk uses BLX
.global main              @ Provide program starting address to linker

main:
	LDR	R1, =mydword
	LDM	R1!, {R2, R3}
	MOV R4, R1
	STM	R1!, {R2, R3}
	MOV R5, R1


loop:
    LDR    R0, =print_this   @ load address of print_this string [seems that R0 looses the data after the call]
    MOV R1, R4
    MOV R2, R5
    BL    printf            @ Call pico_printf
    B    loop              @ loop forever





    
.data
.align  4                 @ necessary alignment
print_this: .asciz "> %x.%x\n"
.align  4
mydword:	.QUAD 0x1234567887654321
mydword2:	.QUAD 0x0
