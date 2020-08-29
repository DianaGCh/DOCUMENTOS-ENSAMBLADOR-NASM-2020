 ; el presente contiene un menu para sumar, multiplicar , dividir, resta r y decrementar un numero
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
	titulo db 10,"MENU DE OPERACIONES ARITMETICAS",10
	lenTit equ $ -titulo
	
	menu db 10,"1. Suma",10,"2. Resta",10,"3. Multiplicacion", 10,"4. Division",10,"5. Decrementar numero",10, "6. Salir",10,"**Escoja una opcion**",10
	lenMen equ $ -menu
	
	msg2		db		10,'Número 1: ',0
	lmsg2		equ		$ - msg2
 
	msg3		db		'Número 2: ',0
	lmsg3		equ		$ - msg3
  
	msg9		db		10,'Resultado xxx: ',0
	lmsg9		equ		$ - msg9
	
	incorrecto db       10,"La opcion ingresada es incorrecta",10,"Intente nuevamente"
	lenI          equ      $ -incorrecto
	
	newline db "",10
	
	
section .bss 
	num1:		resb	2
	num2:		resb 	2
	resultado:	resb 	2
	opcionMenu resb 2
 
section .text
	global _start
 
_start: 
	escribir titulo, lenTit
	
menuOpciones:
	escribir newline,1
	escribir menu, lenMen
	leer opcionMenu,2 
	
	mov al,[opcionMenu]
	sub al,'0'
	cmp al, 1
	je sumar
	cmp al,2
	je restar
	cmp al,3
	je multiplicar
	cmp al,4
	je dividir
	cmp al,5
	je decremento
	cmp al,6
	je salir
	
	jne incorrectoO
	
 ;*****************SUMA*****************************
sumar:
	; INgresamos y Obtenemos el numero 1
	escribir msg2, lmsg2
	leer num1, 2
	
	; INgresamos y Obtenemos el numero 2
	escribir msg3, lmsg3
	leer num2, 2
	
	; Movemos los numeros ingresados a los registro AL y BL
	mov al, [num1]
	mov bl, [num2]
 
	; Convertimos los valores ingresados de ascii a decimal
	sub al, '0'
	sub bl, '0'
 
	; Sumamos el registro AL y BL
	add al, bl
;	aaa
 
	; Convertimos el resultado de la suma de decimal a ascii
	add al, '0'
 
	; Movemos el resultado a un espacio reservado en la memoria
	mov [resultado], al
 
	; Imprimimos en pantalla el mensaje 9
	mov [msg9 + 11], dword 'sum'
	escribir msg9,lmsg9
	
 
	; Imprimimos en pantalla el resultado
	escribir resultado, 2
 
	; Finalizamos el programa
	jmp menuOpciones
 
 ;***************************RESTAR*******************************
 
restar:
; INgresamos y Obtenemos el numero 1
	escribir msg2, lmsg2
	leer num1, 2
	
	; INgresamos y Obtenemos el numero 2
	escribir msg3, lmsg3
	leer num2, 2
	
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

	mov [msg9 + 11], dword 'res'
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
 
	; Finalizamos el programa
	jmp menuOpciones
	
	
;**************************************MULTIPLICAR****************************************
multiplicar:
; INgresamos y Obtenemos el numero 1
	escribir msg2, lmsg2
	leer num1, 2
	
	; INgresamos y Obtenemos el numero 2
	escribir msg3, lmsg3
	leer num2, 2
	
 
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

	mov [msg9 + 11], dword 'mul' 

	; Imprimimos en pantalla el mensaje 9
	escribir msg9,lmsg9
 
	; Imprimimos en pantalla el resultado
	escribir resultado,2
 
	; Finalizamos el programa
	jmp menuOpciones
	
 
 ;*********************************DIVIDIR*********************************
dividir:
	
	; INgresamos y Obtenemos el numero 1
	escribir msg2, lmsg2
	leer num1, 2
	
	; INgresamos y Obtenemos el numero 2
	escribir msg3, lmsg3
	leer num2, 2
	
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
	;
	add ax, '0'
 
	; Movemos el resultado a un espacio reservado en la memoria
	mov [resultado], ax

	mov [msg9 + 11], dword 'div'
 
	; Print on screen the message 9
	escribir msg9,lmsg9
 
	; Imprimimos en pantalla el resultado
	escribir resultado,1
	jmp menuOpciones


;********************OPCION INCORRECTA**********************************
incorrectoO:
	escribir incorrecto,lenI
	jmp menuOpciones

;********************DECREMENTAR NUMERO*******************************
decremento:
	escribir msg2,lmsg2
	leer num1,1
	jmp imprimir
	
imprimir:
	escribir num1,1
	escribir newline,1

	mov ax, [num1]
	sub ax, '0'
	inc ax	
	mov cx, ax
	add ax, '0'
	mov [num1], ax	

	cmp cx, 9
	jz menuOpciones
	jmp imprimir
	jmp menuOpciones

;********************OPCION SALIR**************************
salir:
	mov eax, 1
	mov ebx, 0
	int 80h
