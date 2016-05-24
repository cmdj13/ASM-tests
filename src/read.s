sys_exit  equ 1
sys_read  equ 3
sys_write equ 4
stdout    equ 1
stdin     equ 2
no_error  equ 0

section .data
   userMsg db 'Enter a string (max. 5 characters): '
   lenUserMsg equ $ - userMsg
   dispMsg db 'You have entered: '
   lenDispMsg equ $ - dispMsg                 

section .bss
   num resb 6
	
section .text
   global _start
	
_start:
   mov eax, 4
   mov ebx, stdout
   mov ecx, userMsg
   mov edx, lenUserMsg
   int 80h

   mov eax, sys_read
   mov ebx, stdin
   mov ecx, num  
   mov edx, 6
   int 80h

   mov eax, sys_write
   mov ebx, stdout
   mov ecx, dispMsg
   mov edx, lenDispMsg
   int 80h  

   mov eax, sys_write
   mov ebx, stdout
   mov ecx, num
   mov edx, 6
   int 80h

   mov eax, sys_exit
   mov ebx, no_error
   int 80h