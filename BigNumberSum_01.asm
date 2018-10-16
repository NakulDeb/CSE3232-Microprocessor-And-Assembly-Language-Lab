.MODEL SMALL
.STACK 100H
.CODE 
MAIN PROC
    
    include 'emu8086.inc'
    
    define_scan_num
    define_print_num
    define_print_num_uns
    
    
    call scan_num
    MOV AX,CX
    printn ''  ;For new line
    call scan_num
    ADD AX,CX
    
    putc 0AH  ;This two line also use for new line
    putc 0DH
    
    call print_num
    
    