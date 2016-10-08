ASM = nasm -f elf32
LD = ld -s -m elf_i386
CC = gcc -m32
INDIR = src
OUTDIR = bin

all:
	mkdir -p $(OUTDIR)
	clear
	@echo Assembling everything...
	@$(ASM) -o alphabet.o $(INDIR)/alphabet.s
	@$(ASM) -o div.o $(INDIR)/div.s
	@$(ASM) -o fdiv.o $(INDIR)/fdiv.s
	@$(ASM) -o number.o $(INDIR)/number.s
	@$(ASM) -o rdiv.o $(INDIR)/rdiv.s
	@$(ASM) -o read.o $(INDIR)/read.s
	@$(ASM) -o time.o $(INDIR)/time.s
	@$(ASM) -o write.o $(INDIR)/write.s
	@echo Linking everything...
	@$(LD) -o $(OUTDIR)/alphabet alphabet.o
	@$(CC) -o $(OUTDIR)/div div.o
	@$(CC) -o $(OUTDIR)/fdiv fdiv.o
	@$(CC) -o $(OUTDIR)/number number.o
	@$(CC) -o $(OUTDIR)/rdiv rdiv.o
	@$(LD) -o $(OUTDIR)/read read.o
	@$(CC) -o $(OUTDIR)/time time.o
	@$(LD) -o $(OUTDIR)/write write.o
	@rm *.o
	@echo Done!
	@echo