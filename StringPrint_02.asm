.MODEL SMALL
.STACK 100H

.DATA
A DB 'Rajshahi University.$'
B DB 'Computer Sceince and Enginnering.$'

.CODE
MAIN PROC
    
    INCLUDE 'EMU8086.INC'
    
    MOV AX,@DATA
    MOV DS,AX
     
     
     ;String output Process 1
    LEA DX,A
    MOV AH,9
    INT 21H
    
    PRINTN '' 
    
     ;String output Process 2
    MOV AH,9
    MOV DL,OFFSET B
    INT 21H
    
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN