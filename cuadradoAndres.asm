;Alberto Ortega
;cuadrado de asteriscos
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

    asterisco db "*"

    msje db "",10

    new_line db " "
       
section .bss
    
section .text
        global _start
_start:

    mov cx, 5
    mov dx, 5

princip:
	cmp cx,0
	jg mostrar
	je exam 


mostrar:
	push cx
	push dx
	escribir asterisco, 1
    escribir new_line,1
	pop dx
	pop cx

	dec cx
	jmp princip
	
	dec dx

	push dx
	;escribir msje, 1
	pop dx

	mov cx,5

	cmp dx,0
	jg princip
	je salir


salir: 
	mov eax,1
	int 80h
