.MODEL SMALL
.STACK 100H

.DATA
ARR DB 100DUP(?)
N DW ?
CK DW ?
CO DW ?

.CODE 
MAIN PROC
    include 'emu8086.inc'
    
    MOV AX,@DATA
    MOV DS,AX
    
    MOV AH,1
    INT 21H
    SUB AL,130H
    MOV N,AL
    
    MOV CX,N
    MOV SI,OFFSET ARR
    
    input:
        MOV AH,1
        INT 21H
        MOV [SI],AL
        INC SI
    LOOP input
    
    
    ;sort
    
    