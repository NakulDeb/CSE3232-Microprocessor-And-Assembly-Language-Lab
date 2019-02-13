.model small
.stack 100h

.data
str db 100 dup('$')
msg1 db 'Enter a String : $'
msg2 db 'Your String is : $'

.code
main proc
    include 'emu8086.inc'
    
    mov ax,@data
    mov ds,ax
    
    lea dx,msg1
    mov ah,9
    int 21h
    
    mov si,offset str
    
    input:
        mov ah,1
        int 21h
        cmp al,0dh
        je exit
        mov [si],al
        inc si
    loop input
    
   
    
    
    exit:
    mov ah,2
    mov dl,0ah
    int 21h
    mov dl,0dh
    int 21h
    
    lea dx,msg2
    mov ah,9
    int 21h
    
    
    mov dx,offset str
    ;lea dx,str
    mov ah,9
    int 21h
        
    
    mov ah,4ch
    int 21h
    main endp
end main
    
    