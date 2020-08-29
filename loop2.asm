;genera hola y el numero de repeticiones
%macro escribir 2 
        mov eax, 4
        mov ebx, 1
        mov ecx, %1
        mov edx, %2
        int 80h
%endmacro

%macro leer 2 
        mov eax, 3
        mov ebx, 0
        mov ecx, %1
        mov edx, %2
        int 80h
%endmacro


section .data
	saludo db 'Hola',10
	len_saludo equ $-saludo
section .bss
	num resb 1

section .txt
	global _start

_start:
	mov ecx, 9

for:
	push rcx
	add ecx,"0"
	mov [num],ecx
	escribir saludo,len_saludo
	escribir num, 1
	pop rcx
	loop for 

 


salir:
	mov eax, 1
	int 80h 
