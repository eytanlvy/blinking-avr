.text
    ldi 0x14, 0x27  ;1 cycle mettre 0x27 pour faire 500ms
loop3:; total : (6 + loop2)*X3 + 1
    ldi 0x13, 0xff  ;1 cycle 
    rjmp loop2      ;2 cycles
    dec 0x14        ;1 cycle
    brne loop3      ;2 cycles si true, 1 cycle si false
    rjmp end        ;2 cycles
loop2:; total : (6 + loop1)*X2 + 1
    ldi 0x12, 0xff  ;1 cycle
    rjmp loop1      ;2 cycles
    dec 0x13        ;1 cycle
    brne loop2      ;2 cycles si true, 1 cycle si false
    rjmp loop3      ;2 cycles
loop1:;total : 3*X1 + 1 cycles
    dec 0x12        ;1 cycle
    brne loop1      ;2 cycles si true, 1 cycle si false
    rjmp loop2      ;2 cycles
;nb cycles total = (6 + ((6 + 3*X1 + 1)*X2 + 1))*X3 + 1 = (6 + ((7 + 3*X1)*X2 + 1))*X3 + 1 = (7 + 7*X2 + 3*X1*X2)*X3 + 1 = 1 + 7*X3 + 7*X2*X3 + 3*X1*X2*X3
;avec X1 = X2 = 255, et X3 = 39, on a 8 064 886 cycles, soit a peu pres 500ms
end:
    rjmp end
