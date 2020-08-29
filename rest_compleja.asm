%macro escribir 2
	mov	eax,4
	mov	ebx,1
	mov	ecx,%1
	mov	edx,%2
	int	0x80
%endmacro

section	.data
	msg db 'La resta es:',0xa
	len equ $ - msg
	num1 db '518'
	num2 db '197'
	sum db '     '

section	.text
	global _start

_start:
     mov esi, 2  	;apunta el digito mas a la derecha 
     mov ecx, 3  	;numero de digitos
	clc
add_loop:  
     mov al, [num1 + esi]  ;Lleva a cabo la suma de dos operandos y suma uno al resultado en caso de 
					;que la bandera CF esté activada, esto es, en caso de que exista acarreo.
     sbb  al, [num2 + esi]   ;la operación que realiza es: AL = ( AH + BL ) + CF
                             ;acarrea un bit al siguiente paso de la instrucción
	    ;adc suma el contenido de la bandera CF (0/1) al primer operando y despues
	    ;suma el 2do operando al 1ro
     aas                ;Convierte el número almacenado en AL a BCD desempaquetado. La idea es 
     pushf
     or al, 30h
     popf
		
     mov	[sum + esi], al
     dec	esi
     loop	add_loop
		
     escribir msg, len
     escribir sum, 3
		
     mov	eax,1
     int	0x80
