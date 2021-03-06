/* 
 * Copyright (C) 2010 Texas Instruments Incorporated - http://www.ti.com/
 */

/* NML entry function
 * MUST be placed 10 bit aligned in memory
 */
-e nml_entry

MEMORY
{
    PMEM:   o = 0x9e00A400   l = 0x60
    PMEM1:  o = 0x9e00A460   l = 0x798
    DMEM:   o = 0x9fffb100   l = 0x4f00
}

SECTIONS
{
    .enter                 >       PMEM align 1024
    .text                  >       PMEM1 align 32
    .const                 >       PMEM1 align 8
    .far                   >       DMEM
    .fardata               >       DMEM
    /*
    .far: fill=0xF0        >       DMEM
    .fardata: fill=0xF0    >       DMEM
    */
}

