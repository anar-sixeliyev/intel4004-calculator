;division
; jcn $c end ; $0010 inverted, A=1, C is set, TEST is set

    FIM R0R1 $18 ; initialize R0=2 & R1=4
    FIM R2R3 $5    ; clear result pair
    FIM R4R5 $9
    FIM R6R7 $0

zero,
    LD R3
    JCN $2, end
    LD R1
    JCN $2, end

circle,
    LD R0
    SUB R2
    JCN $2, init
    LD R1
    SUB R3
    JCN $2, init
    LD R7
    WR1
    LDM $C
    WR2
    LD R1
    WR3
    JUN end
init,
    clc 
    LD R1          
    SUB R3         
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
    RD3
    XCH R1
    RD2
    XCH R0
    ISZ R7, circle

end 
    JUN end       ; endless loop

pos,
   ;WR3
   IAC
   LD R0
   SUB R2
   WR2
   JUN done
