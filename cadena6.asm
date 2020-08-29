section .data
	my_string db 'hello world', 0	;arreglo o cadena
	len equ $-my_string  		; longitud de cadena
	msg_found db 'found!', 0xa	;mensaje de encontrado
	len_found equ $-msg_found	; longitud de mensaje encontrado
	msg_notfound db 'not found!', 10	;mensaje no encontrado
	len_notfound equ $-msg_notfound	; longitud de mensaje no encontrado
	
section .text
   global _start        
_start:	                

   mov ecx,len				   ;contador toma como valor la longitud de la cadena
   mov edi,my_string			;Index Destination(Indice de destino) apunta a la ubicacion de la cadena
   mov al , 'x'				;aqui se indica el caracter a buscar
   cld				      	;incremento automatico para seguir comparando caracteres
   repne scasb				   ;se repite mietreas ecx no sea 0 o hasta hallar [ES:EDI] = AL
   je found 				   ;si encontro el valor salta a etiqueta found	

   mov eax,4				   ;Si no encontro imprime mensaje not found
   mov ebx,1
   mov ecx,msg_notfound
   mov edx,len_notfound
   int 80h
   jmp exit
   
found:
   mov eax,4
   mov ebx,1
   mov ecx,msg_found
   mov edx,len_found
   int 80h
   
exit:
   mov eax,1
   mov ebx,0
   int 80h
