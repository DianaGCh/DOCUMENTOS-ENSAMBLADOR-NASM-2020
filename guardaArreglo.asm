section .data
	msj1 db 'Ingrese 5 numeros y presione enter',0xA
	len1 equ $-msj1
	archivo1 db "/home/user/Documentos/SEXTO/Ensamblador/arreglo1.txt"
	archivo2 db "/home/user/Documentos/SEXTO/Ensamblador/resultado.txt",0

	arreglo db 0,0,0,0,0
	len_arreglo equ $-arreglo
	
section .bss
	dato resb 2
	texto resb 30
	idarchivo resd 1
	oM resb 3
	
section .text

leetecla:
	mov eax,3
	mov ebx,0
	mov edx,10
	int 80h
	ret
	
	global _start

_start:
	;se define el arreglo en los registros indices
	mov esi,arreglo		;indice de fuente
	mov edi,0			;indice de destino


	mov eax, 4
	mov ebx, 1
	mov ecx, msj1
	mov edx, len1
	int 80h

leer:
	mov eax,3
	mov ebx,0
	mov ecx,dato
	mov edx,2
	int 80h

	mov al, [dato]
	sub al,'0'			; se convierte cadena a decimal

	mov [esi],al		;en esi se guardo la direccion del arreglo

	add edi,1			;se incrementa en 1 edi
	add esi,1			;se increemnta en 1 esi

	cmp edi,len_arreglo
	jb leer 			;jb es cuando el carry se activa

	mov ecx, 0
	



imprimir:
	push rcx
	mov al, [arreglo+ecx]
	add al, '0'
	mov [dato],al
	sub al, '0'

	mov eax, 4
	mov ebx, 1
	mov ecx, dato
	mov edx, 2
	int 80h

	pop rcx
	inc ecx
	cmp ecx, len_arreglo
	jb imprimir
	
	;**************escribe archivo*******************
escribirArchivo:
	mov eax,8
	mov ebx, archivo1
	mov edx,777h
	int 0x80

	test eax,eax
	jz salir
	mov dword[idarchivo],eax
	;escribir msj2,len_msj2

	mov ecx,dato
	;call leetecla

	mov eax,4
	mov ebx,[idarchivo]
	mov edx,dato
	mov edx,10
	int 0x80
	
;**********leer archivo**********
    mov eax, 5		
	mov ebx, archivo2	; EBX: la dirección de una cadena de caracteres terminada en nulo.
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
	
salir:
	mov eax,1
	mov ebx,1
	int 80h
