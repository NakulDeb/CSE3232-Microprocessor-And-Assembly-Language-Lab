; University of Rajshahi
; Name : Nakul Deb Nath
; Dept : CSE
; Date : 19-10-2018

.model small
.stack 100h

.data
    str db 100 dup('$')
    
    vowels dw 0
    consonants dw 0
    digits dw 0
    spaces dw 0
    
    msg1 db 'Enter the String with any symble : $'
    msg2 db 'Number of Vowels     : $'
    msg3 db 'Number of Consonants : $'
    msg4 db 'Number of digits     : $'
    msg5 db 'Number of Spaces     : $'
    
    
.code 
main proc
    
    include 'emu8086.inc'
    define_scan_num
    define_print_num
    define_print_num_uns
    
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
    cmp al,'$'
    je get_$
    mov [si],al
    inc si
    jmp input
    
    
    get_$:
    mov [si],01h
    inc si
    jmp input
    
    
    
    input_ended:
    mov ah,2
    mov dl,0ah
    int 21h
    mov dl,0dh
    int 21h
    
    
    mov si,offset str
    
    chack:
    cmp [si],'$'
    je result:
    cmp [si],7ah
    jg other_symble
    cmp [si],60h
    jg letter_chack
    cmp [si],5ah
    jg other_symble
    cmp [si],40h
    jg letter_chack
    cmp [si],39h
    jg other_symble
    cmp [si],20h
    je spaces_counter
    cmp [si],2fh
    jg digit_counter
    jle other_symble
    inc si
    jmp chack
    
    
    
    other_symble:
    inc si
    jmp chack
    
    
    
    letter_chack:
    cmp [si],'a'
    je vowel_counter
    cmp [si],'A'
    je vowel_counter
    cmp [si],'e'
    je vowel_counter
    cmp [si],'E'
    je vowel_counter
    cmp [si],'i'
    je vowel_counter
    cmp [si],'I'
    je vowel_counter
    cmp [si],'o'
    je vowel_counter
    cmp [si],'O'
    je vowel_counter
    cmp [si],'u'
    je vowel_counter
    cmp [si],'U'
    je vowel_counter
    jmp consonant_counter
    
    
    vowel_counter:
    inc vowels
    inc si
    jmp chack
    
    consonant_counter:
    inc consonants
    inc si
    jmp chack
    
    spaces_counter:
    inc spaces
    inc si
    jmp chack
    
    digit_counter:
    inc digits
    inc si
    jmp chack
    
    
    
    result:
    lea dx,msg2
    mov ah,9
    int 21h
    mov ax,vowels
    call print_num
    
    
    mov ah,2
    mov dl,0ah
    int 21h
    mov dl,0dh
    int 21h 
    
    
    lea dx,msg3
    mov ah,9
    int 21h
    mov ax,consonants
    call print_num 
    
    
    mov ah,2
    mov dl,0ah
    int 21h
    mov dl,0dh
    int 21h
    
    
    lea dx,msg4
    mov ah,9
    int 21h
    mov ax,digits
    call print_num
               
               
    mov ah,2
    mov dl,0ah
    int 21h
    mov dl,0dh
    int 21h
    
    
    lea dx,msg5
    mov ah,9
    int 21h
    mov ax,spaces
    call print_num
    jmp exit



    exit:
    mov ah,4ch
    int 21h
    ;main endp
end main