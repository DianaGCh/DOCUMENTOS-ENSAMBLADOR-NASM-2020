;Autor = Joel Cartuche
;Curso = 6° "B"
;prueba
%macro imprimir 2
	mov rax,4
	mov rbx,1
	mov rcx,%1 
	mov rdx,%2
	int 80H	
%endmacro

%macro leer 2
    mov rax,3
    mov rbx,0
    mov rcx,%1 
    mov rdx,%2
    int 80H 
%endmacro


; ecx,modo de acceso
; edx, permisos
section .bss
	auxiliar resb 30
	auxiliarb resb 30
	auxiliarc resb 30


section .data
	msg db  10,"       " ; 6 espacios para contener al dato
	lenmsg equ $-msg



	salto db " ",10 
	lensalto equ $-salto




section .text
    global _start    

_start:
	
	mov rcx,9

	mov al,0
	mov [auxiliar],al

cicloI:
	push rcx
	mov rcx,9

	mov al,0
	mov [auxiliarb],al

	cicloJ:
		push rcx


		call imprimir0al9
		

	;	imprimir msg2,lenmsg2

	fincicloJ:
		mov al,[auxiliarb]
		inc al
		mov [auxiliarb],al

		pop rcx
		loop cicloJ
		
	;imprimir salto,lensalto

fincicloI:
	mov al,[auxiliar]
	inc al
	mov [auxiliar],al

	pop rcx
	loop cicloI
	

salir:
	mov rax, 1
	int 80H



imprimir0al9:
	
	mov rbx,"["
	mov [msg+1], rbx

	mov bl,[auxiliar]
	add bl,'0'
	mov [msg+2], bl


	mov rbx,";"
	mov [msg+3], rbx

	
	mov bl,[auxiliarb]
	add bl,'0'
	mov [msg+4],bl

	mov rbx,"fJ"
	mov [msg+5], rbx

	imprimir msg,lenmsg

	ret
