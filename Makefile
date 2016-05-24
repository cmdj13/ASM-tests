ASM = nasm -g -f elf
LD = ld -s
CC = gcc

all:
	clear
	@echo Assembling everything...
	@$(ASM) -o alphabet.o src/alphabet.s
	@$(ASM) -o div.o src/div.s
	@$(ASM) -o fdiv.o src/fdiv.s
	@$(ASM) -o number.o src/number.s
	@$(ASM) -o rdiv.o src/rdiv.s
	@$(ASM) -o read.o src/read.s
	@$(ASM) -o time.o src/time.s
	@$(ASM) -o write.o src/write.s
	@echo Linking everything...
	@$(LD) -o alphabet alphabet.o
	@$(CC) -o div div.o
	@$(CC) -o fdiv fdiv.o
	@$(CC) -o number number.o
	@$(CC) -o rdiv rdiv.o
	@$(LD) -o read read.o
	@$(CC) -o time time.o
	@$(LD) -o write write.o
	@rm *.o
	@echo Done!
	@echo

alphabet: src/alphabet.s
	clear
	@echo Assembling...
	@$(ASM) -o $@.o src/$@.s
	@echo Linking...
	@$(LD) -o $@ $@.o
	@rm $@.o
	@echo Done!
	@echo

div: src/div.s
	clear
	@echo Assembling...
	@$(ASM) -o $@.o src/$@.s
	@echo Linking...
	@$(CC) -o $@ $@.o
	@rm $@.o
	@echo Done!
	@echo

fdiv: src/fdiv.s
	clear
	@echo Assembling...
	@$(ASM) -o $@.o src/$@.s
	@echo Linking...
	@$(CC) -o $@ $@.o
	@rm $@.o
	@echo Done!
	@echo

clean:
	clear
	@echo Cleaning up...
	@rm -f alphabet div number read time write
	@echo Done!
	@echo

number: src/number.s
	clear
	@echo Assembling...
	@$(ASM) -o $@.o src/$@.s
	@echo Linking...
	@$(CC) -o $@ $@.o
	@rm $@.o
	@echo Done!
	@echo

rdiv: src/rdiv.s
	clear
	@echo Assembling...
	@$(ASM) -o $@.o src/$@.s
	@echo Linking...
	@$(CC) -o $@ $@.o
	@rm $@.o
	@echo Done!
	@echo

read: src/read.s
	clear
	@echo Assembling...
	@$(ASM) -o $@.o src/$@.s
	@echo Linking...
	@$(LD) -o $@ $@.o
	@rm $@.o
	@echo Done!
	@echo

time: src/time.s
	clear
	@echo Assembling...
	@$(ASM) -o $@.o src/$@.s
	@echo Linking...
	@$(CC) -o $@ $@.o
	@rm $@.o
	@echo Done!
	@echo

write: src/write.s
	clear
	@echo Assembling...
	@$(ASM) -o $@.o src/$@.s
	@echo Linking...
	@$(LD) -o $@ $@.o
	@rm $@.o
	@echo Done!
	@echo