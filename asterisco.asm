;Programa que imprime asteriscos
section	.data
   asterisco db '*'

section	.text
   global _start        ;must be declared for using gcc
	
_start:	
	mov cx,9
	


imprimir1:
	dec cx
	push cx;
	mov ax, 4
	mov bx, 1
	mov cx, asterisco
	mov dx, 1
	int 80h
	pop cx
	cmp cx,0
	jnz imprimir1


	mov ax,1             
	int 0x80             