;    *
;   **
;  ***
; ****
;*****

;k=0
;for(i=n;i>=1;i--){ 
;   k++;
;   for(j=n-1;j>0lj--){
;       print(' ');
;   }
;   for(;k>0;k--){
;       print(*);
;   }
;   print(\n)
;}

.MODEL SMALL
.STACK 100H
.DATA
N DW 5
D DW 1
K DW 0
MSG DB 'Enter how many line : $'

.CODE
MAIN PROC
    
    include 'emu8086.inc' 
    
    MOV AX,@DATA
    MOV DS,AX
    
    LEA DX,MSG
    MOV AH,9
    INT 21H
    
    MOV AH,1
    INT 21H
    MOV DX,AX
    
    printn ''
    
    SUB DX,130H   ; N = N-130H  ---->>Becouse it is DW
    MOV N,DX
    MOV D,DX
   
    
    MOV BX,N
    MOV CX,1
    
    
    L1:
    MOV CX,BX 
    INC K
    SUB CX,K 
        CMP CX,0
        JE L4
    
        L2:
        print ' '
        LOOP L2
        
        L4:
        MOV CX,K
        L3:
        MOV AH,2
        MOV DL,'*'
        INT 21H
        LOOP L3
        
        
        
    DEC D
    CMP D,0
    JE EXIT
    printn ''
    LOOP L1
    
    
    EXIT:
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN
    
    