/* 
 * Copyright (C) 2012 Texas Instruments Incorporated - http://www.ti.com/
 */

/* NML entry function
 * MUST be placed 10 bit aligned in memory
 */
-e nml_entry

MEMORY
{
    PMEM:   o = 0x9e00A400   l = 0x60
    PMEM1:  o = 0x9e00A460   l = 0x7a0
    DMEM:   o = 0x9fffd800   l = 0x1400
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

