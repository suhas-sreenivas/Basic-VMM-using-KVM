all: main smallkern_obj_nasm smallkern_bin

main:
	gcc main.c -lncurses -o basic-vmm

smallkern_obj_nasm:
	nasm -f elf32 smallkern_nasm.asm -o smallkern.o

smallkern_bin:
	ld -m elf_i386 -Ttext 0x1000 --oformat binary -o smallkern smallkern.o

smallkern_obj_gas:
	as --32 -o smallkern.o  smallkern_gas.s