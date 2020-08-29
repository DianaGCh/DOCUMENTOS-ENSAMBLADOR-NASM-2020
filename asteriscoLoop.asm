section .data
		asterisco db '*'
		nueva_linea db 10,''
section .text
		global _start

_start:
		mov cx, 8
		mov bx, 1 

l1:
		push cx
		push bx
	
	;********************* nueva lineas **********************
		mov ax, 4
		mov bx, 1
		mov cx, nueva_linea
		mov dx, 1
		int 80h
	
		pop cx
		push cx
l2:
		push cx
	;********************* asterisco **********************
		mov ax, 4
		mov bx, 1
		mov cx, asterisco
		mov dx, 1
		int 80h
		pop cx
		loop l2  ;  salto a l2, dec cx,  
	;********************* finaliza loop de las columnas *********
		pop bx
		pop cx
		inc bx
		loop l1
	;********************* finaliza loop de las fila *********

		mov ax, 1
		int 80h
