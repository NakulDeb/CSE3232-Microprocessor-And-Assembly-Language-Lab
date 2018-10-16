.MODEL SMALL
.STACK 100H
.DATA

.CODE
MAIN PROC
        
    MOV AL,2
    MOV BL,3
    
    ADD AL,48
    ADD BL,48
    
    XCHG AL,BL
    
    MOV AH,2
    MOV DL,AL
    INT 21H
    MOV DL,BL
    INT 21H
    
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN
    