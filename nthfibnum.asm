; Print n-th (n >= 1) fibonacci number (1st - 1)

section .data
    prompt db 'Enter n: ', 0
    formatInt db '%d', 0
    inp times 8 db 0
    fib1 times 8 db 0
    fib2 times 8 db 0

extern printf, scanf
global main
section .text
main:
    sub rsp, 48
   
    mov rax, 1
    mov [rel fib2], rax
    mov rcx, prompt
    call printf
    lea rcx, [rel formatInt]
    lea rdx, [rel inp]
    call scanf
    mov rcx, [rel inp]

calcfib:
    mov rax, [rel fib1]
    mov rbx, [rel fib2]
    add rax, rbx
    mov [rel fib1], rbx
    mov [rel fib2], rax
    loop calcfib
   
    lea rcx, [rel formatInt]
    mov rdx, [rel fib1]
    call printf

    add rsp, 48
    xor rax, rax
    ret
