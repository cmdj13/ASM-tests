sys_exit  equ 1
sys_write equ 4 
stdout    equ 1
no_error  equ 0

%macro write 1
	mov dword [char], %1
	call WRITE
%endmacro

%macro writeln 1
	mov dword [char], %1
	call WRITE
	mov dword [char], 0xA
	call WRITE
%endmacro

section .bss
	char: resb 1

section .text
	global _start

_start:
	mov edi, 0

lp:
	inc edi
	add edi, 0x40
	write edi
	sub edi, 0x40
	cmp edi, 26
	jne cnt
	writeln 0

	mov eax, sys_exit
	mov ebx, no_error
	int 80h

cnt:
	write 0xB
	jmp lp

WRITE:
	mov eax, sys_write
	mov ebx, stdout
	mov ecx, char
	mov edx, 1
	int 80h
	ret