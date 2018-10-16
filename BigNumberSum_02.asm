.MODEL SMALL
.STACK 100H 

.DATA
MSG1 DB 'Enter the 1st Number : $'
MSG2 DB 'Enter the 2nd Number : $'
MSG3 DB 'Sum : $' 

.CODE 
MAIN PROC
    
    include 'emu8086.inc' 
    
    MOV AX,@DATA
    MOV DS,AX
    
    define_scan_num
    define_print_num
    define_print_num_uns
    
    
    LEA DX,MSG1
    MOV AH,9
    INT 21H
    
    call scan_num
    MOV AX,CX
    MOV BX,AX ;Move BX becouse AX use for other works
    
    printn ''  ;For new line
    
    LEA DX,MSG2
    MOV AH,9
    INT 21H
     
    call scan_num
    MOV AX,BX
    ADD AX,CX
    
    MOV BX,AX  ;Again Move BX becouse AX use for other works
    
    printn ''
    
    LEA DX,MSG3
    MOV AH,9
    INT 21H
    
    MOV AX,BX
    call print_num
    
    