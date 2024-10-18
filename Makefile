SRC = main.s
OBJ = main.o
AS = avr-as

all: $(OBJ)

$(OBJ): $(SRC)
	$(AS) $(SRC) -o $(OBJ)

clean:
	rm -f $(OBJ)
