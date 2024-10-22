.text
	sbi 0x04, 5
	sbi 0x05, 5
loop:
	rjmp loop
