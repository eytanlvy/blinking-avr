.text
	sbi 0x04, 1
	sbi 0x05, 1

loop:
	rjmp loop
