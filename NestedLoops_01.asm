.MODEL SMALL
.STACK 100H
.DATA
.CODE 


;for(i = 0; i< 5; i++){
    ;for(j = 0; j < 5; j++){
        ;printf(*)
    ;}
;print(\n)
;}

MAIN PROC
    
    include 'emu8086.inc'
    
    MOV CX,5
    MOV BX,5
    
    
    
    L1:
    MOV CX,5
        L2:
        MOV AH,2
        MOV DL,'*'
        INT 21H
        LOOP L2
        
    DEC BX
    printn ''
    CMP BX,0
    JZ EXIT
    LOOP L1

    
    EXIT:
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN