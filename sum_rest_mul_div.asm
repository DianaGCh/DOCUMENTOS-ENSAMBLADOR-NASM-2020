%macro imprimir 2

		mov eax,4
		mov ebx,1
		mov ecx,%1
		mov edx,%2
		int 80h
%endmacro



section .data

		Rsuma db  0xA,0xD,'La suma es:',10
		len_suma equ $ - Rsuma

		Rresta db 0xA,0xD,'La resta de  es:',10
		len_resta equ $ - Rresta
		
		Rmultiplicacion db  0xA,0xD,'la multiplicacion es:',10
		len_mul equ $ - Rmultiplicacion
		
		Rdivision db  0xA,0xD,"El Cociente  es: ",10,13
		len_division  equ $- Rdivision
		
		Rresiduo db  0xA,0xD,"El Residuo es: ",10,13
		len_residuo equ $- Rresiduo

section .bss
		resta resb 1
		suma resb 1
		multiplicacion resb 1
		res resb 1
		cociente resb 1

section .text
	global _start

_start:

	;***************suma********
	imprimir Rsuma, len_suma
		
		mov eax,5
		mov ebx,1
		add eax,ebx
		add eax,'0'
		mov [suma],eax

		imprimir suma,1

	; **********************resta******************

		imprimir Rresta,len_resta

		mov eax,4
		mov ebx,2
		sub eax,ebx
		add eax,'0'
		mov [resta],eax

		imprimir resta,1
	
	;*******************multiplicacion*************
	
		imprimir Rmultiplicacion, len_mul
		
		mov ebx, 4		
		mov eax, 2		
		mul ebx 		
		add eax, '00'
		mov [multiplicacion], eax
		
		imprimir multiplicacion,1
		
	;************************Division************************
		  
		   mov	al,4
		   mov 	bl,2
		   div 	bl
		   add	al,'0'
		   mov 	[cociente], al
		   mov 	[res], ah
		   
		   imprimir Rdivision,len_division	
		   imprimir cociente,1	
		   imprimir Rresiduo,len_residuo
		   imprimir res,1	
		   	
		   
		   mov	eax,1	
		   int	80h
				
				
				
