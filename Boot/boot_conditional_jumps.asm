mov bx , 30
cmp bx, 4
jle label_1
cmp bx, 40
jl label_2
mov al, 'C'
jmp print
label_1:
	mov al, 'A'
  jmp print

label_2:
  mov al, 'B'
  jmp print

print:
	mov ah , 0x0e 
	int 0x10 
	jmp $	

times 510 -( $ - $$ ) db 0
dw 0xaa55
