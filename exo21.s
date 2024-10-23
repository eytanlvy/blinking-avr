.text
    ldi 0x18, 0xff  ;1 cycle cpu
loop:
    dec 0x18        ;1 cycle cpu
    brne loop       ;2 cycles cpu si true, 1 cycle cpu si false
                    ;total = 1 + (1+2)*(val_initiale_r24 - 1) + 2 = 3*(val_initiale_r24)
end:
    rjmp end 
