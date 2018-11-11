; University of Rajshahi
; Name : Nakul Deb Nath
; Dept : CSE
; Date : 20-10-2018

.MODEL SMALL
.STACK 100H

.DATA
    ARR DB 100 DUP(?)
    N DW ?
    MSG1 DB 'Enter the amount or numbers : $'
    MSG2 DB 'Enter the numbers : $'
    MSG3 DB 'Discending Order  : $'

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
    
    MOV AH,2
    MOV DL,0AH
    INT 21H
    MOV DL,0DH
    INT 21H
    
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
    
    
    ;sort
    
    MOV CX,N
    DEC CX

    loop1:
        MOV BX,CX
        MOV SI,0

        comparing:
            MOV AL,ARR[SI] 
            MOV DL,ARR[SI+1]
            CMP AL,DL
            JG noswap

            MOV ARR[SI],DL
            MOV ARR[SI+1],AL
    
            noswap:
            INC SI
            DEC BX
            JNZ comparing

    loop loop1
    
      
    
    LEA DX,MSG3
    MOV AH,9
    INT 21H  
    
    MOV CX,N
    MOV SI,OFFSET ARR
    
    output:
        MOV AH,2
        MOV DL,[SI]
        INT 21H
        INC SI
        print ' '
    LOOP output
    
    
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN
