section .data
	msg1 db "Ingrese 5 números y presione enter:", 0xA
	len1 equ $-msg1	

	arreglo db 0,0,0,0,0
	len_arreglo equ $-arreglo

	msj_resultado db "El mayor número es:", 0xA
	len_resultado equ $-msj_resultado

section .bss
	dato resb 2

section .text
	global _start

_start:
	;se define el arreglo en los registros índices
	mov esi, arreglo
	mov edi, 0

	mov eax, 4
	mov ebx, 1
	mov ecx, msg1
	mov edx, len1
	int 0x80

leer:
	mov eax, 3
	mov ebx, 0
	mov ecx, dato
	mov edx, 2
	int 0x80

	mov al, [dato]
	sub al, '0'		;se convierte a decimal 
	
	mov [esi] , al
	
	add edi, 1     		; inc edi
	add esi, 1

	cmp edi, len_arreglo
	jb leer

	mov ecx, 0
	mov bl, 0		; se registra el mayor número

comparacion:
	mov al,[arreglo + ecx] 
	cmp al, bl
	jb contador
	mov bl, al

contador:
	inc ecx
	cmp ecx, len_arreglo
	jb comparacion

imprimir:
	add bl, '0'
	mov [dato], bl

	mov eax, 4
	mov ebx, 1
	mov ecx, msj_resultado
	mov edx, len_resultado
	int 80h;


	mov eax, 4
	mov ebx, 1
	mov ecx, dato
	mov edx, 1
	int 80h;

salir:
	mov eax, 1
	int 0x80	


