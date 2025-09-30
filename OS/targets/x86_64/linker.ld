ENTRY(start)

SECTIONS
{
    . = 1M;

    .boot:
    {
        KEEP(*(.mulyiboot_header))
    }

    .text:
    {
        *(.text)
    }
}