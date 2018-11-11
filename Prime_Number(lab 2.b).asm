; University of Rajshahi
; Name : Nakul Deb Nath
; Dept : CSE
; Date : 20-10-2018

.model small
.stack 100h

.data
    num dw ?
    dv dw 2
    msg1 db 'Enter a Number : $'
    msg2 db 'This Number is Prime$'
    msg3 db 'This Number is not Prime$'
.code
main proc
    
    mov ax,@data
    mov ds,ax
    
    lea dx,msg1
    mov ah,9
    int 21h
    
    mov ah,1
    int 21h
    sub ax,130h
    mov num,ax
    
    
    
    mov ah,2
    mov dl,0ah
    int 21h
    mov dl,0dh
    int 21h
    
    
    mov ax,num
    cmp ax,1
    jle not_prime
    cmp ax,2
    je prime
    
    mov dx,0
    div dv
    mov dv,ax
    
    mov bx,2
    
    prime_chack:
    mov dx,0
    mov ax,num
    div bx
    cmp dx,0
    je not_prime
    inc bx
    cmp bx,dv
    jg prime
    jmp prime_chack
    
    prime:
    lea dx,msg2
    mov ah,9
    int 21h
    jmp exit
    
    not_prime:
    lea dx,msg3
    mov ah,9
    int 21h
    
    
    exit:
    mov ah,4ch
    int 21h
    main endp
end main
    
    

