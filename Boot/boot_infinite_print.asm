mov ah, 0x0e

loop:
	mov al, 'H'
	int 0x10
	jmp loop

times 510-($-$$) db 0
dw 0xaa55
