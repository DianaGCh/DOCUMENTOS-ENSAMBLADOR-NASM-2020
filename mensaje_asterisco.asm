section .data
		msj db 'hola gaby',10
		leng equ $-msj
section .text
		global _start

_start:
		mov rcx, 5

l1:
	mov rax, 4
	mov rbx, 1
	push rcx		;se envia la referencia de ecx a pila
	mov rcx, msj
	mov rdx, leng
	int 80h
	
	pop rcx
	loop l1			; en este instante se decrementa cx en 1
	
	mov rax, 1
	int 80h
	
