OUTPUT_ARCH(riscv)
ENTRY( _entry )

SECTIONS
{
    . = 0x80000000;
    
    . = ALIGN(16);
    .text : {
        *(.text)
    }
    
    . = ALIGN(16);
    .data : {
        *(.data)
    }
    
    . = ALIGN(16);
    .rodata : {
        *(.rodata)
    }
    
    . = ALIGN(16);
    .bss : {
        *(.bss)
    }
}
