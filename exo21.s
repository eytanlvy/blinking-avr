.text
    ldi 0x18, 0xff  ;1 cycle cpu
loop:
    dec 0x18        ;1 cycle cpu
    brne loop       ;2 cycles cpu si true, 1 cycle cpu si false
                    ;total = 1 + (1+2)*(val_initiale_r24 - 1) + 2 = 3*(val_initiale_r24)
    sbi 0x04, 5 ; set DDRB5
    sbi 0x05, 5 ; set PORTB5
    cbi 0x05, 5 ; clear PORTB5
end:
    rjmp end 
