%macro escribe 2
	mov eax, 4
	mov ebx, 1
	mov ecx, %1
	mov edx, %2
	int 0x80
%endmacro

segment .data
	nueva_linea db 10,""
	archivo db "/home/user/Documentos/SEXTO/Ensamblador/arreglo.txt",0
	respuesta db "          "

segment .bss
	texto resb 10
	idarchivo resd 1
	aux resb 1
	contador resb 1

segment .text
	global _start

_start:
	
leer_archivo:
	mov ax, 5						
	mov bx, archivo	
	mov cx, 0		
	mov dx, 0		
	int 0x80
	test ax, ax		
	jz salir

	mov dword [idarchivo], ax

	mov ax, 3		
	mov bx, [idarchivo]	
	mov cx, texto		
	mov dx, 13		
	int 0x80


	mov esi, 9
	mov ecx, 10


item:
	push rsi
	push cx
	mov al, [texto + rsi]
	mov [respuesta + rsi], al
	mov [aux], al

subitem:
	push rsi
	push cx

	mov al, [texto + rsi]
	
	cmp al, [aux]
	jz sumar

	mov [respuesta + rsi], al
	pop cx
	pop rsi
	dec rsi
	loop subitem

	escribe respuesta, 10
	escribe nueva_linea, 1

	pop cx
	pop rsi
	dec rsi
	loop item
;	escribe respuesta, 10

sumar:
	inc cx


salir:
	mov ax, 1
	xor bx, bx
	int 0x80
