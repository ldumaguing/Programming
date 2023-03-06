@
@ R0 - first parameter to printf
@ R1 - second parameter to printer
@ R7 - index counter
@

.thumb_func               @ Necessary because sdk uses BLX
.global main              @ Provide program starting address to linker

main:
    MOV    R7, #0            @ initialize counter to 0
    BL    stdio_init_all    @ initialize uart or usb





loop:
    LDR    R0, =print_this   @ load address of print_this string [seems that R0 looses the data after the call]
    ADD    R7, #1            @ Increment counter
    MOV    R1, R7            @ Move the counter to second parameter
    BL    printf            @ Call pico_printf
    B    loop              @ loop forever





    
.data
.align  4                 @ necessary alignment
print_this: .asciz "> %b\n"
