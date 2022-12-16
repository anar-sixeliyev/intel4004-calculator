;ADDITION
; add two 4bit numbers on the Intel 4004

* = 0           ; start address
clb
dcl

 fim R0R1 $99    ; initialize p0
 fim R2R3 $99    ; initialize p0
 fim R8R9 $0
 
 ld R1      ; load R1 into accumulator
 add R3     ; add second number
 daa        ; adjust accumulator for decimals
 wr3        ; write to status

 tcc        ; transmit carry to accu, clear carry
 add R0
 add R2
 daa
 wr2

 tcc
 wr1

done,
 jun done       ; endless loop
