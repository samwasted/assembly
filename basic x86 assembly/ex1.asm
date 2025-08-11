global _start
_start:
    mov eax, 1 
    ; general purpose register eax 
    mov ebx, 42
    ; pass to ebx register 
    sub ebx, 29
    ; subtracts from ebx

    int 0x80 
    ; 0x80 is the interrupt handler for system calls
    ; we are doing system exit value 1, status 42

_gay:
    mov ebx, 123 ; ebx = 123
    mov eax, ebx ; eax = ebx
    add ebx, ecx ; ebx += ecx
    sub ebx, edx ; ebx -= edx
    mul ebx      ; eax *= ebx
    div edx      ; eax /= edx
; mul and div always apply to eax
