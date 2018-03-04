mov ah, 0x0e
[org 0x7c00]
mov al, [hello_world]
int 0x10
hello_world:
	db 'Hello World',0
jmp $
times 510 -( $ - $$ ) db 0
dw 0xaa55
