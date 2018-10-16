.MODEL SMALL
.STACK 100H

.DATA
A DB 2 
B DB 3

.CODE
MAIN PROC
    
    MOV AX,@DATA   ;Initialization of Data Segment
    MOV DS,AX   
    
    ;MOV AH,1
    ;INT 21H
    ;MOV A,AL 
    ;INT 21H
    ;MOV B,AL
    
    
    MOV AL,A
    MOV BL,B
    ADD AL,BL
    ADD AL,48
    
    MOV AH,2
    MOV DL,AL
    INT 21H

    
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN