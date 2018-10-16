.MODEL SMALL
.STACK 100H

.DATA
A DB 5 
B DB 3

.CODE
MAIN PROC
    
    MOV AX,@DATA   ;Initialization of Data Segment
    MOV DS,AX   
     

    
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