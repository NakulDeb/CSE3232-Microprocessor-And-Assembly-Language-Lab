;*
;**
;***
;****
;*****

.MODEL SMALL
.STACK 100H
.DATA
N DW 5

.CODE
MAIN PROC
    
    include 'emu8086.inc' 
    
    MOV AX,@DATA
    MOV DS,AX

    
    MOV BX,1
    MOV CX,1
    
    L1:
    MOV CX,BX
        L2:
        MOV AH,2
        MOV DL,'*'
        INT 21H
        LOOP L2
        
    INC BX
    CMP BX,N
    JG EXIT
    printn ''
    LOOP L1
    
    
    EXIT:
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN
    
    