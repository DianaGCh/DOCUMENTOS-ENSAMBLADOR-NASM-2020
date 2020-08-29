;Suma de dos numeros estaticos, no se ingresa por teclado

section .data
	resultado db "El resultado es",10 	;establecemos un mensaje
	len equ $- resultado 				;leemos la longitud de la cadena

section .bss
	suma resb 1							;declaramos la variable -suma- para almacenar la suma realizada		

section .text
		global _start
 _start:
		mov eax, 6						;almacenamos 6 en eax
		mov ebx, 2						;almacenamos 2 en bax
		add eax, ebx 					;con add realizamos la suma de eax con ebx
		add eax, '0'					;para traducir un digito a una cadena le ajustamos con '0' 0 ascci =48
		mov [suma],eax 					;guardamos el valor de la suma de eax a la variable suma
										;para no perderla en la siguiente linea
		
		mov eax, 4						;imprime el mensje
		mov ebx, 1						;define q se imprimen por pantalla
		mov ecx, resultado				;presenta el mensaje almacenado en resultado
		mov edx, len
		int 80h					;mantiene el tamaño de la cadena

		mov eax, 4
		mov ebx, 1
		mov ecx, suma				;se imprime el resultado de la suma
		mov ecx, 1						;el tamaño solo sera 1
		int 80h
		
		mov eax, 1 
		int 80h
		
	;	mov eax, 2 			; en el registro eax de 32 bits se almacena un 2
	;	mov ebx, 3 			; en el registro ebx de 32 bits se almacena un 3
	;	add eax, ebx 			;se realiza la suma de los valores almacenados
						;en los registros eax y ebx, el resultado se almacena en eax
						; imprime en en pantalla el resultado
						; convirtiendo el número a su correspondiente código ASCII
						; sumado 48 o el caracter '0' (cero)
	;	add eax, '0'
 
	;	mov [res], eax
	;	mov eax, 4
	;	mov ebx, 1
	;	mov ecx, res
	;	mov edx, 1
	;	int 80h
	
