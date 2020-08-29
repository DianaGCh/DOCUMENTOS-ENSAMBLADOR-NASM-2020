;Diana Gabriela Gonzalez
;Fecha:22 de Junio
;operaciones dinámicas con macros

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
        
        mensaje_ingreso db "Primer numero: "
        lenn_ing equ $ - mensaje_ingreso

        mensaje_ingreso2 db "Segundo numero: "
        lenn_ing2 equ $ - mensaje_ingreso2

        mensaje1 db 10,"Operaciónes ",10
        len1 equ $ - mensaje1

        mensajesuma db 10,"Suma: "
        lensuma equ $ - mensajesuma

        mensajeres db 10,"Resta: "
        lenres equ $ - mensajeres

        mensajeprod db 10,"Producto: "
        lenprod equ $ - mensajeprod

        mensajedivid db 10,"División",10
        lendivid equ $ - mensajedivid

        mensaje2 db "Cociente: "
        len2 equ $ - mensaje2

        new_line db 10, " "

        mensajed db 10, "residuo: "
        lend equ $ - mensajed


section .bss
        numero1 resb 1
        numero2 resb 1
        suma resb 1
        resta resb 1
        producto resb 1
        residuo resb 1
        cociente resb 1
        
section .text
        global _start
_start:
        escribir mensaje_ingreso, lenn_ing
        leer numero1, 2

        escribir mensaje_ingreso2, lenn_ing2
        leer numero2, 2
        jmp division
        
       
        
  adicion:
        mov ax, [numero1]
        sub ax, '0'
        mov bx, [numero2]
        sub bx, '0'

        add ax, bx
        add ax, '0'
    
        mov[suma], ax

        escribir mensajesuma, lensuma
        escribir suma, 1
        jmp multiplicion
        
        
  sustraccion:
        mov ax, [numero1]
        mov bx, [numero2]
        
        sub ax, '0'
        sub bx, '0'
        sub ax, bx
        add ax, '0'
    
        mov[resta], ax

        escribir mensajeres, lenres
        escribir resta, 1
        jmp adicion
        
  multiplicion:
        mov al, [numero1]
        sub ax, '0'
        mov bl, [numero2]
		sub bl, '0'
        
        mul bl
        add al, '0'
        mov [producto], al

        escribir mensajeprod, lenprod
        escribir producto, 1
        jmp salir
        
        
   division:     
        escribir mensajedivid, lendivid
       
        mov al, [numero1]
        mov bl, [numero2]

        sub ax, '0'
        sub bl, '0'

        div bl
        add al, '0'  
        mov [cociente], al 
        add ah, '0'
        mov [residuo], ah
        escribir mensaje2, len2
        escribir cociente, 1
        escribir mensajed, lend
        escribir residuo, 1
        escribir new_line, 1
        jmp sustraccion
        
     salir:
        mov eax, 1
        int 80h
        
        
        
