rm *.o
rm *.elf
rm *.img
/bin/aarch64-linux-gnu-as  -o boot.o boot.S
/bin/aarch64-linux-gnu-gcc-13 -c -nostdlib -o kernel.o kernel.c -ffreestanding
/bin/aarch64-linux-gnu-ld  -T link.ld boot.o kernel.o -o kernel.elf -nostdlib
/bin/aarch64-linux-gnu-objcopy kernel.elf -O binary kernel.img
qemu-system-arm64 -m 512 -machine raspi3ap -serial stdio -kernel kernel.elf

#qemu-system-arm64 -m 512 -machine raspi3ap -serial stdio -kernel kernel.elf
#qemu-system-aarch64 -machine virt -cpu cortex-a57 -kernel kernel.elf -nographic