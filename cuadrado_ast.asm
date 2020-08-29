; Diana Gabriela Gonzalez Chillogalli
; Sexto ciclo
;impresion de un cuadrado de  asteriscos
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
    mov dx, 5

verificar:
	
	cmp cx,0
	jg imprimir
	je verificar2
	

imprimir:
	push cx
	push dx
    escribir asterisco,1
	pop dx
	pop cx
	loop verificar

	
	
verificar2:
   
	dec dx
	push dx
    escribir espacio,1
	pop dx
	mov dx,cx
	cmp dx,9
	jg verificar
	je salir

	
salir: 
	mov eax,1
	int 80h
