.model small
.stack 100h
.data
    arr db 100 dup(?)
    m dw 10
    num1 dw 0
    num2 dw 0
    result_low_byte dw 0
    result_upp_byte dw 0
    
    msg1 db 'Enter 1st Number(not gater then word) : $'
    msg2 db 'Enter 2nd Number(not gater then word) : $'
    msg3 db 'After Multplying(Result in Hex Form  ): $' 
    
.code
main proc
    
    mov ax,@data
    mov ds,ax
    
    lea dx,msg1
    mov ah,9
    int 21h
    
    mov ah,1
    mov si,offset arr 
    input1:
    int 21h
    cmp al,0dh
    je input1_ended
    sub al,30h
    mov [si],al
    inc si
    jmp input1
    
    input1_ended:
    mov ax,0
    mov dx,0
    mov cx,si
    mov bx,1
    combind1:
    dec si
    mov ax,0
    mov al,[si]
    mov dx,0
    mul bx
    add num1,ax
    mov dx,0
    mov ax,bx
    mul m
    mov bx,ax
    loop combind1

    mov ah,2
    mov dl,0ah
    int 21h
    mov dl,0dh
    int 21h
    
    
    
    
    
    
    lea dx,msg2
    mov ah,9
    int 21h
    
    mov ah,1
    mov si,offset arr 
    input2:
    int 21h
    cmp al,0dh
    je input2_ended
    sub al,30h
    mov [si],al
    inc si
    jmp input2
    
    input2_ended:
    mov ax,0
    mov cx,si
    mov bx,1
    combind2:
    dec si
    mov ax,0
    mov dx,0
    mov al,[si]
    mul bx
    add num2,ax
    mov ax,bx
    mul m
    mov bx,ax
    loop combind2
    
    
    
    
    
    mov ax,num1
    mul num2
    mov result_low_byte,ax
    mov result_upp_byte,dx
    mov bx,010h
    mov dx,0 
    
    
    mov ax,result_low_byte
    mov si,offset arr
    mov cx,4 
    low_byte:
    div bx
    add dx,30h
    mov [si],dx
    inc si
    mov dx,0
    loop low_byte
    
    
    
    
    mov ax,result_upp_byte
    mov cx,4
    mov dx,0
    upp_byte:
    div bx
    add dx,30h
    mov [si],dx
    inc si
    mov dx,0
    loop upp_byte
    



    mov ah,2
    mov dl,0ah
    int 21h
    mov dl,0dh
    int 21h
    
    
    lea dx,msg3
    mov ah,9
    int 21h


    mov ah,2
    output:
    dec si
    mov dl,[si]
    cmp dl,3ah
    jl hex
    add dl,7
   
    hex:
    int 21h
    cmp si,0
    je exit
    loop output
   
    
    exit:
    mov ah,4ch
    int 21h
    main endp
end main