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
		saludo db "Hola",10
		len_saludo equ $-saludo


section .text
		global _start
_start:
		mov cx,10
	
for:
		push cx			;agregamos una pila para guardar el valor
		;escribir saludo,len_saludo
		mov ax, 4
        mov bx, 1
        mov cx, saludo
        mov dx, len_saludo
        int 80h
        pop cx
        loop for 			;por cda ciclo decrementa cx
								;los ciclos se ejecutan hasta que cx=0
		
salir:
		mov ax,1
		int 80h
