.text
sbi 0x04, 5         ; Configure DDRB5 comme sortie
loop:
	sbi 0x05, 5 ; set PORTB5
	rcall sleep_500_ms
	cbi 0x05, 5 ; clear PORTB5
	rcall sleep_500_ms
	rjmp loop

sleep_500_ms:
    ; Sauvegarde les registres utilisés
    ;push 0x12         ; Sauvegarde r12
    ;push 0x13         ; Sauvegarde r13
    ;push 0x14         ; Sauvegarde r14

    ldi 0x14, 0x27    ; 1 cycle
loop3:                ; total : (6 + loop2) * X3 + 1
    ldi 0x13, 0xff    ; 1 cycle (0x27 pour environ 500ms)
    rjmp loop2        ; 2 cycles
    dec 0x14          ; 1 cycle
    brne loop3        ; 2 cycles si vrai, 1 cycle si faux
    rjmp end_sleep    ; 2 cycles

loop2:                ; total : (6 + loop1) * X2 + 1
    ldi 0x12, 0xff    ; 1 cycle
    rjmp loop1        ; 2 cycles
    dec 0x13          ; 1 cycle
    brne loop2        ; 2 cycles si vrai, 1 cycle si faux
    rjmp loop3        ; 2 cycles

loop1:                ; total : 3 * X1 + 1 cycles
    dec 0x12          ; 1 cycle
    brne loop1        ; 2 cycles si vrai, 1 cycle si faux
    rjmp loop2        ; 2 cycles

end_sleep:
    ; Restaure les registres
    ;pop 0x14          ; Restaure r14
    ;pop 0x13          ; Restaure r13
    ;pop 0x12          ; Restaure r12

    ret               ; Retourne à l'appelant
