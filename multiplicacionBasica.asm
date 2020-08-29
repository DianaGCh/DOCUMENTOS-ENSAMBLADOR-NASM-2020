%macro escribir 2 
        mov ax, 4
        mov bx, 1
        mov cx, %1
        mov dx, %2
        int 80h
%endmacro
 section .data
		msge1 db '*'
		msge2 db "="
		;enter  db  "",10
 segment .bss
	a resb 2
	b resb 2
	c resb 2
 section .text
	global _start

_start:
	mov al, 3			 ;para iniciar desde el uno las tablas
	add al,'0'		
	mov[a],al
	mov cx,1
			
ciclo :
	push cx
	mov ax,[a]
	add cx, '0'
	mov[b],cx
	escribir a,2
	escribir msge1,1
	escribir b,2
	escribir msge2,1
	;escribir enter,1
	pop cx
	inc cx
	cmp cx,10
	jnz ciclo				
salir:
	mov ax,1
	int 80h

