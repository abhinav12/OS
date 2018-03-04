print_string:
	pusha
	mov ah, 0x0e
	print_next_character:
	mov al, [bx]
	cmp al, 0
	je exit
	int 0x10
	add bx, 1
	jmp print_next_character

	exit:
		popa
		ret
