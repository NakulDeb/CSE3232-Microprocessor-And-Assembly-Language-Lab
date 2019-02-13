.model small
.stack 100h
.data
arr db 100 dup

num dd 0
upp_b dw 0
low_b dw 0

.code
main proc
    ;include 'emu8086.inc' 
 
   mov ax,0ffffh
   mov dx,0ffffh
   mov upp_b,dx
   mov low_b,ax
   mov bx,010h
   mov cx,4
   mov si,offset arr
   
   mov ax,low_b
   mov cx,4
   mov dx,0 
   low_byte:
   div bx
   add dx,30h
   cmp dx,3ah
   mov [si],dx
   inc si
   mov dx,0
   loop low_byte
   
   

   
   mov ax,upp_b
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
   output:
   dec si
   mov dl,[si]
   call hex
   int 21h
   cmp si,0
   je exit
   loop output

   
   exit:
   main endp
hex proc
    cmp dl,3ah
    jge hexadd
    jmp ended: 
    hexadd:
    add dl,7
    jmp ended
    ended:
    ret
    hex endp
end main