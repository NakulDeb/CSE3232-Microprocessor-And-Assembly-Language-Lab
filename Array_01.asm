.MODEL SMALL
.STACK 100H

.DATA
ARR DB 1,2,3,4

.CODE
MAIN PROC
    
    include 'emu8086.inc'
    
    MOV AX,@DATA
    MOV DS,AX
    
    
    MOV CX,4
    MOV SI,OFFSET ARR
    
    L1:
    MOV AH,2
    MOV DL,[SI]
    ADD DL,48
    INT 21H
    INC SI
    print ' '
    LOOP L1
    
    
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN