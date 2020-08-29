section .data
	mensaje db 'Ingrese un numero',0xA,0xD
	tamano equ $-mensaje
	numIngresado db 'El número ingresado es',0xA,0xD
	longitud equ $-numIngresado

section .bss
	num resb 5

section .text
	global _start

_start:
	mov eax, 4
	mov ebx, 1
	mov ecx, mensaje
	mov edx, tamano
	int 80h

	mov eax, 3
	mov ebx, 2
	mov ecx, num
	mov edx, 5
	int 80h

	mov eax, 4
	mov ebx, 1
	mov ecx, numIngresado
	mov edx, longitud
	int 80h

	mov eax, 4
	mov ebx, 1
	mov ecx, num
	mov edx, 5
	int 80h

	mov eax,1
	int 80h
