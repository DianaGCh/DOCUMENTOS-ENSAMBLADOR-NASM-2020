section .data
	s1 dw 'Hello, world!',10 ;string(array) number 1
	len equ $-s1

section	 .bss
	s2 resw	13             ;se reserva para la cadena de destinato DI
	
section	.text
   global _start           
   
_start:	                  
   mov	ecx, len
   mov	esi, s1
   mov	edi, s2
   cld			            ;incrementa si di
   rep	movsw
   
   mov	edx,13	         ;extension del mensaje
   mov	ecx,s2	         ;cadena a escribir
   mov	ebx,1	            
   mov	eax,4	            
   int	0x80	            
   
   mov	eax,1	            
   int	0x80	            


