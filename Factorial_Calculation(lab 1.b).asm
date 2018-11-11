; University of Rajshahi
; Name : Nakul Deb Nath
; Dept : CSE
; Date : 20-10-2018

.model small
.stack 100h

.data
    n db ?
    n2 db 0
    fac db 1
    msg1 db 'Enter N(0 to 3) : $'
    msg2 db 'Factorial of  $'
.code
main proc
    
    mov ax,@data
    mov ds,ax
    
    lea dx,msg1
    mov ah,9
    int 21h
    
    
    mov ah,1
    int 21h
    mov n,al
    mov n2,al
    
    
    mov ah,2
    mov dl,0ah
    int 21h
    mov dl,0dh
    int 21h
    
    
    mov bl,1
    mov al,fac
    factorial:
    cmp n,30h
    je result
    mul bl
    inc bl
    dec n
    jmp factorial
    
    
    result:
    add al,30h
    mov fac,al
    
    lea dx,msg2
    mov ah,9
    int 21h
    
    mov ah,2
    mov dl,n2
    int 21h
    mov dl,':'
    int 21h
    mov dl,' '
    int 21h
    
    mov ah,2
    mov dl,fac
    int 21h
    
    
    
    mov ah,4ch
    int 21h
    main endp
end main 