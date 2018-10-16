.MODEL SMALL
.STACK 100H

.DATA

.CODE
MAIN PROC
    INCLUDE 'EMU8086.INC'  ;For NEW LINE
    
    MOV AX,@DATA
    MOV DS,AX
    
    MOV AH,1
    INT 21H
    MOV BL,AL
    INT 21H
    MOV CL,AL 
    
    PRINTN ''   ;Here print New Line
    
    CMP BL,CL
    JG L1
    
    
    L2:
    MOV AH,2
    MOV DL,CL
    INT 21H
    JMP EXIT
    
    L1:
    MOV AH,2
    MOV DL,BL
    INT 21H
    JMP EXIT 
    
    EXIT:
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN
    
       