; Diana Gabriela Gonzalez Chillogalli
; Sexto ciclo
;impresion de un cuadrado de  asteriscos loop
%macro escribir 2 
        mov eax, 4
        mov ebx, 1
        mov ecx, %1
        mov edx, %2
        int 80h
%endmacro

section .data

    asterisco db "*"

    espacio db "",10
    
       
section .bss
    
section .text
        global _start
_start:

    mov cx, 9
    mov dx, 9

verificar1:
	
	push cx		
	push bx
	escribir espacio,1
	
	pop cx
	mov bx, cx
	push bx
	

Verificar2:
	push cx		
	escribir asterisco,1
	pop cx
	loop Verificar2

	pop bx
	pop cx
	inc bx
	loop verificar1			
	
	mov ax, 1
	int 80h


