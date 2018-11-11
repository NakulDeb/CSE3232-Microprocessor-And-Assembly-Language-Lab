; University of Rajshahi
; Name : Nakul Deb Nath
; Dept : CSE
; Date : 20-10-2018

.model small
.stack 100h

.data
    n db ?
    sum db 30h
    msg1 db 'Enter N(1 to 3) : $'
    msg2 db 'Summation is : $'

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
    
    mov ah,2
    mov dl,0ah
    int 21h
    mov dl,0dh
    int 21h
    
    summation:
    mov bl,n
    sub bl,30h
    add sum,bl
    dec n
    cmp n,30h
    je result
    jmp summation
    
    
    result:
    lea dx,msg2
    mov ah,9
    int 21h

    mov ah,2
    mov dl,sum
    int 21h
    
    
    mov ah,4ch
    int 21h
    main endp
end main
    
    