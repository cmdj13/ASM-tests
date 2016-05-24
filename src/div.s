sys_read  equ 3
sys_write equ 4
stdout    equ 1
stdin     equ 2

section .data
	prompt db "Enter two 1-digit numbers for an integer division.", 10, 0
	result db 10, "%i / %i = %i.", 10, 0

section .bss
	a resb 4
	b resb 4
	c resb 4

section .text
	extern printf
	global main

main:
    push ebp
    mov ebp, esp
    push ebx
    push esi
    push edi

    push prompt
    call printf

    mov eax, sys_read
    mov ebx, stdin
    mov ecx, a
    mov edx, 1
    int 80h

    sub dword [a], 0x30

    mov eax, sys_read
    mov ebx, stdin
    mov ecx, b
    mov edx, 1
    int 80h

    mov eax, sys_read
    mov ebx, stdin
    mov ecx, b
    mov edx, 1
    int 80h

    sub dword [b], 0x30

    mov dx, 0
    mov ax, [a]
    div dword [b]
    mov [c], ax
    push dword [c]
    push dword [b]
    push dword [a]
    push result
    call printf

    mov eax, sys_read
    mov ebx, stdin
    mov ecx, b
    mov edx, 1
    int 80h
    
    add esp, 40

    pop edi
    pop esi
    pop ebx
    mov esp, ebp
    pop ebp
    ret