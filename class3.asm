global _start

section .text
_start:
    mov rbx, number
    mov rdi, 1
loop_one:
    cmp rbx, 0
    je new_line

    mov rax, 1
    mov rsi, message
    mov rdx, len
    syscall

    dec rbx
    
    jmp loop_one
    
new_line:
    mov rax, 1
    mov rsi, newline
    mov rdx, len2
    syscall

end:
    mov rax, 60
    mov rdi, 0
    syscall

section .data
number equ 5
message db "*"
len equ $ - message
newline db 10
len2 equ $ - newline