section .data
	msg db "Number of seconds since Jan 01 1970: %d.", 10, 0

section .text
	extern printf
	global main

main:
    push ebp
    mov ebp, esp
    push ebx
    push esi
    push edi

    mov eax, 13
    push eax
    mov ebx, esp
    int 0x80

    push msg
    call printf
    
    add esp, 8   

    pop edi
    pop esi
    pop ebx
    mov esp, ebp
    pop ebp
    ret