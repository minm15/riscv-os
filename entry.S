.section .text
.global _entry
_entry:
    la sp, stack0
    li t0, 4096
    add sp, sp, t0

    call start

spin:
    j spin
