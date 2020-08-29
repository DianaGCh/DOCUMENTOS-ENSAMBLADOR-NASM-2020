section .data
	ingresoa	db	10,'Número 1: '
	len_a		equ 	$ - ingresoa
 
	ingresob	db	10,'Numero 2: '
	len_b		equ	$ - ingresob

	resultado	db	10,'Suma: '
	len		equ	$ - resultado

section .bss
	a resb 1
	b resb 1
	suma resb 1

section .text
	global _start
_start:

	; Imprimimos en pantalla el mensaje 2
	mov eax, 4
	mov ebx, 1
	mov ecx, ingresoa
	mov edx, len_a
	int 80h
 
	; Obtenemos el numero 1
	mov eax, 3
	mov ebx, 0
	mov ecx, a
	mov edx, 2
	int 80h
 
	; Imprimimos en pantalla el mensaje 3
	mov eax, 4
	mov ebx, 1
	mov ecx, ingresob
	mov edx, len_b
	int 80h
 
	; Obtenemos el numero 2
	mov eax, 3
	mov ebx, 0
	mov ecx, b
	mov edx, 2
	int 80h

	mov ax,[a]
	mov bx,[b]
	sub ax,'0'
	sub bx,'0'
	add ax,bx
	add ax,'0'

	mov [suma],ax
	
	mov eax,4
	mov ebx,1
	mov ecx,resultado
	mov edx,len	
	int 80h

	mov eax,4
	mov ebx,1
	mov ecx,suma
	mov edx,1
	int 80h

	mov eax,1
	int 80h
