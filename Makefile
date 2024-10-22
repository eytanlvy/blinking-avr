all: main.o program.elf program.hex

flash :
	avrdude -patmega328p -carduino -P/dev/ttyACM0 -b115200 -Uflash:w:program.hex

program.hex :
	avr-objcopy -O ihex program.elf program.hex

program.elf :
	avr-ld main.o -o program.elf

main.o: main.s
	avr-as main.s -o main.o

clean:
	rm main.o program.elf program.hex