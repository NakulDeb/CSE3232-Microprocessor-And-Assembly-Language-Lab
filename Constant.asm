.MODEL SMALL
.STACK 100H

.DATA
A EQU 'A'

.CODE
MAIN PROC
    
    MOV AX,@DATA
    MOV DS,AX
    
    MOV A,'B'   ; Want to change but not changing
    
    MOV AH,2
    MOV DL,A
    INT 21H
    
    
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN