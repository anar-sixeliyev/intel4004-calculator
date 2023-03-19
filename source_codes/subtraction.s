;subtraction
; jcn $c end ; $0010 inverted, A=1, C is set, TEST is set
    FIM R0R1 $5 
    FIM R2R3 $35
    FIM R4R5 $9
    FIM R6R7 $6

    LD R0
    SUB R2
    JCN $2 init
    LD R1
    xch R3
    xch R1
    LD R0
    xch R2
    xch R0
init,
    clc 
    LD R1          ; load R1 into accumulator
    SUB R3         ; subtract first digit of second number
    WR3
    xch R9
    JCN $2, pos    

    LD R0
    JCN $0, neg
    DAC
    WR2
    xch R0 
    LD R1
    ADD R5
    SUB R3
    WR3
    LD R0
    SUB R2
    IAC
    WR2
    jun done 

neg,
    LD R9
    CMA            
    CLC            
    IAC            
    WR3
    STC            

done,
    JUN done       ; endless loop

pos,
   ;WR3
   IAC
   LD R0
   SUB R2
   WR2
   JUN done
