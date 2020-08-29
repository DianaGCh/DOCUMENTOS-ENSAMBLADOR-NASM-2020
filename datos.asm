; Midterm Programming Question 3
; fibonacci.asm
; (nasm syntax)
; Corey Richardson
; CS310
;
; Use a loop to calculate and print the first 7 fibonacci numbers

global _start ; make sure the linker can see entry point
%include "Along32.inc" ; linux/nasm equivalent of Irvine32

section .text
; function fib
; takes one parameter: ecx -- return the ecx'th fibonacci number
; returns the value in eax
fib:
    cmp ecx, 2 ; special-case fib(1) and fib(2)

    ja .body ; for fib(>= 3)
    mov eax, 1
    jne .done ; fib(1) and fib(0) are 1
    mov eax, 2
    jmp .done
    
.body:
    push ebx ; keep things clean for the caller
    push ecx
    ; use an iterative algorithm, rather than a recursive one
    ; (picked up this trick from SICP)

    sub ecx, 2 ; already handled fib(1) and fib(2), don't do extra loops
    mov ebx, 1 ; ebx = fib(n-2)
    mov eax, 2 ; eax = fib(n-1)

.loop:
    xchg eax, ebx
    add eax, ebx
    loop .loop

; eax is all set and ready to go
    pop ecx ; clean up registers
    pop ebx
.done:
    ret

_start:
    mov ecx, 7 + 1 ; set it to one more than the desired number of iterations
    
.loop:
    mov ebx, ecx ; save the loop counter in ebx
    mov ecx, 8
    sub ecx, ebx ; subtract the previous loop value from 8
    ; since we start at 8, the fib argument goes 0, 1, 2, 3, ...
    call fib
    call DumpRegs
    mov ecx, ebx ; put the loop counter back so it will be decremented
    loop .loop

    mov eax, 1 ; exit syscall
    mov ebx, 0
    int 0x80
