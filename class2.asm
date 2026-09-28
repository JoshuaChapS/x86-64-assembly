global _start

section .text
_start:
    mov rax, 1
    mov rdi, 1
    mov rsi, message
    mov rdx, len

    syscall

end:
    mov rax, 60
    mov rdi, 0
    syscall

section .data
message db "Hello, World", 10
len equ $ - message