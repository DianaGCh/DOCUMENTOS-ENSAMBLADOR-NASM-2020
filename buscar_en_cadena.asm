section	.data
s1 db 'HOLA MUNDO', 0  
len equ $-s1                

section	.bss
s2 resb 20                  
			 
section .text
   global _start        
	
_start:	               
   mov ecx, len	
   mov esi, s1		
   mov edi, s2		
	
ciclo:
   lodsb 		
   or al, 20h	
   stosb		   
   loop ciclo	
   cld			
   
   mov eax,4	        
   mov ebx,1	        
   mov ecx,s2	        
   mov edx,20	        
   int 80h	        
	
   mov eax,1	     
   int 80h	        
	

