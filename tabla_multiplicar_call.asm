;tabla de multiplicar
;Diana Gabriela Gonzalez Chillogalli
;6to A

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
        mov edx, %2;
        int 80h
%endmacro
section .data

    msj db "Ingrese el número de la tabla que desea:",10
    tam_m equ $ - msj

    new_line db 10," "

    mensajeprod db " * "
    lenprod equ $ - mensajeprod

    mensajeproduc db " = "
    lenprodx equ $ - mensajeproduc
       
section .bss
    a resb 2
    b resb 2
    c resb 2
    num resb 3

section .text
        global _start
_start:
    call mensaje
    call lectura


    mov al, [num]
    sub al, '0'
    add al, '0'
    mov [a], ax
    mov cx, 1
    
    
ciclo:
    push cx
    mov ax, [a]
    sub ax, '0'
    mul cx
    add ax, '0'
    mov [c], ax
    add cx, '0'
    mov [b], cx
    ;escribir a, 1
    call imprimirNumero
    escribir mensajeprod, lenprod
    ;escribir b, 1
    call imprimirNumero_b
    escribir mensajeproduc, lenproduc
    ;escribir c, 1
    call imprimirNumero_c
    escribir new_line,1
    pop cx
    inc cx
    cmp cx, 10
    jnz ciclo
	
;**********CALL**************	
 imprimirNumero:
	  mov eax, 4
       mov ebx, 1
       mov ecx, a
       mov edx, 1
       int 80h
       ret
 imprimirNumero_b:
	   mov eax, 4
       mov ebx, 1
       mov ecx, b
       mov edx, 1
       int 80h
       ret
 
 imprimirNumero_c:
	   mov eax, 4
       mov ebx, 1
       mov ecx, c
       mov edx, 1
       int 80h
       ret
       
 mensaje:
		;escribir msj,tam_m
		;leer num,2
	   mov eax, 4
       mov ebx, 1
       mov ecx, msj
       mov edx,  tam_m
       int 80h
       ret
       
 lectura:
	   mov eax, 3
       mov ebx, 0
       mov ecx, num
       mov edx,2
       int 80h
		ret
		
salir: 
	mov eax,1
	int 80h
