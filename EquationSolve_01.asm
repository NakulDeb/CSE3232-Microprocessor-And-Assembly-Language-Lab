;A+B-C

.MODEL SMALL
.STACK 100H
.DATA  
    A DB ?
    B DB ?
    C DB ?

.CODE
MAIN PROC  
    
    MOV AX,@DATA
    MOV DX,AX
    
    MOV AH,1 
    INT 21H
    MOV A,AL
    INT 21H
    MOV B,AL
    INT 21H
    MOV C,AL
    
    
    MOV AH,2
    MOV DL,0AH
    INT 21H
    MOV DL,0DH
    INT 21H
    
    MOV AL,A
    MOV BL,B
    MOV CL,C
    
    SUB AL,48
    SUB BL,48
    SUB CL,48 
    
    ADD AL,BL
    SUB AL,CL
    ADD AL,48
    
    
    MOV AH,2
    MOV DL,AL
    INT 21H  
    
    
    
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN
    
    

    
    