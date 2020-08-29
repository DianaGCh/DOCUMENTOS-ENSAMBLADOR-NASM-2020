%macro escribir 2
  mov eax, 4
	mov ebx, 1
	mov ecx, %1
	mov edx, %2
	int 0x80
%endmacro

section .data
    msj db 10, 'Ingrese un texto de maximo 25 caracteres', 10
    len EQU $ - msj

    msj2 db 10, 'Datos guardados en el archivo', 10
    len2 EQU $ - msj2

    msj3 db 10, 'Carpeta Creada con exito', 10
    len3 EQU $ - msj3

    pathcreate db '/home/user/Documentos/SEXTO/Ensamblador/prueba', 0
    lenpathcreate EQU $ - pathcreate

    pathwrite db '/home/user/Documentos/SEXTO/Ensamblador/prueba/prueba.txt', 0
    lenpath EQU $ - pathwrite

section .bss
    texto resb 10
    cont resb 10
    idarchivowrite resd 1

section .text
    global _start

_start:
    ; pide y lee el texto que va dentro del archivo
    escribir msj, len

    mov eax, 03
    mov ebx, 02      ; entrada estandar. (0,1,2 ) => entrada por teclado
    mov ecx, texto
    mov edx, 25
    int 0x80


    ; crear carpeta

    mov eax, 39           ;servicio para crear directorio
    mov ebx, pathcreate   ;servicio de direccion del directorio
    mov ecx, 0x1FF        ;permisos de 777 octal, de lectura, escritura y ejecución
    int 0x80              ; igual al int 80H

    ; mensaje de que se creo la carpeta
    escribir msj3, len3

    ; escritura del archivo
    ; apertura del archivo
    mov eax, 8      ;servicio para crear y escribir en archivo
    mov ebx, pathwrite   ;servicio de direccion del archivo
    mov edx, 2        ; modo de acceso, write and read = 2
    mov ecx, 0x1FF    ;permisos de 777 octal
    int 0x80        ; igaul al int 80H

    ; verificamos si el path es correcto o si existe
    test eax, eax   ; test es un and sin modificar sus operandos, solo modifica  banderas
    jz salir

    ; **** archivo sin porblemas(excepciones) ****
    mov dword [idarchivowrite], eax  ; respaldo el id del archivo


writeText:
    ; escribimos el texto en el archivo
    mov eax, 4
    mov ebx, [idarchivowrite]      ; entrada estandar
    mov ecx, texto
    mov edx, 25
    int 0x80

    escribir msj2, len2

cerrarArchivo:
    ;*****   cerrar del archivo ***********************
    mov eax, 6              ;servicio para cerrar el archivo
    mov ebx, [idarchivowrite]    ;servicio de direccion del archivo
    mov ecx, 0              ; no se necesita modo de acceso
    mov edx, 0x1FF          ; no se necesita permisos
    int 0x80                ; igaul al int 80H

salir:
    mov eax, 1
    mov ebx, 0
    int 80H
