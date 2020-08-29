section .data
	msj_lado db 'Ingrese Lado: '
	leng equ $-msj_lado
	msj_resul db 10,'El área de un cuadrado es: '
	leng_resul equ $-msj_resul
	salto db 10," ",10
section .bss
	lado resb 2
	resul resb 5

section .text
	global _start
	
_start:		
	jmp Ingresar_lado
		
Ingresar_lado:
	mov eax, 4
	mov ebx, 1
	mov ecx, msj_lado
	mov edx, leng
	int 80h
	
	mov eax, 3
	mov ebx, 2
	mov ecx, lado
	mov edx, 2
	int 80h

Operacion:
	mov al, [lado]
	sub al,'0'
	mov bl, [lado]
	sub bl, '0'
	mul bl
	add al, '0'
	mov [resul], al
	jmp resultado
	
resultado:
	mov eax, 4
	mov ebx, 1
	mov ecx, msj_resul
	mov edx, leng_resul
	int 80h
	
	
	mov eax, 4
	mov ebx, 1
	mov ecx, resul
	mov edx, 5
	int 80h
	
	mov eax, 4
	mov ebx, 1
	mov ecx, salto
	mov edx, 1
	int 80h
	
	jmp salir

salir:
	mov eax, 1
	int 0x80
