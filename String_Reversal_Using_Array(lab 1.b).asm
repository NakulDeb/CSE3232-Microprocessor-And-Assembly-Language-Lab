; University of Rajshahi
; Name : Nakul Deb Nath
; Dept : CSE
; Date : 18-10-2018


.model small
.stack 100h

.data
    str db 100 dup('$')
    msg1 db 'Enter a String(use any char) : $'
    msg2 db 'Reversing the given String   : $'
    
.code
main proc
    
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
    je input_ended
    cmp al,24h  ;In input chack $ sign
    je get_$
    mov [si],al
    inc si
    jmp input
    
    
    get_$:  ;Changing $ sign into other un enterable character
    mov [si],01h
    inc si
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
    
    mov ah,2
    
    output:
    dec si
    cmp [si],01h
    je recover_$
    mov dl,[si]
    int 21h
    cmp si,0
    je exit
    jmp output
    
    
    recover_$:
    mov dl,'$'
    int 21h
    cmp si,0
    je exit
    jmp output
    
    
    
    
    ;mov dx,offset str
    ;mov ah,9
    ;int 21h
    
    exit:
    mov ah,4ch
    int 21h
    main endp
end main



