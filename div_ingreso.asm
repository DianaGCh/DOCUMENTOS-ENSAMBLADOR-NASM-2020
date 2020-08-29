section .data
	msj_dividendo	db	10,'Número 1: '
	len_dividendo	equ 	$ - msj_dividendo
 
	msj_divisor	db	10,'Numero 2: '
	len_divisor	equ	$ - msj_divisor

	msj_cociente	db	10,	'La División es:'
	len_cociente		equ	$ - msj_cociente

	msj_residuo	db	10,'Residuo es: '
	len_residuo	equ	$ - msj_residuo

section .bss
	num1 resb 1
	num2 resb 1
	resultado resb 1
	residuo resb 1

section .text
	global _start
_start:

	; Imprimimos en pantalla el mensaje 2
	mov eax, 4
	mov ebx, 1
	mov ecx, msj_dividendo
	mov edx, len_dividendo
	int 80h
 
	; Obtenemos el numero 1
	mov eax, 3
	mov ebx, 0
	mov ecx, num1
	mov edx, 2
	int 80h
 
	; Imprimimos en pantalla el mensaje 3
	mov eax, 4
	mov ebx, 1
	mov ecx, msj_divisor
	mov edx, len_divisor
	int 80h
 
	; Obtenemos el numero 2
	mov eax, 3
	mov ebx, 0
	mov ecx, num2
	mov edx, 2
	int 80h

	; Movemos los numeros ingresados a los registro AL y BL
	mov al, [num1]
	mov bl, [num2]
 
	; Convertimos los valores ingresados de ascii a decimal
	sub al, '0'
	sub bl, '0'
 
	; Division. AL = AX / BL. AX = AH:AL
	div bl
 
	
	add al, '0' 	; Convertimos el resultado de la resta de decimal a ascii
 	add ah, '0'

	mov [resultado], al
	mov [residuo], ah
 
	; Print on screen the message 9
	mov eax, 4
	mov ebx, 1
	mov ecx, msj_cociente
	mov edx, len_cociente
	int 80h
 
	; Imprimimos en pantalla el resultado
	mov eax, 4
	mov ebx, 1
	mov ecx, resultado
	mov edx, 1
	int 80h

	; Imprimimos en pantalla el resultado
	mov eax, 4
	mov ebx, 1
	mov ecx, msj_residuo
	mov edx, len_residuo
	int 80h

	mov eax, 4
	mov ebx, 1
	mov ecx, residuo
	mov edx, 1
	int 80h

	mov eax, 1
	mov ebx, 0
	int 80h
