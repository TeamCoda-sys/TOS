############################
# To Foundation 2021
############################
# to-foundation.rf.gd
############################

function tkernel_build() {
	clear
	echo Building...
	nasm -f elf32 asm/kernel.asm -o sobj/kasm.o
	echo COMP-ASM			KERNEL.ASM
	sleep 2
	gcc -m32 -c init/kernel.c -o sobj/kc.o -ffreestanding
	echo CO					KERNEL.C
	sleep 2
	gcc -m32 -c include/system.c -o obj/system.o -ffreestanding
	echo CO					ISR.C
	sleep 2
	gcc -m32 -c include/isr.c -o obj/isr.o -ffreestanding
	echo CO					IDT.C
	sleep 2
	gcc -m32 -c include/idt.c -o obj/idt.o -ffreestanding
	echo CO					UTIL.C
	sleep 2
	gcc -m32 -c include/util.c -o obj/util.o -ffreestanding
	echo CO					STRING.C
	sleep 2
	gcc -m32 -c include/string.c -o obj/string.o -ffreestanding
	echo CO					SCREEN.C
	sleep 2
	gcc -m32 -c include/screen.c -o obj/screen.o -ffreestanding
	echo CO					KB.C
	sleep 2
	gcc -m32 -c include/kb.c -o obj/kb.o -ffreestanding
	echo CC					ULTRASHELL.C
	sleep 2
	gcc -m32 -c include/ultrashell.c -o obj/ultrashell.o -ffreestanding
	echo LD					KERNEL.BIN
	sleep 13
	ld -m elf_i386 -T link.ld -o build/boot/kernel.bin sobj/kasm.o sobj/kc.o obj/isr.o obj/system.o obj/string.o obj/screen.o obj/kb.o obj/idt.o obj/util.o obj/ultrashell.o
}

function tkernel_run() {
	qemu-system-x86_64 -kernel build/boot/kernel.bin
}

function tkernel() {
	echo TKERNEL 2021
	echo tkernel_install_tools : Install Tools to build Kernel
	echo tkernel_build : Build OS
	echo tkernel_run : Run OS
}

function tkernel_install_tools() {
	clear
	echo TKERNEL 2021
	sudo apt install qemu nasm gcc
	echo All Tools has bein installed or upgraded
}

echo TKERNEL
echo Please type "source ./make.sh"
echo If you have already type source ./make.sh , type tkernel
