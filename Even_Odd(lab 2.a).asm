; University of Rajshahi
; Name : Nakul Deb Nath
; Dept : CSE
; Date : 20-10-2018

.model small
.stack 100h

.data
    n db ?
    msg1 db 'Enter N (0 to 9) : $'
    msg2 db 'This number is Even$'
    msg3 db 'This number is Odd$'
    
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
    

    mov dx,0
           
    mov al,n       
    mov bx,2
    div bx
    cmp dx,0
    je even
    jne odd
    
    
    even:
    lea dx,msg2
    mov ah,9
    int 21h
    jmp exit
    
    odd:
    lea dx,msg3
    mov ah,9
    int 21h
    jmp exit
    
    
    
    exit:
    mov ah,4ch
    int 21h
    main endp
end main
    
    