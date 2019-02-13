.model small
.stack 100h
.code

main proc
    
    mov ax,2
    call other
    mov bx,3
    
    main endp
jmp exit:

other proc
    
    mov ax,5
    mov bx,6
    
    ret
    other endp
exit:
end main


