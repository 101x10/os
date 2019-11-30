#include <inc/boot.h>

.code16
.global start
start:
    xorw %ax, %ax
    movw %ax, %ds
    movw %ax, %es
    movw %ax, %fs
    movw %ax, %ss
    movw $BOOTSECT_ADDR, %sp


    #####################################################
    #   INT 10, 13 打印字符串
    #       BP: 待打印字符串首地址
    #       CX: 待打印字符串长度
    #####################################################
    movw $boot_msg, %bp
    movw len, %cx

    movb $0x13, %ah
    movb $0x01, %al 
    movb $0x00, %bh
    movb $0x02, %bl
    movb $0x0a, %dh     # row coordinate
    movb $0x18, %dl     # column coordinate
    
    int $0x10

1:
    jmp 1b  

boot_msg:
    .asciz  "Boot Loading..."
len:
    .int    . - boot_msg    
    
    .org    0x1fe, 0x90
    .word   0xaa55
