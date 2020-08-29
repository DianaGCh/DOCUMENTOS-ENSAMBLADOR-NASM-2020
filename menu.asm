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
  menu db 10,"Escoja una opcion :",10,"1. Suma",10,"2. Resta",10
 tam equ $- menu
 
  suma db 10,"suma"
  tams equ $- suma
  resta db 10,"resta"
  tamr equ $- resta
  validar db 10, "escoja una opcion correcta, 1 o 2"
  tamv equ $- validar
 
 section .bss
 opcion resb 2 
 
 
 section .text
	global _start
	_start:
	
	ops:
	escribir menu,tam
	leer opcion, 2
	
	mov al,[opcion]
	sub al,'0'
	cmp al, 1
	je sum
	cmp al,2
	je rest
	jne incorrecto
	
	incorrecto:
	escribir validar, tamv
	jmp ops
	
	sum:
	escribir suma, tams
	jmp salir
	
	rest:
	escribir resta, tamr
	jmp salir
	
	salir:
	mov eax,1
	int 80h
	
