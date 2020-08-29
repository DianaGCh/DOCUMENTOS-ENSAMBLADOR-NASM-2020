%macro imprime 2
mov eax,4
mov ebx,1
mov ecx,%1
mov edx,%2
int 0x80
%endmacro

section .data

mensaje db "el numero de argumentos es: "
lonmensaje equ $-mensaje

texto db "el argumento es: "
lontexto equ $-texto

ln db 0xa, 0xd
lonln equ $-ln

section .bss
datos resb 1

section .text
global _start
_start:

pop ax
add ax,48
mov [datos], ax

imprime mensaje, lonmensaje
imprime datos, 1
imprime ln, lonln

pop bx

imprime texto, lontexto

mov ax, 4
mov bx, 0
pop cx
mov dx, 1
int 0x80

imprime ln, lonln

mov ax,1
mov bx,0
int 0x80

