section .data
    msg1 db "Put in two numbers for a rounded division.", 10, 0
    msg2 db "The result is ~%i.", 10, 0
    form db "%d %d", 0

section .bss
	a resq 1
	b resq 1
    res resq 1

section .text
	extern printf
    extern scanf
	global main

main:
    push ebp
    mov ebp, esp
    push ebx
    push esi
    push edi

    push msg1
    call printf
    add esp, 4

    push a
    push b
    push form
    call scanf

    fild dword [b]
    fidiv dword [a]
    fist dword [res]

    push dword [res]
    push msg2
    call printf
    add esp, 4

    pop edi
    pop esi
    pop ebx
    mov esp, ebp
    pop ebp
    ret