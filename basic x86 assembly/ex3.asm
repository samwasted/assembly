global _start
section .text
_start:
    mov ecx, 99 ;set ecx to 99
    mov ebx, 42 ;exit status is 42
    mov eax, 1  ; sys_exit system call
    ; jmp skip    ; jump to skip label
    cmp ecx, 100
    jl skip     ; jump if less than
    mov ebx, 13 ; exit status is 13

skip:
    int 0x80

; we skip the mov ebx,13 line, output status is 42

_gay:
    je A, B ; jump if equal
    jne A, B ; jump if not equal
    jg A, B  ;jump if greater
    jge A,B ; jump if greater or equal
    jl A, B ; jump if less
    jle A, B ; jump if less or equal
