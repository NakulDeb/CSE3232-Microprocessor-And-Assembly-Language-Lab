; University of Rajshahi
; Name : Nakul Deb Nath
; Dept : CSE
; Date : 18-10-2018

.model small
.stack 100h

.data
    str1 db 100 dup('$')
    str2 db 100 dup('$')
    str1_indx dw 0
    back_track_indx dw 0
    str2_indx dw 0
    offset_str2 dw 0
    length1 db 0
    length2 db 0
    
    count db 0
    direction db 0
    
    msg1 db 'Enter the 1st Word : $'
    msg2 db 'Enter the 2nd Word : $'
    msg3 db 'Result : String-2 is Sub String of String-1.$'
    msg4 db 'Result : String-1 is Sub String of String-2.$'
    msg5 db 'Result : Not Sub String each other$.'
    
.code 
main proc
    
    mov ax,@data
    mov ds,ax
    
    lea dx,msg1
    mov ah,9
    int 21h
    
    mov si,offset str1
    mov ah,1
    
    input_str1:    ;Input 1st String
    int 21h
    cmp al,0dh
    je input_str1_ended
    mov [si],al
    inc si
    jmp input_str1
    
    
    input_str1_ended:
    mov ah,2
    mov dl,0ah
    int 21h
    mov dl,0dh
    int 21h
    
    lea dx,msg2
    mov ah,9
    int 21h
    
    mov si,offset str2
    mov ah,1
    
    input_str2:     ;Input 2nd String
    int 21h
    cmp al,0dh
    je input_str2_ended
    mov [si],al
    inc si
    jmp input_str2
    
    
    input_str2_ended:
    mov ah,2
    mov dl,0ah
    int 21h
    mov dl,0dh
    int 21h
     
    
    
    
    ;find length of strings 
    
    mov si,offset str1  
    
    string1_length:
        cmp [si],'$'
        je count1_ended
        inc length1
        inc si
    loop string1_length
    count1_ended:
    
    
    mov si,offset str2
    
    string2_length:
        cmp [si],'$'
        je count2_ended
        inc length2
        inc si
    loop string2_length
    count2_ended:
    


    
    
    
    
    ;direction (String1 sub String of String2 / String2 sub String of String1)
        
    mov bl,length1
    cmp bl,length2
    jge string1_grater_than_string2
    jng string2_grater_then_string1
    
    
    
    string1_grater_than_string2:
    
    mov si,offset str1
    mov str1_indx,si
    mov back_track_indx,si
    
    mov si,offset str2
    mov str2_indx,si
    mov offset_str2,si
    
    mov direction,1
    
    mov bx,0
    mov cx,0
    mov dx,0
    jmp search
    
    
    
    string2_grater_then_string1:
    
    mov si,offset str2
    mov str1_indx,si
    mov back_track_indx,si
    
    mov si,offset str1
    mov str2_indx,si
    mov offset_str2,si
    
    mov direction,2
    
    mov bl,length1
    mov length2,bl
    
    mov bx,0
    mov cx,0
    mov dx,0
    jmp search 
    
    
    
    
    ;Searching sub string
    
    
    search:
    mov si,str1_indx
    mov bl,[si]
    mov si,str2_indx
    cmp bl,'$'
    je no
    cmp bl,[si]
    je match
    jne no_match
    
    
    match:
    inc str1_indx
    inc str2_indx
    inc count
    mov dl,count
    cmp dl,length2
    je yes
    jmp search
    
    
    no_match:
    inc back_track_indx
    mov bx,back_track_indx
    mov str1_indx,bx
    mov si,offset_str2
    mov str2_indx,si
    mov count,0
    jmp search
    
    
    yes:
    cmp direction,1
    jne string2_big
    lea dx,msg3
    mov ah,9
    int 21h
    jmp exit
    
    
    string2_big:
    lea dx,msg4
    mov ah,9
    int 21h
    jmp exit
    
    
    no:
    lea dx,msg5
    mov ah,9
    int 21h
    jmp exit 
    
    
    
    
    exit:
    mov ah,4ch
    int 21h
    main endp
end main
      