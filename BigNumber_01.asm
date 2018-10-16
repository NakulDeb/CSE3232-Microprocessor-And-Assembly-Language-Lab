.MODEL SMALL
.STACK 100H
.CODE 
MAIN PROC
    
    include 'emu8086.inc'
    
    define_scan_num      ;For Scann input
    define_print_num     ;For Output
    define_print_num_uns ;For Unsigned output
    
    CALL SCAN_NUM  ;Store data in CX Register
    MOV AX,CX      ;For Output use AX Register
    
    printn ''
    
    CALL PRINT_NUM  
    
    
    MOV AH,4CH
    INT 21H
END MAIN
    
    
