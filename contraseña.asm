section .data
   asterisco db '*'

section .text
   global _start

_start:	
	mov cx, 9
	mov bx, 9
	jmp controlador

controlador:
	cmp cx, 0
	jz salir
	jmp imprimir

imprimir:
	dec cx
	push cx
	mov ax, 4
	mov bx, 1
	mov cx, asterisco
	mov dx, 1
	int 80h
	pop cx
	jmp controlador

salir:

	mov ax,1
	int 0x80
