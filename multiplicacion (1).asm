
segment .data

 msg6 db 0xA,0xD,"el resultado es: "
 len6 equ $- msg6
 
segment .bss
 res resb 1
section .text

 global _start
_start:
 mov ebx, 3 ; en ebx que es un registro de 32 bits
 ; se almacena el número tres
 mov eax, 2 ; en el registro eax se almacena el número dos
mul ebx ; se realiza la multiplicacion (eax*ebx)
 ; en eax se almacenara la parte baja del resultado de la
 ; multiplicación (cuyo valor es 6)
 ; y en edx se almacenara la parte alta (cuyo valor es 0)
add eax, 48
 mov [res], eax
mov eax, 4
 mov ebx, 1
 mov ecx, msg6
 mov edx, len6
 int 0x80
 
 mov eax, 4
 mov ebx, 1
 mov ecx, res
 mov edx, 1
 int 0x80

