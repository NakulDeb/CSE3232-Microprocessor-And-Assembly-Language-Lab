; University of Rajshahi
; Name : Nakul Deb Nath
; Dept : CSE
; Date : 18-10-2018


.model small
.stack 100h

.data
    str db 100 dup('$')
    msg1 db "Enter a String(use any char) : $"
    msg2 db 'After the Case Conversion    : $'
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
    
    mov si,offset str
    dec si
    mov ah,2
    
    
    case_conversion:
    inc si
    cmp [si],'$'
    je exit
    cmp [si],01h
    je recover_$
    cmp [si],40h
    jg greater_40h
    not_letter:
    mov dl,[si]   ; It is not Letter
    int 21h
    jmp case_conversion
    
    
    recover_$:  ; Here recover $ sign
    mov dl,'$' 
    int 21h
    jmp case_conversion
    

    
    greater_40h:
    cmp [si],5bh
    jl upper_case
    jge lower_case
    
    
    upper_case:
    mov dl,[si]
    add dl,32   ;Here Upper to Lower
    int 21h
    jmp case_conversion
    
    
    lower_case:
    cmp [si],61h
    jl not_letter
    cmp [si],7ah
    jg not_letter
    mov dl,[si]
    sub dl,32   ;Lower to Upper
    int 21h
    jmp case_conversion
    
    
    
    
    
    ;mov dx,offset str
    ;mov ah,9
    ;int 21h
    
    exit:
    mov ah,4ch
    int 21h
    main endp
end main
    
