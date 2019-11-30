
obj/boot/boot.out：     文件格式 elf32-i386


Disassembly of section .text:

00007c00 <start>:
#include <inc/boot.h>

.code16
.global start
start:
    xorw %ax, %ax
    7c00:	31 c0                	xor    %eax,%eax
    movw %ax, %ds
    7c02:	8e d8                	mov    %eax,%ds
    movw %ax, %es
    7c04:	8e c0                	mov    %eax,%es
    movw %ax, %fs
    7c06:	8e e0                	mov    %eax,%fs
    movw %ax, %ss
    7c08:	8e d0                	mov    %eax,%ss
    movw $BOOTSECT_ADDR, %sp
    7c0a:	bc 00 7c bd 24       	mov    $0x24bd7c00,%esp
    #####################################################
    #   INT 10, 13 打印字符串
    #       BP: 待打印字符串首地址
    #       CX: 待打印字符串长度
    #####################################################
    movw $boot_msg, %bp
    7c0f:	7c 8b                	jl     7b9c <start-0x64>
    movw len, %cx
    7c11:	0e                   	push   %cs
    7c12:	34 7c                	xor    $0x7c,%al

    movb $0x13, %ah
    7c14:	b4 13                	mov    $0x13,%ah
    movb $0x01, %al 
    7c16:	b0 01                	mov    $0x1,%al
    movb $0x00, %bh
    7c18:	b7 00                	mov    $0x0,%bh
    movb $0x02, %bl
    7c1a:	b3 02                	mov    $0x2,%bl
    movb $0x0a, %dh     # row coordinate
    7c1c:	b6 0a                	mov    $0xa,%dh
    movb $0x18, %dl     # column coordinate
    7c1e:	b2 18                	mov    $0x18,%dl
    
    int $0x10
    7c20:	cd 10                	int    $0x10

1:
    jmp 1b  
    7c22:	eb fe                	jmp    7c22 <start+0x22>

00007c24 <boot_msg>:
    7c24:	42                   	inc    %edx
    7c25:	6f                   	outsl  %ds:(%esi),(%dx)
    7c26:	6f                   	outsl  %ds:(%esi),(%dx)
    7c27:	74 20                	je     7c49 <len+0x15>
    7c29:	4c                   	dec    %esp
    7c2a:	6f                   	outsl  %ds:(%esi),(%dx)
    7c2b:	61                   	popa   
    7c2c:	64 69 6e 67 2e 2e 2e 	imul   $0x2e2e2e,%fs:0x67(%esi),%ebp
    7c33:	00 

00007c34 <len>:
    7c34:	10 00                	adc    %al,(%eax)
    7c36:	00 00                	add    %al,(%eax)
    7c38:	90                   	nop
    7c39:	90                   	nop
    7c3a:	90                   	nop
    7c3b:	90                   	nop
    7c3c:	90                   	nop
    7c3d:	90                   	nop
    7c3e:	90                   	nop
    7c3f:	90                   	nop
    7c40:	90                   	nop
    7c41:	90                   	nop
    7c42:	90                   	nop
    7c43:	90                   	nop
    7c44:	90                   	nop
    7c45:	90                   	nop
    7c46:	90                   	nop
    7c47:	90                   	nop
    7c48:	90                   	nop
    7c49:	90                   	nop
    7c4a:	90                   	nop
    7c4b:	90                   	nop
    7c4c:	90                   	nop
    7c4d:	90                   	nop
    7c4e:	90                   	nop
    7c4f:	90                   	nop
    7c50:	90                   	nop
    7c51:	90                   	nop
    7c52:	90                   	nop
    7c53:	90                   	nop
    7c54:	90                   	nop
    7c55:	90                   	nop
    7c56:	90                   	nop
    7c57:	90                   	nop
    7c58:	90                   	nop
    7c59:	90                   	nop
    7c5a:	90                   	nop
    7c5b:	90                   	nop
    7c5c:	90                   	nop
    7c5d:	90                   	nop
    7c5e:	90                   	nop
    7c5f:	90                   	nop
    7c60:	90                   	nop
    7c61:	90                   	nop
    7c62:	90                   	nop
    7c63:	90                   	nop
    7c64:	90                   	nop
    7c65:	90                   	nop
    7c66:	90                   	nop
    7c67:	90                   	nop
    7c68:	90                   	nop
    7c69:	90                   	nop
    7c6a:	90                   	nop
    7c6b:	90                   	nop
    7c6c:	90                   	nop
    7c6d:	90                   	nop
    7c6e:	90                   	nop
    7c6f:	90                   	nop
    7c70:	90                   	nop
    7c71:	90                   	nop
    7c72:	90                   	nop
    7c73:	90                   	nop
    7c74:	90                   	nop
    7c75:	90                   	nop
    7c76:	90                   	nop
    7c77:	90                   	nop
    7c78:	90                   	nop
    7c79:	90                   	nop
    7c7a:	90                   	nop
    7c7b:	90                   	nop
    7c7c:	90                   	nop
    7c7d:	90                   	nop
    7c7e:	90                   	nop
    7c7f:	90                   	nop
    7c80:	90                   	nop
    7c81:	90                   	nop
    7c82:	90                   	nop
    7c83:	90                   	nop
    7c84:	90                   	nop
    7c85:	90                   	nop
    7c86:	90                   	nop
    7c87:	90                   	nop
    7c88:	90                   	nop
    7c89:	90                   	nop
    7c8a:	90                   	nop
    7c8b:	90                   	nop
    7c8c:	90                   	nop
    7c8d:	90                   	nop
    7c8e:	90                   	nop
    7c8f:	90                   	nop
    7c90:	90                   	nop
    7c91:	90                   	nop
    7c92:	90                   	nop
    7c93:	90                   	nop
    7c94:	90                   	nop
    7c95:	90                   	nop
    7c96:	90                   	nop
    7c97:	90                   	nop
    7c98:	90                   	nop
    7c99:	90                   	nop
    7c9a:	90                   	nop
    7c9b:	90                   	nop
    7c9c:	90                   	nop
    7c9d:	90                   	nop
    7c9e:	90                   	nop
    7c9f:	90                   	nop
    7ca0:	90                   	nop
    7ca1:	90                   	nop
    7ca2:	90                   	nop
    7ca3:	90                   	nop
    7ca4:	90                   	nop
    7ca5:	90                   	nop
    7ca6:	90                   	nop
    7ca7:	90                   	nop
    7ca8:	90                   	nop
    7ca9:	90                   	nop
    7caa:	90                   	nop
    7cab:	90                   	nop
    7cac:	90                   	nop
    7cad:	90                   	nop
    7cae:	90                   	nop
    7caf:	90                   	nop
    7cb0:	90                   	nop
    7cb1:	90                   	nop
    7cb2:	90                   	nop
    7cb3:	90                   	nop
    7cb4:	90                   	nop
    7cb5:	90                   	nop
    7cb6:	90                   	nop
    7cb7:	90                   	nop
    7cb8:	90                   	nop
    7cb9:	90                   	nop
    7cba:	90                   	nop
    7cbb:	90                   	nop
    7cbc:	90                   	nop
    7cbd:	90                   	nop
    7cbe:	90                   	nop
    7cbf:	90                   	nop
    7cc0:	90                   	nop
    7cc1:	90                   	nop
    7cc2:	90                   	nop
    7cc3:	90                   	nop
    7cc4:	90                   	nop
    7cc5:	90                   	nop
    7cc6:	90                   	nop
    7cc7:	90                   	nop
    7cc8:	90                   	nop
    7cc9:	90                   	nop
    7cca:	90                   	nop
    7ccb:	90                   	nop
    7ccc:	90                   	nop
    7ccd:	90                   	nop
    7cce:	90                   	nop
    7ccf:	90                   	nop
    7cd0:	90                   	nop
    7cd1:	90                   	nop
    7cd2:	90                   	nop
    7cd3:	90                   	nop
    7cd4:	90                   	nop
    7cd5:	90                   	nop
    7cd6:	90                   	nop
    7cd7:	90                   	nop
    7cd8:	90                   	nop
    7cd9:	90                   	nop
    7cda:	90                   	nop
    7cdb:	90                   	nop
    7cdc:	90                   	nop
    7cdd:	90                   	nop
    7cde:	90                   	nop
    7cdf:	90                   	nop
    7ce0:	90                   	nop
    7ce1:	90                   	nop
    7ce2:	90                   	nop
    7ce3:	90                   	nop
    7ce4:	90                   	nop
    7ce5:	90                   	nop
    7ce6:	90                   	nop
    7ce7:	90                   	nop
    7ce8:	90                   	nop
    7ce9:	90                   	nop
    7cea:	90                   	nop
    7ceb:	90                   	nop
    7cec:	90                   	nop
    7ced:	90                   	nop
    7cee:	90                   	nop
    7cef:	90                   	nop
    7cf0:	90                   	nop
    7cf1:	90                   	nop
    7cf2:	90                   	nop
    7cf3:	90                   	nop
    7cf4:	90                   	nop
    7cf5:	90                   	nop
    7cf6:	90                   	nop
    7cf7:	90                   	nop
    7cf8:	90                   	nop
    7cf9:	90                   	nop
    7cfa:	90                   	nop
    7cfb:	90                   	nop
    7cfc:	90                   	nop
    7cfd:	90                   	nop
    7cfe:	90                   	nop
    7cff:	90                   	nop
    7d00:	90                   	nop
    7d01:	90                   	nop
    7d02:	90                   	nop
    7d03:	90                   	nop
    7d04:	90                   	nop
    7d05:	90                   	nop
    7d06:	90                   	nop
    7d07:	90                   	nop
    7d08:	90                   	nop
    7d09:	90                   	nop
    7d0a:	90                   	nop
    7d0b:	90                   	nop
    7d0c:	90                   	nop
    7d0d:	90                   	nop
    7d0e:	90                   	nop
    7d0f:	90                   	nop
    7d10:	90                   	nop
    7d11:	90                   	nop
    7d12:	90                   	nop
    7d13:	90                   	nop
    7d14:	90                   	nop
    7d15:	90                   	nop
    7d16:	90                   	nop
    7d17:	90                   	nop
    7d18:	90                   	nop
    7d19:	90                   	nop
    7d1a:	90                   	nop
    7d1b:	90                   	nop
    7d1c:	90                   	nop
    7d1d:	90                   	nop
    7d1e:	90                   	nop
    7d1f:	90                   	nop
    7d20:	90                   	nop
    7d21:	90                   	nop
    7d22:	90                   	nop
    7d23:	90                   	nop
    7d24:	90                   	nop
    7d25:	90                   	nop
    7d26:	90                   	nop
    7d27:	90                   	nop
    7d28:	90                   	nop
    7d29:	90                   	nop
    7d2a:	90                   	nop
    7d2b:	90                   	nop
    7d2c:	90                   	nop
    7d2d:	90                   	nop
    7d2e:	90                   	nop
    7d2f:	90                   	nop
    7d30:	90                   	nop
    7d31:	90                   	nop
    7d32:	90                   	nop
    7d33:	90                   	nop
    7d34:	90                   	nop
    7d35:	90                   	nop
    7d36:	90                   	nop
    7d37:	90                   	nop
    7d38:	90                   	nop
    7d39:	90                   	nop
    7d3a:	90                   	nop
    7d3b:	90                   	nop
    7d3c:	90                   	nop
    7d3d:	90                   	nop
    7d3e:	90                   	nop
    7d3f:	90                   	nop
    7d40:	90                   	nop
    7d41:	90                   	nop
    7d42:	90                   	nop
    7d43:	90                   	nop
    7d44:	90                   	nop
    7d45:	90                   	nop
    7d46:	90                   	nop
    7d47:	90                   	nop
    7d48:	90                   	nop
    7d49:	90                   	nop
    7d4a:	90                   	nop
    7d4b:	90                   	nop
    7d4c:	90                   	nop
    7d4d:	90                   	nop
    7d4e:	90                   	nop
    7d4f:	90                   	nop
    7d50:	90                   	nop
    7d51:	90                   	nop
    7d52:	90                   	nop
    7d53:	90                   	nop
    7d54:	90                   	nop
    7d55:	90                   	nop
    7d56:	90                   	nop
    7d57:	90                   	nop
    7d58:	90                   	nop
    7d59:	90                   	nop
    7d5a:	90                   	nop
    7d5b:	90                   	nop
    7d5c:	90                   	nop
    7d5d:	90                   	nop
    7d5e:	90                   	nop
    7d5f:	90                   	nop
    7d60:	90                   	nop
    7d61:	90                   	nop
    7d62:	90                   	nop
    7d63:	90                   	nop
    7d64:	90                   	nop
    7d65:	90                   	nop
    7d66:	90                   	nop
    7d67:	90                   	nop
    7d68:	90                   	nop
    7d69:	90                   	nop
    7d6a:	90                   	nop
    7d6b:	90                   	nop
    7d6c:	90                   	nop
    7d6d:	90                   	nop
    7d6e:	90                   	nop
    7d6f:	90                   	nop
    7d70:	90                   	nop
    7d71:	90                   	nop
    7d72:	90                   	nop
    7d73:	90                   	nop
    7d74:	90                   	nop
    7d75:	90                   	nop
    7d76:	90                   	nop
    7d77:	90                   	nop
    7d78:	90                   	nop
    7d79:	90                   	nop
    7d7a:	90                   	nop
    7d7b:	90                   	nop
    7d7c:	90                   	nop
    7d7d:	90                   	nop
    7d7e:	90                   	nop
    7d7f:	90                   	nop
    7d80:	90                   	nop
    7d81:	90                   	nop
    7d82:	90                   	nop
    7d83:	90                   	nop
    7d84:	90                   	nop
    7d85:	90                   	nop
    7d86:	90                   	nop
    7d87:	90                   	nop
    7d88:	90                   	nop
    7d89:	90                   	nop
    7d8a:	90                   	nop
    7d8b:	90                   	nop
    7d8c:	90                   	nop
    7d8d:	90                   	nop
    7d8e:	90                   	nop
    7d8f:	90                   	nop
    7d90:	90                   	nop
    7d91:	90                   	nop
    7d92:	90                   	nop
    7d93:	90                   	nop
    7d94:	90                   	nop
    7d95:	90                   	nop
    7d96:	90                   	nop
    7d97:	90                   	nop
    7d98:	90                   	nop
    7d99:	90                   	nop
    7d9a:	90                   	nop
    7d9b:	90                   	nop
    7d9c:	90                   	nop
    7d9d:	90                   	nop
    7d9e:	90                   	nop
    7d9f:	90                   	nop
    7da0:	90                   	nop
    7da1:	90                   	nop
    7da2:	90                   	nop
    7da3:	90                   	nop
    7da4:	90                   	nop
    7da5:	90                   	nop
    7da6:	90                   	nop
    7da7:	90                   	nop
    7da8:	90                   	nop
    7da9:	90                   	nop
    7daa:	90                   	nop
    7dab:	90                   	nop
    7dac:	90                   	nop
    7dad:	90                   	nop
    7dae:	90                   	nop
    7daf:	90                   	nop
    7db0:	90                   	nop
    7db1:	90                   	nop
    7db2:	90                   	nop
    7db3:	90                   	nop
    7db4:	90                   	nop
    7db5:	90                   	nop
    7db6:	90                   	nop
    7db7:	90                   	nop
    7db8:	90                   	nop
    7db9:	90                   	nop
    7dba:	90                   	nop
    7dbb:	90                   	nop
    7dbc:	90                   	nop
    7dbd:	90                   	nop
    7dbe:	90                   	nop
    7dbf:	90                   	nop
    7dc0:	90                   	nop
    7dc1:	90                   	nop
    7dc2:	90                   	nop
    7dc3:	90                   	nop
    7dc4:	90                   	nop
    7dc5:	90                   	nop
    7dc6:	90                   	nop
    7dc7:	90                   	nop
    7dc8:	90                   	nop
    7dc9:	90                   	nop
    7dca:	90                   	nop
    7dcb:	90                   	nop
    7dcc:	90                   	nop
    7dcd:	90                   	nop
    7dce:	90                   	nop
    7dcf:	90                   	nop
    7dd0:	90                   	nop
    7dd1:	90                   	nop
    7dd2:	90                   	nop
    7dd3:	90                   	nop
    7dd4:	90                   	nop
    7dd5:	90                   	nop
    7dd6:	90                   	nop
    7dd7:	90                   	nop
    7dd8:	90                   	nop
    7dd9:	90                   	nop
    7dda:	90                   	nop
    7ddb:	90                   	nop
    7ddc:	90                   	nop
    7ddd:	90                   	nop
    7dde:	90                   	nop
    7ddf:	90                   	nop
    7de0:	90                   	nop
    7de1:	90                   	nop
    7de2:	90                   	nop
    7de3:	90                   	nop
    7de4:	90                   	nop
    7de5:	90                   	nop
    7de6:	90                   	nop
    7de7:	90                   	nop
    7de8:	90                   	nop
    7de9:	90                   	nop
    7dea:	90                   	nop
    7deb:	90                   	nop
    7dec:	90                   	nop
    7ded:	90                   	nop
    7dee:	90                   	nop
    7def:	90                   	nop
    7df0:	90                   	nop
    7df1:	90                   	nop
    7df2:	90                   	nop
    7df3:	90                   	nop
    7df4:	90                   	nop
    7df5:	90                   	nop
    7df6:	90                   	nop
    7df7:	90                   	nop
    7df8:	90                   	nop
    7df9:	90                   	nop
    7dfa:	90                   	nop
    7dfb:	90                   	nop
    7dfc:	90                   	nop
    7dfd:	90                   	nop
    7dfe:	55                   	push   %ebp
    7dff:	aa                   	stos   %al,%es:(%edi)
