.MODEL SMALL
.STACK 100H
.DATA
N DW ?
ARR DB 100 DUP(?)
CK DW 0

MSG1 DB 'How many number you want ot enter : $'
MSG2 DB 'Enter the numbers : $'
MSG3 DB 'The biggest number is : $'

.CODE 
MAIN PROC
    
    include 'emu8086.inc'
    
    MOV AX,@DATA
    MOV DS,AX
    
    
    LEA DX,MSG1
    MOV AH,9
    INT 21H
    
    MOV AH,1
    INT 21H
    SUB AX,130H
    MOV N,AX
    printn ''
    
    
    MOV CX,N
    MOV SI,OFFSET ARR
    
    
    LEA DX,MSG2
    MOV AH,9
    INT 21H
    
    
    input:
    MOV AH,1
    INT 21H
    MOV [SI],AL
    INC SI
    print ' '
    LOOP input
    
    printn '' 
    
    
    MOV CX,N
    MOV SI,OFFSET ARR
    
    MOV BL,[SI]
    outer:

        inner:
            INC SI
            CMP [SI],BL
            JNG end
            JG swap
            swap:
            MOV BL,[SI]
            end:
        LOOP inner
        
        INC CK
        MOV CX,N
        SUB CX,CK
        MOV SI,OFFSET ARR
    LOOP outer
        
            
    LEA DX,MSG3
    MOV AH,9
    INT 21H
    MOV AH,2
    MOV DL,bl
    INT 21H
    INC SI
    
    
    
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN
 