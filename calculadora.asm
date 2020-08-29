%macro escribir 2 
        mov eax, 4
        mov ebx, 1
        mov ecx, %1
        mov edx, %2
        int 80h
%endmacro

%macro leer 2 
        mov eax, 3
        mov ebx, 0
        mov ecx, %1
        mov edx, %2
        int 80h
%endmacro

section .data
	msg1		db		10,'-Calculadora-',10,0
	lmsg1		equ		$ - msg1
 
	msg2		db		10,'Numero 1: ',0
	lmsg2		equ		$ - msg2
 
	msg3		db		10,'Numero 2: ',0
	lmsg3		equ		$ - msg3

	menu1 db 10,"Escoja una opcion :",10,"1. Suma",10,"2. Resta", 10,"3. Division",10, "4. Multiplicacion",10,"5.Salir",10
	menuTam equ $ - menu1


	msg9		db		10,'Resultado: ',0
	lmsg9		equ		$ - msg9	
 
	msg10		db		10,'Opcion Invalida',10,0
	lmsg10		equ		$ - msg10
 
	nlinea		db		10,10,0
	lnlinea		equ		$ - nlinea


 
section .bss
	opcion	resb 2; para asimilar el dato y el enter
  	num1	resb 2
	num2	resb 2
	resultado:	resb 	2
 
section .text
 	global _start
 
_start:
	; Imprimimos en pantalla el mensaje 1
	;******** Titulo o encabezado *******
	escribir msg1,lmsg1
 ;************mensaje de opciones de menu**************
menu:
 	escribir menu1, menuTam
	leer opcion,2

	mov ah,[opcion]
	sub ah, '0'

	cmp ah,1
	je sumar

	cmp ah,2
	je restar

	cmp ah,3
	je dividir

	cmp ah,4
	je dividir

	cmp ah,5
	je salir
	; Si el valor ingresado no cumple con ninguna de las condiciones anteriores entonces mostramos un mensaje de error y finalizamos
	; la ejecucion del programa
	escribir msg10,lmsg10
	jmp menu
 
 sumar:
 	escribir msg2,lmsg2
	leer num1,2
	escribir msg3, lmsg3
	leer num2,2
	; Movemos los numeros ingresados a los registro AL y BL
	mov al, [num1]
	mov bl, [num2]
 
	; Convertimos los valores ingresados de ascii a decimal
	sub al, '0'
	sub bl, '0'
 
	; Sumamos el registro AL y BL
	add al, bl

	; Convertimos el resultado de la suma de decimal a ascii
	add al, '0'
 
	; Movemos el resultado a un espacio reservado en la memoria
	mov [resultado], al
 
	; Imprimimos en pantalla el mensaje 9
	mov eax, 4
	mov ebx, 1
	mov ecx, msg9
	mov edx, lmsg9
	int 80h
 
	; Imprimimos en pantalla el resultado
	mov eax, 4
	mov ebx, 1
	mov ecx, resultado
	mov edx, 2
	int 80h
 
	jmp menu
 
restar:
	escribir msg2,lmsg2
	leer num1,2
	escribir msg3, lmsg3
	leer num2,2
	; Movemos los numeros ingresados a los registro AL y BL
	mov al, [num1]
	mov bl, [num2]
 
	; Convertimos los valores ingresados de ascii a decimal
	sub al, '0'
	sub bl, '0'
 
	; Restamos el registro AL y BL
	sub al, bl
 
	; Convertimos el resultado de la resta de decimal a ascii
	add al, '0'
 
	; Movemos el resultado a un espacio reservado en la memoria
	mov [resultado], al
 
	; Imprimimos en pantalla el mensaje 9
	mov eax, 4
	mov ebx, 1
	mov ecx, msg9
	mov edx, lmsg9
	int 80h
 
	; Imprimimos en pantalla el resultado
	mov eax, 4
	mov ebx, 1
	mov ecx, resultado
	mov edx, 1
	int 80h

	jmp menu
multiplicar:
	escribir msg2,lmsg2
	leer num1,2
	escribir msg3, lmsg3
	leer num2,2
 
	; Movemos los numeros ingresados a los registro AL y BL
	mov al, [num1]
	mov bl, [num2]
 
	; Convertimos los valores ingresados de ascii a decimal
	sub al, '0'
	sub bl, '0'
 
	; Multiplicamos. AX = AL X BL
	mul bl
 
	; Convertimos el resultado de la resta de decimal a ascii
	add ax, '0'
 
	; Movemos el resultado a un espacio reservado en la memoria
	mov [resultado], ax
 
	; Imprimimos en pantalla el mensaje 9
	mov eax, 4
	mov ebx, 1
	mov ecx, msg9
	mov edx, lmsg9
	int 80h
 
	; Imprimimos en pantalla el resultado
	mov eax, 4
	mov ebx, 1
	mov ecx, resultado
	mov edx, 1
	int 80h
 
	jmp menu
 
dividir:
 	escribir msg2,lmsg2
	leer num1,2
	escribir msg3, lmsg3
	leer num2,2
 
	; Movemos los numeros ingresados a los registro AL y BL
	mov al, [num1]
	mov bl, [num2]
 
	; Igualamos a cero los registros DX y AH
	mov dx, 0
	mov ah, 0
 
	; Convertimos los valores ingresados de ascii a decimal
	sub al, '0'
	sub bl, '0'
 
	; Division. AL = AX / BL. AX = AH:AL
	div bl
 
	; Convertimos el resultado de la resta de decimal a ascii
	add ax, '0'
 
	; Movemos el resultado a un espacio reservado en la memoria
	mov [resultado], ax
 
	; Print on screen the message 9
	mov eax, 4
	mov ebx, 1
	mov ecx, msg9
	mov edx, lmsg9
	int 80h
 
	; Imprimimos en pantalla el resultado
	mov eax, 4
	mov ebx, 1
	mov ecx, resultado
	mov edx, 1
	int 80h
	jmp menu

salir:
	; Imprimimos en pantalla dos nuevas lineas
	mov eax, 4
	mov ebx, 1
	mov ecx, nlinea
	mov edx, lnlinea
	int 80h
 
	; Finalizamos el programa
	mov eax, 1
	mov ebx, 0
	int 80h

