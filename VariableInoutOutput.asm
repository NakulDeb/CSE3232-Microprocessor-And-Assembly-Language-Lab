.MODEL SMALL
.STACK 100H

.DATA
A DB ? 
B DB ?

.CODE
MAIN PROC
    
    MOV AX,@DATA   ;Initialization of Data Segment
    MOV DS,AX   
    
    MOV AH,1
    INT 21H
    MOV A,AL 
    INT 21H
    MOV B,AL
    
    ;ADD A,48       ;A = A+48(For numeric)  It is used when user initied data
    
    MOV AH,2
    MOV DL,A
    INT 21H
    MOV DL,B
    INT 21H
    
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN