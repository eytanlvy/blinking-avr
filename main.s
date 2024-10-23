.text
    ;DDRB : 0x04 (in IO space)
	;PORTB : 0x05 (in IO space)
    sbi 0x04, 5 ; set DDRB5
    sbi 0x05, 5 ; set PORTB5
    cbi 0x05, 5 ; clear PORTB5
loop:
    rjmp loop
