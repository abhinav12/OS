;mov dx, 0xffb6 ; store the value to print in dx

;[org 0x7c00] ; Tell the assembler where this code will be loaded
;call print_hex ; call the function
;jmp end
print_hex:
pusha
mov bx, HEX_OUT ; print the string pointed to
add bx, 5
mov ax, 0
write_char:
  mov cx, dx
	AND cx, 0x000f
  call write_char_to_mem
  SUB bx, 1
  SHR dx, 4
  ADD ax, 1
  cmp ax, 4
  jne write_char

mov bx, HEX_OUT ; print the string pointed to
call print_string ; by BX
popa
ret
jmp end

write_char_to_mem:
pusha
cmp cx, 0
mov [bx], byte '0'
je return
cmp cx, 1
mov [bx], byte '1'
je return
cmp cx, 2
mov [bx], byte '2'
je return
cmp cx, 3
mov [bx], byte '3'
je return
cmp cx, 4
mov [bx], byte '4'
je return
cmp cx, 5
mov [bx], byte '5'
je return
cmp cx, 6
mov [bx], byte '6'
je return
cmp cx, 7
mov [bx], byte '7'
je return
cmp cx, 8
mov [bx], byte '8'
je return
cmp cx, 9
mov [bx], byte '9'
je return
cmp cx, 10
mov [bx], byte 'a'
je return
cmp cx, 11
mov [bx], byte 'b'
je return
cmp cx, 12
mov [bx], byte 'c'
je return
cmp cx, 13
mov [bx], byte 'd'
je return
cmp cx, 14
mov [bx], byte 'e'
je return
cmp cx, 15
mov [bx], byte 'f'
je return
return:
popa
ret
; global variables
end:
jmp $
HEX_OUT: db '0x0000',0

;times 510 -( $ - $$ ) db 0
;dw 0xaa55
