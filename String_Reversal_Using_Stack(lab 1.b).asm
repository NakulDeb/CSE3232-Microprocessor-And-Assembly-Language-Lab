; University of Rajshahi
; Name : Nakul Deb Nath
; Dept : CSE
; Date : 18-10-2018

.model small
.stack 100h

.data
    msg1 db 'Enter a String(use any char) : $'
    msg2 db 'Reversing the given String   : $'
.code
main proc 
    
    mov ax,@data
    mov ds,ax
    
    lea dx,msg1
    mov ah,9
    int 21h
    
    mov cx,0
    mov dx,0
    

    input:
    mov ah,1
    int 21h
    cmp al,0dh
    je input_ended
    mov dl,al
    push dx
    inc cx
    jmp input
    
    
    input_ended:
    mov ah,2
    mov dl,0ah
    int 21h
    mov dl,0dh
    int 21h
    
    lea dx,msg2
    mov ah,9
    int 21h
          
    mov dx,0
          
    output:
    mov ah,2
    pop dx
    int 21h
    cmp cx,1
    je exit
    dec cx
    jmp output
    
    
    exit:
    mov ah,4ch
    int 21h
    main endp
end main