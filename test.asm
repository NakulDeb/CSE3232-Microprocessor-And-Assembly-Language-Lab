;********** For MUL operation****************
;num(8 bit) * num(8 bit) = result(16 bit)
;lower Byte = al , Upper byte = ah
;num(16 bit) * num(16 bit) = result(32 bit)
;lower byte = ax , upper byte = dx         


;********** For DIV operation****************
;num(16 bit) * num(16 bit) = result(8 bit)
;Quetient = al , Reminder = ah
;num(32 bit) * num(32 bit) = result(16 bit)
;Quetient = ax , Reminder = dx         



.model small
.stack 100h
.data
    arr db 100 dup(?)
    m db 10
    num1 db 0
    num2 db 0
    result_low_byte db 0
    result_upp_byte db 0
    
    msg1 db 'Enter 1st Number(not gater theb Byte) : $'
    msg2 db 'Enter 2nd Number(not gater theb Byte) : $'
    msg3 db 'After Multplying (Result in Word  )   : $'

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
    
    mov cx,si
    mov bl,1
    combind1:
    dec si
    mov al,[si]
    mul bl
    add num1,al
    mov al,bl
    mul m
    mov bl,al
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
    
    mov cx,si
    mov bl,1
    combind2:
    dec si
    mov al,[si]
    mul bl
    add num2,al
    mov al,bl
    mul m
    mov bl,al
    loop combind2
    
    
    
    
    
    mov al,num1
    mul num2
    mov result_low_byte,al
    mov result_upp_byte,ah

    
    
    mov dx,0
    mov cx,0
    mov bx,10
    mov al,result_low_byte
    mov ah,result_upp_byte
    
    low_byte_convert:
    div bx
    push dx
    mov dx,0
    inc cx
    cmp ax,10
    jl low_byte_convertion_ended
    jmp low_byte_convert 
    
    
    low_byte_convertion_ended:
    push ax
    inc cx
    
    
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
    pop dx
    add dx,30h
    int 21h
    loop output
    
    
    
    
    
    
    
    exit:
    mov ah,4ch
    int 21h
    main endp
end main
    
    
    