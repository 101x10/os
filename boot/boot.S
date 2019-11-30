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

    movw $0xb800, %ax
    movw %ax, %gs

    #####################################################
    #   写显卡内存实现字符串打印
    #   显卡内存基地址: 0xb8000 
    #####################################################
    movw $boot_msg, %si
    movw len, %cx

    movw $0x540, %di
print_char:
    movb (%si), %al     # 待显示字符
    movb $0x04, %ah     # 显示属性
    movw %ax,   %gs:(%di)
    addw $2,    %di
    incw %si
    decw %cx            # 显示字符个数减1
    jnz print_char

1:
    jmp 1b  

boot_msg:
    .asciz  "Boot Loading..."
len:
    .int    . - boot_msg    
    
    .org    0x1fe, 0x90
    .word   0xaa55
