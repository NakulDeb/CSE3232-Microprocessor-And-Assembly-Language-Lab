; University of Rajshahi
; Name : Nakul Deb Nath
; Dept : CSE
; Date : 19-10-2018

.model small
.stack 100h

.data
    str db 100 dup('$')
    length dw 0
    
    msg1 db 'Enter the String : $'
    msg2 db 'Sorted String    : $'
    
.code
main proc
    
    mov ax,@data
    mov ds,ax
    
    lea dx,msg1
    mov ah,9
    int 21h
    
    
    mov si,offset str
    mov ah,1
    
    input:
    int 21h
    cmp al,0dh
    je input_ended
    mov [si],al
    inc si
    inc length
    jmp input
    
    
    
    input_ended:
    ;sort
    
    mov cx,length
    dec cx

    loop1:
        mov bx,cx
        mov si,0

        comparing:
        mov al,str[si]
        mov dl,str[si+1]
        cmp al,dl
        jc noswap
        mov str[si],dl
        mov str[si+1],al
        
        noswap:
        inc si
        dec bx
        jnz comparing
    loop loop1
    
    mov ah,2
    mov dl,0ah
    int 21h
    mov dl,0dh
    int 21h
    
    
    lea dx,msg2
    mov ah,9
    int 21h
    
    lea dx,str
    mov ah,9
    int 21h
    
    
    
    mov ah,4ch
    int 21h 
    main endp
end main
     



