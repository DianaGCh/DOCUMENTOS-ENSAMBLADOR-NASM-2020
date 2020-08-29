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

    msj db 10,"Ok Polisha:"
    tam_m equ $ - msj

    new_line db " "
       
section .bss
    cont resb 1
section .text
        global _start
_start:

    mov ecx, 9
ciclo:
    push cx
    add ecx, '0'
    mov [cont], ecx

    escribir msj, tam_m
    escribir cont, 1

    pop cx
    
    loop ciclo

salir: 
	mov eax,1
	int 80h
