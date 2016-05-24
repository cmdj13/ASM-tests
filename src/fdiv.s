sys_read  equ 3
stdin     equ 2

section .data
    msg_prompt db "Enter two integers for a floating point division.", 10, 0
    msg_res db 10, "Result: %.2f.", 10, 0
    msg_form db "%d %d", 0

section .bss
    a resq 1
    b resq 1
    res resq 1

section .text:
    extern printf
    extern scanf
    global main

main:
    push ebp
    mov ebp, esp
    push ebx
    push esi
    push edi

    push msg_prompt
    call printf
    add esp, 4

    push b
    push a
    push msg_form
    call scanf
    add esp, 12

    mov eax, [a]
    mov [esp], eax
    fild qword [esp]
    mov eax, [b]
    mov [esp], eax
    fild qword [esp]
    fdivp st1, st0
    fstp qword [esp]

    push msg_res
    call printf

    pop edi
    pop esi
    pop ebx
    mov esp, ebp
    pop ebp
    ret