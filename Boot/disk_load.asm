; load DH sectors to ES:BX from drive DL
disk_load :
pusha
push dx ; Store DX on stack so later we can recall
; how many sectors were request to be read ,
; even if it is altered in the meantime
mov ah , 0x02 ; BIOS read sector function
mov al , dh ; Read DH sectors
mov ch , 0x00 ; Select cylinder 0
mov dh , 0x00 ; Select head 0
mov cl , 0x02 ; Start reading from second sector ( i.e.
; after the boot sector )
int 0x13 ; BIOS interrupt
jc disk_error_1 ; Jump if error ( i.e. carry flag set )
pop dx ; Restore DX from the stack
cmp dh , al ; if AL ( sectors read ) != DH ( sectors expected )
jne disk_error_2 ; display error message
popa 
ret
disk_error_1 :
mov bx , DISK_ERROR_MSG_1
call print_string
jmp $
disk_error_2 :
mov bx , DISK_ERROR_MSG_2
call print_string
jmp $
; Variables
DISK_ERROR_MSG_1 db "Disk read error! cf set to 1" , 0
DISK_ERROR_MSG_2 db "Disk read error! expected number of sectors not read " , 0
