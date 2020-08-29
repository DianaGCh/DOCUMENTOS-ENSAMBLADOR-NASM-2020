%macro imprimir 2

		mov eax,3
		mov ebx,2
		mov ecx,%1
		mov edx,%2
		int 80h
%endmacro

section .data	
	mensaje1 db "Ingrese numero1: "
	len1 equ $-mensaje1
	
section .bss
	suma resb 2
	numero1 resb 2
	numero2 resb 2
	
section .text
	global _start	
	
 start:
	; ************** ingreso de los números
	
	
	imprimir Rsuma, len_suma
	

	mov eax,3
	mov ebx,2
	mov ecx,numero1
	mov edx,10
	int 80h
