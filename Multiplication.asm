.MODEL SMALL
.STACK 100H

.DATA
    A DB ?
    B DB ?
    
.CODE
MAIN PROC
    
    MOV AX,@DATA
    MOV DS,AX
    
    MOV AH,1
    INT 21H
    MOV A,AL
    INT 21H
    MOV B,AL
    
    MOV AL,A
    MOV BL,B
    
    SUB AL,48
    SUB BL,48
    
    MUL BL
    ADD AL,48
    
    MOV AH,2
    MOV DL,AL
    INT 21H
    
    
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN