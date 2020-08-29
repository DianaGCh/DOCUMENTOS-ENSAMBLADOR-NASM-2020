%macro escribir 2
	mov eax, 4
	mov ebx, 1
	mov ecx, %1
	mov edx, %2
	int 0x80
%endmacro
%macro leer 2
	mov eax, 3
	mov ebx, 0
	mov ecx, %1
	mov edx, %2
	int 80h
%endmacro

segment .data
	titulo db "*------[ Menu opciones de ARCHIVO ]-------*",10
	lent equ $ -titulo
	
	menu db "1.Escribir Archivo", 10,"2.Leer archivo",10,"3. Salir", 10 ,"**opcion**",10
	len_menu equ $-menu
	
	msj2 db "escrbir archivo",10
	len_msj2 equ $-msj2
	
	msj3 db "El texto guardado es: ",10
	len_msj3 equ $-msj3
	newline db " ",10
	datos db "/home/user/Documentos/SEXTO/Ensamblador/datos.txt"
	archivo db "/home/user/Documentos/SEXTO/Ensamblador/resultado.txt"
segment .bss
	texto resb 30
	idarchivo resd 1
	oM resb 3

segment .text
leetecla:
	mov eax,3
	mov ebx,0
	mov edx,10
	int 80h
	ret
	
	global _start

_start:

menuOpciones:
	escribir titulo, lent
	escribir newline,1
	escribir menu, len_menu
	leer oM,2 
	
	mov al,[oM]
	sub al,'0'
	cmp al, 1
	je escribirArchivo
	cmp al,2
	je leer_archivo
	cmp al,3
	je salir
	
escribirArchivo:
	mov eax,8
	mov ebx, archivo
	mov edx,777h
	int 0x80

	test eax,eax
	jz salir
	mov dword[idarchivo],eax
	escribir msj2,len_msj2

	mov ecx,texto
	call leetecla

	mov eax,4
	mov ebx,[idarchivo]
	mov edx,texto
	mov edx,10
	int 0x80
	
	jmp menuOpciones
	
	
; ************************** abrir el archivo **************************
leer_archivo:
	mov eax, 5		;servicio para crear archivos, trabajar con archivos    ;operación de open
	mov ebx, datos	; dirección del archivo
	mov ecx, 0		
	mov edx, 777h
	int 80h
	
	test eax, eax		
	jz menuOpciones
	
	mov dword [idarchivo], eax

	escribir msj3, len_msj3
	escribir newline, 1
	
	; ************************** leer el archivo **************************
	mov eax, 3
	mov ebx, [idarchivo]	
	mov ecx, texto		
	mov edx, 15
	int 80h
	
	escribir texto, 15
	
	; ************************** cerrar el archivo **************************
	mov eax, 6		; cerrar
	mov ebx, [idarchivo]	
	mov ecx, 0		
	mov edx, 0
	int 80h
	jmp menuOpciones
	
	
salir:
	mov eax, 1
	int 80h
	
	
