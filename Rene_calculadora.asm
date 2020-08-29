%macro imprimir 2
	mov eax, 4
	mov ebx, 1
	mov ecx, %1
	mov edx, %2
	int 80h
%endmacro
section .data
	
	msj2 db " x "
	len2 equ $-msj2
	
	msj3 db " = "
	len3 equ $-msj3
		
	espacio db 10
	len_esp equ $-espacio
	
section .bss
	numero rest 2
	presentarN1 rest 2
	presentarN2 rest 2
	respuesta rest 2
	aux rest 2
	x rest 2

section .text
	global _start
	
_start:
	mov al, 1
	mov [aux], al
	mov cx, 0
	
principal:
	cmp cx,9
	jz bucle
	inc cx
	push cx
	mov [numero], cx
	jmp imp
	
imp:
	mov al, [numero]
	mov [presentarN1], al
	mov cl, [aux]
	mul cl
	
	mov [numero], al
	mov ah, [presentarN1]
	add ax, '00'
	add cx, '0'
	mov [presentarN1], ah
	mov [presentarN2], cl
	imprimir presentarN1, 1
	imprimir msj2, len2
	imprimir presentarN2, 1
	imprimir msj3, len3
	mov eax, 48
	add [numero], ax 
	imprimir numero, 2
	imprimir espacio, 1
	pop cx
	jmp principal

bucle: 
	imprimir espacio, len_esp
	mov ebx, [aux]
	inc bx
	mov [aux], bx
	mov ecx, 0
	cmp bx, 9
	jb principal
	
salir:
	mov ax, 1
	mov bx, 0
	int 80h
