;Division de numeros

segment .data
	mensaje db "el resultado es: ",10,13
	len6 equ $- mensaje
	residuo db "el residuo es: ",10,13
	len equ $- residuo
segment .bss
	res resb 1
	sobrante resb 1
	
section .text
	global _start
	
_start:
	mov bx, 3 			; en el registro bx se almacena el número 2
	mov ax, 9		    ; en el registro ax se almacena el número 8
	mov dx, 0 			; el registro dx, que se toma de forma implícita
						; como la parte alta del dividendo, almacena un cero
	div bx 				; se realiza la división (dx:ax / bx)
						; en ax se almacenara el resultado de la división
						; y en dx se almacenara el residuo
	add ax, 48 			; conversión del dato entero a carácter
	mov [res], ax
	mov [sobrante], bx
	
	mov eax, 4
	mov ebx, 1
	mov ecx, mensaje
	mov edx, len6
	int 80h
	
	
	
	mov eax, 4
	mov ebx, 1
	mov ecx, res
	mov edx, 1
	int 80h
	
	mov eax, 4
	mov ebx, 1
	mov ecx, residuo
	mov edx, len
	int 80h
	
	mov eax, 4
	mov ebx, 1
	mov ecx, sobrante
	mov edx, 1
	int 80h
	
salir:
	mov eax, 1
	mov ebx, 0
	int 80h
