.MODEL SMALL
.STACK 100H

.DATA
.CODE
MAIN PROC
    INCLUDE 'EMU8086.INC'
    
    MOV AH,1
    INT 21H
    MOV BL,AL
    INT 21H
    MOV BH,AL
    INT 21H
    MOV CH,AL
    
    PRINTN ''
    
    
    CMP BL,BH
    JG L1
    JMP L2
    
    
    L1:
    CMP BL,CH
    JG L3
    JMP EXIT
    
    L3:
    MOV AH,2
    MOV DL,BL
    INT 21H
    JMP EXIT
    
    
    L2:
    CMP BH,CH
    JG L4
    JMP L5 
    
    L4:
    MOV AH,2
    MOV DL,BH
    INT 21H
    JMP EXIT
    
    
    L5:
    MOV AH,2
    MOV DL,CH
    INT 21H
    JMP EXIT
    
    
    EXIT:
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN
    
    
    
    