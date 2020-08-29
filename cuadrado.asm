;cuadrado.asm
Programa que imprime asteriscos
section	.data
   asterisco db '*'

section	.text
   global _start        ;must be declared for using gcc
	
_start:	
	mov rcx,9
	;jmp principal

;principal:
	;cmp cx, 0
	;jz salir
	;jmp imprimir


imprimir:
	dec rcx
	push rcx;
	mov rax, 4
	mov rbx, 1
	mov rcx, asterisco
	mov rdx, 1
	int 80h
	pop rcx
	cmp rcx,0
	jnz imprimir
	;jmp principal

	mov rax,1             ;system call number (sys_exit)
	int 0x80              ;call kernel
