      FIM R0R1 $17
      FIM R2R3 $17
      FIM R4R5 $4
      FIM R6R7 $0

      LD R5	;complement process to define counters
      CMA
      IAC 
      XCH R7
      LD R4
      CMA
      XCH R6

      LDM 0
      JUN TEST
LOOP,
     ld R1      
     add R3     
     daa        
     XCH R1     
     tcc        
     add R0
     add R2
     daa
     XCH R0

     tcc
     wr1
     JUN test
 ;JCN $2, dec

TEST,
     ISZ R7, LOOP
     LD R5
     CMA 
     XCH R7
     ISZ R6, LOOP
     LD R1
     WR3
     LD R0
     WR2
     JUN done

done,
      JUN done
