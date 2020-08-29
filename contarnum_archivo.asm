%macro escribe 2
	mov eax, 4
	mov ebx, 1
	mov ecx, %1
	mov edx, %2
	int 0x80
%endmacro

segment .data
	nueva_linea db 10,""
	archivo db "/home/user/Documentos/SEXTO/Ensamblador/archivo.txt",0
	respuesta db "          "

segment .bss
	texto resb 30
	idarchivo resd 1
	aux resb 1
	contador resb 1

segment .text

leetecla:
	mov eax,3
	mov ebx,0
	mov edx,10
	int 80h
	ret
	
	global _start

_start:

	mov eax,8
	mov ebx, archivo
	mov edx,777h
	int 0x80

	test eax,eax
	jz salir
	mov dword[idarchivo],eax
	escribe msg2,lenmsg2

	mov ecx,texto
	call leetecla

	mov eax,4
	mov ebx,[idarchivo]
	mov edx,texto
	mov edx,10
	int 0x80

leer_archivo:
	mov eax, 5						
	mov ebx, archivo	
	mov ecx, 0		
	mov edx, 0		
	int 0x80
	test eax, eax		
	jz salir

	mov dword[idarchivo], eax

	mov eax, 3		
	mov ebx, [idarchivo]	
	mov ecx, texto		
	mov edx, 13		
	int 0x80


	mov esi, 9
	mov ecx, 10


item:
	push rsi
	push rcx
	mov al, [texto + esi]
	mov [respuesta + esi], al
	mov [aux], al

subitem:
	push rsi
	push rcx

	mov al, [texto + esi]
	
	cmp al, [aux]
	jz sumar

	mov [respuesta + esi], al
	pop rcx
	pop rsi
	dec esi
	loop subitem

	escribe respuesta, 10
	escribe nueva_linea, 1

	pop rcx
	pop rsi
	dec esi
	loop item
;	escribe respuesta, 10

sumar:
	inc ecx


salir:
	mov eax, 1
	xor ebx, ebx
	int 0x80
