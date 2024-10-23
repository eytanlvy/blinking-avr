ASSEMBLY_FILE ?= main

ifeq ($(MAC), 1)
    PORT = /dev/tty.usbmodem1101
else
    PORT = /dev/ttyACM0
endif

upload: $(ASSEMBLY_FILE).hex
	avrdude -v -patmega328p -carduino -P$(PORT) -b115200 -Uflash:w:$(ASSEMBLY_FILE).hex

%.hex: %.elf
	avr-objcopy -O ihex $^ $@

%.elf: %.o
	avr-ld $^ -o $@

%.o: %.s
	avr-as $^ -o $@

clean:
	rm -f *.hex *.elf *.o
