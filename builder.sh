rm *.o
rm *.elf
rm *.img
/bin/arm-none-eabi-as  -c -o boot.o boot.S
/bin/arm-none-eabi-gcc -elf32 -c -nostdlib -o kernel.o kernel.c -lgcc
/bin/arm-none-eabi-ld -elf32 -T link.ld boot.o kernel.o -o kernel.elf -nostdlib
/bin/arm-none-eabi-objcopy kernel.elf -O binary kernel.img
qemu-system-arm -m 512M -machine raspi0 -serial stdio -kernel kernel.elf
