.MODEL SMALL
.STACK 100H

.DATA
A DB ?
MSG1 DB 'This number is Even.$'
MSG2 DB 'This number is Odd.$'

.CODE 
MAIN PROC
    
    include 'emu8086.inc'
    
    MOV AX,@DATA
    MOV DS,AX
    
    MOV AH,1
    INT 21H
    MOV A,AL
    
    printn ''
    
    MOV AL,A
    MOV BX,2   
    

    DIV BX
               ; Divisor Register must be BX, and Reminder register DX
    
    CMP DX,0
    JE L1
    JMP L2
    
    
    L1:
    LEA DX,MSG1
    MOV AH,9
    INT 21H
    JMP END
    
    
    L2:
    LEA DX,MSG2
    MOV AH,9
    INT 21H
    JMP END
    
   
    
    END:
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN