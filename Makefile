upload: program.hex
	avrdude -v -patmega328p -carduino -P/dev/ttyACM0 -b115200 -Uflash:w:program.hex

program.hex: program.elf
	avr-objcopy -O ihex $^ $@

program.elf: main.o
	avr-ld $^ -o $@

main.o: main.s
	avr-as $^ -o $@

clean:
	rm -f program.* *.o
