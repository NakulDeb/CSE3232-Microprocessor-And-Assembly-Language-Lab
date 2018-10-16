.MODEL SMALL
.STACK 100H
.DATA
.CODE
MAIN PROC
    
    INCLUDE 'EMU8086.INC'
    
    MOV AH,1 
    INT 21H
    MOV BL,AL
    
    PRINTN ''
    
    
    CMP BL,91
    JG L1
    JMP L2
    
    L1:
    SUB BL,32
    MOV AH,2
    MOV DL,BL
    INT 21H
    JMP EXIT
    
    L2:
    ADD BL,32
    MOV AH,2
    MOV DL,BL
    INT 21H
    JMP EXIT
    
    EXIT:
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN
    