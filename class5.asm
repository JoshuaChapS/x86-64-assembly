global _start

section .text
_start:
    mov rsi, message
    mov rdx, len
    call print

    mov rsi, message2
    mov rdx, len2
    call print



end:
    mov rax, 60
    mov rdi, 0
    syscall

print:
    mov rax, 1
    mov rdi, 1
    syscall
    ret



section .data
message db "Hello, World", 10
len equ $ - message

message2 db "Bye, World", 10
len2 equ $ - message2