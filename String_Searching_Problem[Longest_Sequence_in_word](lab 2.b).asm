; University of Rajshahi
; Name : Nakul Deb Nath
; Dept : CSE
; Date : 19-10-2018

.model small
.stack 100h

.data
    str db 100 dup('$')
    indx dw 0
    max db 0
    count db 0
    
    msg1 db 'Enter The String or Word        : $'
    msg2 db 'The longest sequence of letters : $'
       
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
    jmp input
    
    
    
    input_ended:
    mov ah,2
    mov dl,0ah
    int 21h
    mov dl,0dh
    int 21h
    
    
    
    mov si,offset str
    mov indx,si
    
    ;Find out the longest sequence of letters in the word
    
    search:
    cmp [si],'$'
    je result
    mov bl,[si+1]
    sub bl,1
    cmp [si],bl
    je match
    jne unmatch
    
    
    
    match:
    inc si
    inc count
    jmp search
    
    
    unmatch:
    inc indx
    mov si,indx
    mov bl,count
    mov count,0
    cmp bl,max
    jg max_sequence
    jmp search
    
    
    max_sequence:
    mov max,bl
    jmp search
    
    
    result:
    lea dx,msg2
    mov ah,9
    int 21h
    
    mov ah,2
    mov dl,max
    add dl,31h
    int 21h
    jmp exit
    
    
    exit:
    mov ah,4ch
    int 21h
    main endp
end main
    
    