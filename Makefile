TOOLPREFIX = riscv64-unknown-elf-

CC = $(TOOLPREFIX)gcc
LD = $(TOOLPREFIX)ld
QEMU = qemu-system-riscv64

CFLAGS = -march=rv64gc -mabi=lp64 -mcmodel=medany \
         -ffreestanding -fno-pie -fno-stack-protector \
         -msmall-data-limit=0 -O0 -g -Wall -Wextra

all: kernel.elf

entry.o: entry.S
	$(CC) $(CFLAGS) -c entry.S -o entry.o

main.o: main.c
	$(CC) $(CFLAGS) -c main.c -o main.o

kernel.elf: entry.o main.o kernel.ld
	$(LD) --no-relax -T kernel.ld -o kernel.elf entry.o main.o

run: kernel.elf
	$(QEMU) -machine virt -bios none -kernel kernel.elf -m 128M -smp 1 -nographic

clean:
	rm -f entry.o main.o kernel.elf

.PHONY: all run clean
