EXTERN printf

section .data
	a: dd 5
	msg: db "a = %d", 10, 0

section .text
	global main

main:
    push dword [a]
    push dword msg
    call printf
    add esp, 8

	mov eax, 1
	mov ebx, 0
	int 80h