/* 
 * Copyright (C) 2010 Texas Instruments Incorporated - http://www.ti.com/
 */

MEMORY
{
    PMEM:   o = 0x800000   l = 0x5000
    DMEM:   o = 0x805000   l = 0x600
}

SECTIONS
{
    .text      >  PMEM
    .const     >  PMEM
    .far       >  DMEM
    .fardata   >  DMEM
    .stack     >  DMEM
}

