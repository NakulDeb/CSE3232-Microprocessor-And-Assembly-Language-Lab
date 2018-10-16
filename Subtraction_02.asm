.MODEL SMALL
.STACK 100H

.DATA
A DB ? 
B DB ?

.CODE
MAIN PROC
    
    MOV AX,@DATA   ;Initialization of Data Segment
    MOV DS,AX   
     
     ;Input
    MOV AH,1
    INT 21H
    MOV A,AL 
    INT 21H
    MOV B,AL
    
     ;New Line
    MOV AH,2
    MOV DL,0AH
    INT 21H
    MOV DL,0DH
    INT 21H
    
     ;Addition
    MOV AL,A
    SUB AL,B
    ADD AL,48
    
    

     ;Output
    MOV AH,2
    MOV DL,AL
    INT 21H

    
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN