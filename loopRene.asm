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
 l1:
	push cx
	push dx
    escribir espacio,1
    pop cx
l2:
    push cx
    escribir asterisco,1
    pop cx
    loop l2
    
salir:
	mov ax,1
	int 80h
  
    
