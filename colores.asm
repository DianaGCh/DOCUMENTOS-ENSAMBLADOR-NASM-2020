
; PROYECTO FINAL DE SIMULACION
; TEMA: Cambio de colores del texto mediante menu
; NOMBRE: Yulissa Torres Quezada
; REVISION:  28 de Agosto, 12h30
; DESCRIPCION: Cambio de colores mediante la seleccion de la opcion de un menu para un texto ingresado por consola.
;              ESte cambio se logra mediante la variable ESC.

%macro imprimir 2
    mov eax, 4
    mov ebx, 2
    mov ecx, %1
    mov edx, %2
    int 80H
%endmacro

%macro leer 2
    mov eax, 3
    mov ebx, 2
    mov ecx, %1
    mov edx, %2
    int 80H
%endmacro


section .data
    
    nombre_ent db 10, ' Ingrese un nombre: '
    len_nombreent equ $-nombre_ent

    msj_presentar db 10, ' Nombre en color: '
    len_presentar equ $-msj_presentar

    msj_Menu db ' Seleccione el color a presentar:',10, 10 , '   0.Negro',10, '   1.Rojo',10, '   2.Verde',10, '   3.Amarillo',10, '   4.Azul',10, '   5.Magenta',10, '   6.Cian',10, '   7.Multiple',10,  '   8.Salir',10, 10, ' Ingrese una opcion: '
    len_MsjMenu equ $-msj_Menu

    nombre_sal db 0x1b, '[30m                                                                               '
    len_nombresal equ $-nombre_sal

    nombre_dif db 0x1b, '[31m    ',0x1b, '[32m     ',0x1b,'[33m     ',0x1b, '[34m     ',0x1b,'[34m     ',0x1b, '[35m     ',0x1b,'[36m     ',0x1b, '[37m     '
    len_nombredif equ $-nombre_dif


section .bss
	opcion resb 1
    nombre resb 100
    aux resb 1
    aux1 resb 1
    

section .text
    global _start
    
_start:

    imprimir msj_Menu, len_MsjMenu 

    leer opcion, 2   ;recoje el valor del color a asignar
    
    imprimir nombre_ent, len_nombreent

    leer nombre, 100

compararOpcion:
    mov bl, [opcion]
    sub bl, '0'

    cmp bl, 8
    jz salir

    cmp bl, 7
    jb imprimirColor
    jz imprimirColores

    jmp salir 

salir:
    mov rax, 1
    int 80H 
    
imprimirColor:
    mov al, [opcion]
    sub al, '0'
    add al, '0'

    mov [nombre_sal + 3], al

    mov rax, -1
    mov [aux], rax
    mov rcx, len_nombresal -1

ciclo:  ;lee una cadena mas grande

    push rcx
    mov rax, [aux]
    inc rax
    mov [aux], rax

    mov ebx, [nombre + rax]
    add rax, 5
    mov [nombre_sal + rax], rbx

finCiclo: 
    pop rcx
    loop ciclo

	imprimir msj_presentar, len_presentar

    imprimir nombre_sal, len_nombresal

    jmp salir

imprimirColores:
    mov rbx, 0
    mov rcx, 0
    mov rax, 5

cambioColores:
    mov rbx, 0
    mov bl, [nombre + rcx]
    mov [nombre_dif + rax], bl
    inc rcx
    add rax, 10
    cmp rcx, 8
    jb cambioColores

    imprimir msj_presentar, len_presentar
    imprimir nombre_dif, len_nombredif
    jmp salir
