;Alberto Ortega
;24 de Agosto
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

    msjN db "Ingrese un numero: "
	lenN equ $-msjN

    msjR db "Respuesta: "
	lenR equ $-msjR

    nuevaLinea db "",10

section .bss
    cantidad resb 2
    numero resb 2
    aux resb 2
    respuesta resb 2

section .text
    global _start
_start:


    mov rcx, 3

    mov rdx, 0
    mov [aux], rdx

ciclo:
    push rcx

    escribir msjN, lenN
    leer numero, 2

    mov rax, [numero]
    sub rax, '0'
    mov rcx, rax
    mul rcx

    mov rcx, [aux]
    add rax, rcx

    mov [aux], rax


    add rax, '0'
    mov [respuesta], rax
    

    pop rcx
    loop ciclo

    
    escribir respuesta, 1
    escribir nuevaLinea, 1


salir:
    mov rax, 1
    int 80h
