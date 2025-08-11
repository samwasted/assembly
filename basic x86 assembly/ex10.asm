global main ; main fn is accessible to the linker
extern printf

section .data
    msg db "Testing %i...", 0x0a, 0x00

section .text
main:
    push ebp
    mov ebp, esp
    sub esp, 16          ; Align stack to 16-byte boundary
    push 123             ; Push argument: integer 123
    push msg             ; Push argument: format string
    call printf          ; Call printf
    add esp, 8           ; Clean up the stack (2 arguments * 4 bytes)
    mov eax, 0           ; Return 0 (success)
    mov esp, ebp         ; Restore stack pointer
    pop ebp
    ret

section .note.GNU-stack

; nasm -f elf32 ex10.asm -o ex10.o
; gcc -m32 ex10.o -o ex10
; ./ex10