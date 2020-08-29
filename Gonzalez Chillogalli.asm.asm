; Diana Gabriela Gonzalez
;6to CIS
; Ing: Rene GUaman
;prueba ensamblador

%macro escribe 2
	mov eax, 4
	mov ebx, 1
	mov ecx, %1
	mov edx, %2
	int 0x80
%endmacro

segment .data
	msg2 db "Leer desde un archivo :",0xA
	len2 equ $-msg2
	
	msg3 db "archivo guardado",10
	len3 equ $-msg3
	
	 array db 0,0,0,0,0,0,0,0
    lenArray equ $ -array
	
	archivo db "/home/user/Documentos/SEXTO/Ensamblador/datos.txt",0
	resultado db "/home/user/Documentos/SEXTO/Ensamblador/resultado.txt",0
segment .bss
	texto resb 30
	idarchivo resd 1
	dato resb 10
	 aux resb 1
    value resb 1
    cont resb 1
segment .text
leetecla:
	
	global _start

_start:
;*********** leer documento **********************
	mov eax, 5		
	mov ebx, archivo	; EBX: la dirección de una cadena de caracteres terminada en nulo.
	mov ecx, 0	; ECX: Modo de acceso.
	mov edx, 0	; EDX: permisos al archivo, si se abre creándolo.
	int 0x80


	test eax, eax	; instrucción de comparación realiza la operación lógica “Y” de dos operandos, 
	jz salir
	mov dword[idarchivo], eax

	escribe msg2, len2

	mov eax, 3		; Servicio 3: lectura (read). Los parámetros necesarios son:
	mov ebx, [idarchivo]	; EBX: unidad de entrada (0: entrada estándar).
	mov ecx, texto		; ECX: Puntero a un área de memoria donde se dejarán los caracteres obtenidos.
	mov edx, 13		; EDX: Número máximo de caracteres a leer.
	int 0x80

	escribe texto, 13

	mov eax, 6		; STD	POSIX	{ int close(int fd); }
	mov ebx, [idarchivo]
	mov ecx, 0
	mov edx, 0
	int 0x80
	
	;************* arreglo*************
ciclo:
	mov esi, array
    mov edi, 0
    mov eax, [esi]
    mov [aux], eax
    mov bl, 0
    mov [cont], bl
    mov cl, 0
    mov dl, 0
	
;************escrbir documento*********************

	mov eax,8
	mov ebx, resultado
	mov edx,777h
	int 0x80

	test eax,eax
	jz salir
	mov dword[idarchivo],eax
	escribe msg3,len3

	mov ecx,texto
	;call leetecla

	mov eax,4
	mov ebx,[idarchivo]
	mov edx,texto
	mov edx,10
	int 0x80

salir:
	mov eax, 1
	xor ebx, ebx
	int 0x80
