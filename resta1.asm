;resta1
section .data
		resultado db "El resultado es: "	;establecemos un mensaje
		len equ $- resultado 				;leemos la longitud de la cadena
		
segment .bss
		res resb 1
		
section .text
		global _start
_start:
 
	
 		mov eax, 5 						; en el registro eax de 32 bits se almacena un 5
		mov ebx, 2						 ; en el registro ebx de 32 bits se almacena un 2
		sub eax, ebx 					;se realiza la resta de los valores almacenados
										;en los registros eax y ebx, el resultado se almacena en eax
		add eax, '0'
 
 
		mov eax, 4						;imprime el mensje
		mov ebx, 1						;define q se imprimen por pantalla
		mov ecx, resultado				;presenta el mensaje almacenado en resultado
		mov edx, len
		int 80h			
 

		mov [res], eax
		mov eax, 4
		mov ebx, 1
		mov ecx, res
		mov edx, 1
		int 80h
 
salir:
		mov eax, 1
		mov ebx, 0
		int 80h
	
		
;nasm -f elf hello.asm
;ld -m elf_i386 hello.o -o hello
;./hello
