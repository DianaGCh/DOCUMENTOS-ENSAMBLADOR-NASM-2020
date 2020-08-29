%macro escribir 2
mov eax,4
mov ebx,1
mov ecx,%1
mov edx,%2
int 0x80
%endmacro

%macro lee 2
mov eax, 3
mov ebx, 0
mov ecx, %1
mov edx, %2
int 0x80
%endmacro

section .data
	arreglo db 3,2,8,7,5
	len_arreglo equ $-arreglo
	
	new_line db 10,''
	
 section .bss
	numero resb 1
section .text
global _start
_start:
	mov esi, arreglo				;esi= fijar el tamaño del arreglo, posicionar el arreglo en mmoria
	mov edi, 0						;edi=contener el indice delarreglo
imprimir:	
	mov al, [esi]
	add al, '0'
	mov [numero], al
	
	add esi, 1
	add edi, 1
	
	escribir numero,1
	escribir new_line,1
	cmp edi, len_arreglo		; cmp 3,4=> activ carry(1er operando menor)
	jb imprimir						; cuando la bandera de carry esta activado


salir:
mov eax,1
int 0x80
