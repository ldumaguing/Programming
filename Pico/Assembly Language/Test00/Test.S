@ sudo minicom -b 115200 -o -D /dev/ttyACM0

.thumb_func               @ Necessary because sdk uses BLX
.global main              @ Provide program starting address to linker

main:
    BL    stdio_init_all    @ initialize uart or usb






loop:
    LDR R0, =print_this

    MOV R1, #7
    MOV R2, #8
    MOV R3, #9


    BL  printf
    B   loop





    
.data
.align  4
print_this: .asciz "> %x %x %x\n"

