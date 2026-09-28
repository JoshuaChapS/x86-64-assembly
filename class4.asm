global _start

section .text
_start:
    mov rax, 1
    mov rdi, 1
    mov rsi, message
    mov rdx, len
    syscall

read:
    mov rax, 0
    mov rdi, 0
    mov rsi, buffer
    mov rdx, bufferlen
    syscall

echo:
    mov rbx, rax

    mov rax, 1
    mov rdi, 1
    mov rsi, echomssg
    mov rdx, len2

    syscall

    mov rax, 1
    mov rsi, buffer
    mov rdx, rbx

    syscall

end:
    mov rax, 60
    mov rdi, 0
    syscall

section .data
message db "Say something: ", 10
len equ $ - message
echomssg db "Echo: " , 10
len2 equ $ - echomssg
bufferlen equ 64

section .bss
buffer resb bufferlen