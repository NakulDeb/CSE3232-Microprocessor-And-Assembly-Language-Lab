.MODEL SMALL
.STACK 100H
.DATA
N DW ?
ARR DB 3 DUP(?)

.CODE
MAIN PROC
    
    include 'emu8086.inc'
    
    MOV AX,@DATA
    MOV DS,AX
    
    MOV AH,1
    INT 21H
    SUB AX,130H
    MOV N,AX
    
    MOV CX,N
    MOV SI,OFFSET ARR
    
    INPUT:
    MOV AH,1
    INT 21H
    MOV [SI],AL
    INC SI
    LOOP INPUT
    
    
    MOV CX,N
    MOV SI,OFFSET ARR
    printn ''
    
    
    OUTPUT:
    MOV AH,2
    MOV DL,[SI]
    INT 21H
    INC SI
    print ' '
    LOOP OUTPUT
    
    
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN
    
    