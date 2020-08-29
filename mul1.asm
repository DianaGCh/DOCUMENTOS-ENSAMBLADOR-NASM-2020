
section .data
		resultado db "El resultado es: "	;establecemos un mensaje
		len equ $- resultado 				;leemos la longitud de la cadena
		
segment .bss
		multiplicacion resb 1
		
section .text
		global _start
_start:
 
	
 		mov al, 12					; en el registro eax de 32 bits se almacena un 5
		mov bl, 2						 ; en el registro ebx de 32 bits se almacena un 2
		mul bl				;se realiza la resta de los valores almacenados
										;en los registros eax y ebx, el resultado se almacena en eax
		add al, '0'					;ajuste
		mov [multiplicacion], al
		
		mov eax, 4						;imprime el mensje
		mov ebx, 1						;define q se imprimen por pantalla
		mov ecx, resultado				;presenta el mensaje almacenado en resultado
		mov edx, len
		int 80h			
 

		
		
		mov eax, 4
		mov ebx, 1
		mov ecx, multiplicacion
		mov edx
		int 80h
 
salir:
		mov eax, 1
		mov ebx, 0
		int 80h
	
