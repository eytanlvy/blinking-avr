# Blinking-avr

## About

The aim of this project is to flash the integrated LED of an Arduino UNO R3 board in assembler.

## Execution

We provide two programs, *ex24* and *ex27*.
The first one is a simple implementation of a delay function.
The second one is a simple program that flashes the integrated LED of the Arduino UNO R3 board.

```bash
make ASSEMBLY_FILE=<file>

make MAC=1 ASSEMBLY_FILE=<file> // For Mac OS
```

For exemple, to compile the ex27 function:
```bash
make ASSEMBLY_FILE=ex27
```
