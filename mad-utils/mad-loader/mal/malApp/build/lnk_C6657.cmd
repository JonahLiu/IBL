/* 
 * Copyright (C) 2010 Texas Instruments Incorporated - http://www.ti.com/
 */

-c
--dynamic
-e _enter
-heap  0x40000
-stack 0x1000

MEMORY
{
    BLOB_ENTER: o = 0x9e001040  l = 0x0020
    PMEM0:  o = 0x9e001060   l = 0x7b2c
    URW0:   o = 0x9ffbb800   l = 0x42000
}

SECTIONS
{
	.enter    > 	  BLOB_ENTER
    .text     >       PMEM0
    .const    >       PMEM0
    .switch   >       PMEM0
    .fardata  >       PMEM0
    .stack    >       URW0
    .sysmem   >       URW0
    .far      >       URW0
}

