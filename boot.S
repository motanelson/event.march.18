.global _start
.extern kmain
_start:
    ldr x30, =__bss_start
    mov sp, x30
    bl kmain
    b .

