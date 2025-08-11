global _start

section .data
    addr db "yellow"

section .text
_start:
    mov [addr], byte 'H'
    mov [addr+5], byte '!'
   mov [addr+6], byte 0x0A   ; newline
    mov eax, 4  ;sys_write system call, it is the system call number for write
    mov ebx, 1  ; stdout file descriptor
    mov ecx, addr ; bytes to write
    mov edx, 7  ; number of bytes to write, 6 chars + 1 \n
    int 0x80    ; perform system call
    mov eax, 1  ; sys_exit system call
    mov ebx, 0  ; exit status is 0
    int 0x80

_gay:
    ; db is 1 byte
    name1 db "string"
    name2 db 0xff
    name3 db 100
    ; dw is 2 bytes
    name4 dw 1000
    ; dd  is 4 bytes
    name5 dd 100000