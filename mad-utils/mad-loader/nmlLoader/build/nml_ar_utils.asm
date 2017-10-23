;******************************************************************************
;* TMS320C6x C/C++ Codegen                                        Unix v7.4.0 *
;* Date/Time created: Mon Nov 19 18:26:27 2012                                *
;******************************************************************************
	.compiler_opts --abi=eabi --c64p_l1d_workaround=off --endian=little --hll_source=on --long_precision_bits=32 --mem_model:code=far --mem_model:const=data --mem_model:data=far --object_format=elf --predefine_memory_model_macros --silicon_version=6600 --symdebug:dwarf --symdebug:dwarf_version=3 

;******************************************************************************
;* GLOBAL FILE PARAMETERS                                                     *
;*                                                                            *
;*   Architecture      : TMS320C66xx                                          *
;*   Optimization      : Disabled                                             *
;*   Optimizing for    : Compile time, Ease of Development                    *
;*                       Based on options: no -o, no -ms                      *
;*   Endian            : Little                                               *
;*   Interrupt Thrshld : Disabled                                             *
;*   Data Access Model : Far                                                  *
;*   Pipelining        : Disabled                                             *
;*   Memory Aliases    : Presume are aliases (pessimistic)                    *
;*   Debug Info        : DWARF Debug                                          *
;*                                                                            *
;******************************************************************************

	.asg	A15, FP
	.asg	B14, DP
	.asg	B15, SP
	.global	$bss


$C$DW$CU	.dwtag  DW_TAG_compile_unit
	.dwattr $C$DW$CU, DW_AT_name("../src/nml_ar_utils.c")
	.dwattr $C$DW$CU, DW_AT_producer("TI TMS320C6x C/C++ Codegen Unix v7.4.0 Copyright (c) 1996-2012 Texas Instruments Incorporated")
	.dwattr $C$DW$CU, DW_AT_TI_version(0x01)
	.dwattr $C$DW$CU, DW_AT_comp_dir("/home/gtbldadm/ti/mcsdk_2_01_02_06/tools/boot_loader/mad-utils/mad-loader/nmlLoader/build")
$C$DW$1	.dwtag  DW_TAG_variable, DW_AT_name("nml_boot_status")
	.dwattr $C$DW$1, DW_AT_TI_symbol_name("nml_boot_status")
	.dwattr $C$DW$1, DW_AT_type(*$C$DW$T$37)
	.dwattr $C$DW$1, DW_AT_declaration
	.dwattr $C$DW$1, DW_AT_external
	.dwattr $C$DW$1, DW_AT_decl_file("../src/nml_ar_utils.c")
	.dwattr $C$DW$1, DW_AT_decl_line(0x3d)
	.dwattr $C$DW$1, DW_AT_decl_column(0x15)
$C$DW$2	.dwtag  DW_TAG_variable, DW_AT_name("nml_mpax_seg_idx")
	.dwattr $C$DW$2, DW_AT_TI_symbol_name("nml_mpax_seg_idx")
	.dwattr $C$DW$2, DW_AT_type(*$C$DW$T$25)
	.dwattr $C$DW$2, DW_AT_declaration
	.dwattr $C$DW$2, DW_AT_external
	.dwattr $C$DW$2, DW_AT_decl_file("../src/nml_ar_utils.c")
	.dwattr $C$DW$2, DW_AT_decl_line(0x3e)
	.dwattr $C$DW$2, DW_AT_decl_column(0x16)
;	acpia6x -@/tmp/25336V0iNVa 
	.sect	".text"
	.clink

$C$DW$3	.dwtag  DW_TAG_subprogram, DW_AT_name("__logbase2")
	.dwattr $C$DW$3, DW_AT_low_pc(__logbase2)
	.dwattr $C$DW$3, DW_AT_high_pc(0x00)
	.dwattr $C$DW$3, DW_AT_TI_symbol_name("__logbase2")
	.dwattr $C$DW$3, DW_AT_type(*$C$DW$T$10)
	.dwattr $C$DW$3, DW_AT_TI_begin_file("../src/nml_ar_utils.c")
	.dwattr $C$DW$3, DW_AT_TI_begin_line(0x89)
	.dwattr $C$DW$3, DW_AT_TI_begin_column(0x13)
	.dwattr $C$DW$3, DW_AT_decl_file("../src/nml_ar_utils.c")
	.dwattr $C$DW$3, DW_AT_decl_line(0x89)
	.dwattr $C$DW$3, DW_AT_decl_column(0x13)
	.dwattr $C$DW$3, DW_AT_TI_max_frame_size(0x08)
	.dwpsn	file "../src/nml_ar_utils.c",line 138,column 1,is_stmt,address __logbase2,isa 0

	.dwfde $C$DW$CIE, __logbase2
$C$DW$4	.dwtag  DW_TAG_formal_parameter, DW_AT_name("num")
	.dwattr $C$DW$4, DW_AT_TI_symbol_name("num")
	.dwattr $C$DW$4, DW_AT_type(*$C$DW$T$10)
	.dwattr $C$DW$4, DW_AT_location[DW_OP_reg4]
;----------------------------------------------------------------------
; 137 | static inline int __logbase2(num)                                      
;----------------------------------------------------------------------

;******************************************************************************
;* FUNCTION NAME: __logbase2                                                  *
;*                                                                            *
;*   Regs Modified     : A4,B0,B4,SP                                          *
;*   Regs Used         : A4,B0,B3,B4,SP                                       *
;*   Local Frame Size  : 0 Args + 8 Auto + 0 Save = 8 byte                    *
;******************************************************************************
__logbase2:
;** --------------------------------------------------------------------------*
	.dwcfi	cfa_offset, 0
           SUB     .L2     SP,8,SP           ; |138| 
	.dwcfi	cfa_offset, 8
$C$DW$5	.dwtag  DW_TAG_variable, DW_AT_name("num")
	.dwattr $C$DW$5, DW_AT_TI_symbol_name("num")
	.dwattr $C$DW$5, DW_AT_type(*$C$DW$T$10)
	.dwattr $C$DW$5, DW_AT_location[DW_OP_breg31 4]
$C$DW$6	.dwtag  DW_TAG_variable, DW_AT_name("r")
	.dwattr $C$DW$6, DW_AT_TI_symbol_name("r")
	.dwattr $C$DW$6, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$6, DW_AT_location[DW_OP_breg31 8]
           STW     .D2T1   A4,*+SP(4)        ; |138| 
	.dwpsn	file "../src/nml_ar_utils.c",line 139,column 11,is_stmt,isa 0
;----------------------------------------------------------------------
; 139 | unsigned r = 0;                                                        
;----------------------------------------------------------------------
           ZERO    .L2     B4                ; |139| 
           STW     .D2T2   B4,*+SP(8)        ; |139| 
	.dwpsn	file "../src/nml_ar_utils.c",line 140,column 2,is_stmt,isa 0
;----------------------------------------------------------------------
; 140 | while (num >>= 1) {                                                    
;----------------------------------------------------------------------
           MV      .L2X    A4,B4
           SHR     .S2     B4,1,B0           ; |140| 
   [!B0]   BNOP    .S1     $C$L2,4           ; |140| 
           STW     .D2T2   B0,*+SP(4)        ; |140| 
           ; BRANCHCC OCCURS {$C$L2}         ; |140| 
;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Software pipelining disabled
;*----------------------------------------------------------------------------*
$C$L1:    
$C$DW$L$__logbase2$2$B:
	.dwpsn	file "../src/nml_ar_utils.c",line 141,column 5,is_stmt,isa 0
;----------------------------------------------------------------------
; 141 | r++;                                                                   
;----------------------------------------------------------------------
           LDW     .D2T2   *+SP(8),B4        ; |141| 
           NOP             4
           ADD     .L2     1,B4,B4           ; |141| 
           STW     .D2T2   B4,*+SP(8)        ; |141| 
	.dwpsn	file "../src/nml_ar_utils.c",line 142,column 2,is_stmt,isa 0
           MV      .L2     B0,B4
           SHR     .S2     B4,1,B0           ; |142| 
   [ B0]   BNOP    .S1     $C$L1,4           ; |142| 
           STW     .D2T2   B0,*+SP(4)        ; |142| 
           ; BRANCHCC OCCURS {$C$L1}         ; |142| 
$C$DW$L$__logbase2$2$E:
;** --------------------------------------------------------------------------*
$C$L2:    
	.dwpsn	file "../src/nml_ar_utils.c",line 143,column 2,is_stmt,isa 0
;----------------------------------------------------------------------
; 143 | return r;                                                              
;----------------------------------------------------------------------
           LDW     .D2T1   *+SP(8),A4        ; |143| 
           NOP             4
	.dwpsn	file "../src/nml_ar_utils.c",line 144,column 1,is_stmt,isa 0
           ADD     .L2     8,SP,SP           ; |144| 
	.dwcfi	cfa_offset, 0
	.dwcfi	cfa_offset, 0
$C$DW$7	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$7, DW_AT_low_pc(0x00)
	.dwattr $C$DW$7, DW_AT_TI_return
           RETNOP  .S2     B3,5              ; |144| 
           ; BRANCH OCCURS {B3}              ; |144| 

$C$DW$8	.dwtag  DW_TAG_TI_loop
	.dwattr $C$DW$8, DW_AT_name("/home/gtbldadm/ti/mcsdk_2_01_02_06/tools/boot_loader/mad-utils/mad-loader/nmlLoader/build/nml_ar_utils.asm:$C$L1:1:1353367587")
	.dwattr $C$DW$8, DW_AT_TI_begin_file("../src/nml_ar_utils.c")
	.dwattr $C$DW$8, DW_AT_TI_begin_line(0x8c)
	.dwattr $C$DW$8, DW_AT_TI_end_line(0x8e)
$C$DW$9	.dwtag  DW_TAG_TI_loop_range
	.dwattr $C$DW$9, DW_AT_low_pc($C$DW$L$__logbase2$2$B)
	.dwattr $C$DW$9, DW_AT_high_pc($C$DW$L$__logbase2$2$E)
	.dwendtag $C$DW$8

	.dwattr $C$DW$3, DW_AT_TI_end_file("../src/nml_ar_utils.c")
	.dwattr $C$DW$3, DW_AT_TI_end_line(0x90)
	.dwattr $C$DW$3, DW_AT_TI_end_column(0x01)
	.dwendentry
	.dwendtag $C$DW$3

	.sect	".text"
	.clink
	.global	nml_wbinv_cache_block

$C$DW$10	.dwtag  DW_TAG_subprogram, DW_AT_name("nml_wbinv_cache_block")
	.dwattr $C$DW$10, DW_AT_low_pc(nml_wbinv_cache_block)
	.dwattr $C$DW$10, DW_AT_high_pc(0x00)
	.dwattr $C$DW$10, DW_AT_TI_symbol_name("nml_wbinv_cache_block")
	.dwattr $C$DW$10, DW_AT_external
	.dwattr $C$DW$10, DW_AT_TI_begin_file("../src/nml_ar_utils.c")
	.dwattr $C$DW$10, DW_AT_TI_begin_line(0x45)
	.dwattr $C$DW$10, DW_AT_TI_begin_column(0x06)
	.dwattr $C$DW$10, DW_AT_decl_file("../src/nml_ar_utils.c")
	.dwattr $C$DW$10, DW_AT_decl_line(0x45)
	.dwattr $C$DW$10, DW_AT_decl_column(0x06)
	.dwattr $C$DW$10, DW_AT_TI_max_frame_size(0x08)
	.dwpsn	file "../src/nml_ar_utils.c",line 70,column 1,is_stmt,address nml_wbinv_cache_block,isa 0

	.dwfde $C$DW$CIE, nml_wbinv_cache_block
$C$DW$11	.dwtag  DW_TAG_formal_parameter, DW_AT_name("base_addr")
	.dwattr $C$DW$11, DW_AT_TI_symbol_name("base_addr")
	.dwattr $C$DW$11, DW_AT_type(*$C$DW$T$3)
	.dwattr $C$DW$11, DW_AT_location[DW_OP_reg4]
$C$DW$12	.dwtag  DW_TAG_formal_parameter, DW_AT_name("size")
	.dwattr $C$DW$12, DW_AT_TI_symbol_name("size")
	.dwattr $C$DW$12, DW_AT_type(*$C$DW$T$10)
	.dwattr $C$DW$12, DW_AT_location[DW_OP_reg20]
;----------------------------------------------------------------------
;  69 | void nml_wbinv_cache_block(void* base_addr, int size)                  
;----------------------------------------------------------------------

;******************************************************************************
;* FUNCTION NAME: nml_wbinv_cache_block                                       *
;*                                                                            *
;*   Regs Modified     : A3,A4,B4,B5,SP                                       *
;*   Regs Used         : A3,A4,B3,B4,B5,SP                                    *
;*   Local Frame Size  : 0 Args + 8 Auto + 0 Save = 8 byte                    *
;******************************************************************************
nml_wbinv_cache_block:
;** --------------------------------------------------------------------------*
	.dwcfi	cfa_offset, 0
           SUB     .L2     SP,8,SP           ; |70| 
	.dwcfi	cfa_offset, 8
$C$DW$13	.dwtag  DW_TAG_variable, DW_AT_name("base_addr")
	.dwattr $C$DW$13, DW_AT_TI_symbol_name("base_addr")
	.dwattr $C$DW$13, DW_AT_type(*$C$DW$T$3)
	.dwattr $C$DW$13, DW_AT_location[DW_OP_breg31 4]
$C$DW$14	.dwtag  DW_TAG_variable, DW_AT_name("size")
	.dwattr $C$DW$14, DW_AT_TI_symbol_name("size")
	.dwattr $C$DW$14, DW_AT_type(*$C$DW$T$10)
	.dwattr $C$DW$14, DW_AT_location[DW_OP_breg31 8]
           STW     .D2T2   B4,*+SP(8)        ; |70| 
           STW     .D2T1   A4,*+SP(4)        ; |70| 
	.dwpsn	file "../src/nml_ar_utils.c",line 71,column 5,is_stmt,isa 0
;----------------------------------------------------------------------
;  71 | asm (" DINT");                                                         
;----------------------------------------------------------------------
 DINT
	.dwpsn	file "../src/nml_ar_utils.c",line 74,column 5,is_stmt,isa 0
;----------------------------------------------------------------------
;  74 | *(unsigned int *)(L1DWIBAR_REG) = (unsigned int)base_addr;             
;----------------------------------------------------------------------
           MVKL    .S2     0x1844030,B4

           MVKH    .S2     0x1844030,B4
||         MV      .L1     A4,A3

           STW     .D2T1   A3,*B4            ; |74| 
	.dwpsn	file "../src/nml_ar_utils.c",line 75,column 5,is_stmt,isa 0
;----------------------------------------------------------------------
;  75 | *(unsigned int *)(L1DWIWC_REG) = size;                                 
;  76 | #if ((DEVICE==6670) || (DEVICE==6678) || (DEVICE==6657))               
;----------------------------------------------------------------------
           LDW     .D2T1   *+SP(8),A3        ; |75| 
           ADD     .L1X    4,B4,A4
           NOP             3
           STW     .D1T1   A3,*A4            ; |75| 
	.dwpsn	file "../src/nml_ar_utils.c",line 77,column 5,is_stmt,isa 0
;----------------------------------------------------------------------
;  77 | asm (" MFENCE");                                                       
;  78 | #elif (DEVICE==6472)                                                   
;  79 | while (*(unsigned int *)(L1DWIWC_REG) != 0);                           
;  80 | #endif                                                                 
;----------------------------------------------------------------------
 MFENCE
	.dwpsn	file "../src/nml_ar_utils.c",line 83,column 5,is_stmt,isa 0
;----------------------------------------------------------------------
;  83 | *(unsigned int *)(L2WIBAR_REG) = (unsigned int)base_addr;              
;----------------------------------------------------------------------
           LDW     .D2T1   *+SP(4),A3        ; |83| 
           MVK     .S1     32,A4
           SUB     .L1X    B4,A4,A4
           NOP             2
           STW     .D1T1   A3,*A4            ; |83| 
	.dwpsn	file "../src/nml_ar_utils.c",line 84,column 5,is_stmt,isa 0
;----------------------------------------------------------------------
;  84 | *(unsigned int *)(L2WIWC_REG) = size;                                  
;  85 | #if ((DEVICE==6670) || (DEVICE==6678) || (DEVICE==6657))               
;----------------------------------------------------------------------
           LDW     .D2T2   *+SP(8),B4        ; |84| 
           ADD     .L2X    4,A4,B5
           NOP             3
           STW     .D2T2   B4,*B5            ; |84| 
	.dwpsn	file "../src/nml_ar_utils.c",line 86,column 5,is_stmt,isa 0
;----------------------------------------------------------------------
;  86 | asm (" MFENCE");                                                       
;  87 | #elif (DEVICE==6472)                                                   
;  88 | while (*(unsigned int *)(L2WIWC_REG) != 0);                            
;  89 | #endif                                                                 
;----------------------------------------------------------------------
 MFENCE
	.dwpsn	file "../src/nml_ar_utils.c",line 91,column 5,is_stmt,isa 0
;----------------------------------------------------------------------
;  91 | asm (" RINT");                                                         
;----------------------------------------------------------------------
 RINT
	.dwpsn	file "../src/nml_ar_utils.c",line 92,column 1,is_stmt,isa 0
           ADD     .L2     8,SP,SP           ; |92| 
	.dwcfi	cfa_offset, 0
	.dwcfi	cfa_offset, 0
$C$DW$15	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$15, DW_AT_low_pc(0x00)
	.dwattr $C$DW$15, DW_AT_TI_return
           RETNOP  .S2     B3,5              ; |92| 
           ; BRANCH OCCURS {B3}              ; |92| 
	.dwattr $C$DW$10, DW_AT_TI_end_file("../src/nml_ar_utils.c")
	.dwattr $C$DW$10, DW_AT_TI_end_line(0x5c)
	.dwattr $C$DW$10, DW_AT_TI_end_column(0x01)
	.dwendentry
	.dwendtag $C$DW$10

	.sect	".text"
	.clink
	.global	nml_mem_cpy

$C$DW$16	.dwtag  DW_TAG_subprogram, DW_AT_name("nml_mem_cpy")
	.dwattr $C$DW$16, DW_AT_low_pc(nml_mem_cpy)
	.dwattr $C$DW$16, DW_AT_high_pc(0x00)
	.dwattr $C$DW$16, DW_AT_TI_symbol_name("nml_mem_cpy")
	.dwattr $C$DW$16, DW_AT_external
	.dwattr $C$DW$16, DW_AT_type(*$C$DW$T$10)
	.dwattr $C$DW$16, DW_AT_TI_begin_file("../src/nml_ar_utils.c")
	.dwattr $C$DW$16, DW_AT_TI_begin_line(0x62)
	.dwattr $C$DW$16, DW_AT_TI_begin_column(0x05)
	.dwattr $C$DW$16, DW_AT_decl_file("../src/nml_ar_utils.c")
	.dwattr $C$DW$16, DW_AT_decl_line(0x62)
	.dwattr $C$DW$16, DW_AT_decl_column(0x05)
	.dwattr $C$DW$16, DW_AT_TI_max_frame_size(0x20)
	.dwpsn	file "../src/nml_ar_utils.c",line 99,column 1,is_stmt,address nml_mem_cpy,isa 0

	.dwfde $C$DW$CIE, nml_mem_cpy
$C$DW$17	.dwtag  DW_TAG_formal_parameter, DW_AT_name("dest")
	.dwattr $C$DW$17, DW_AT_TI_symbol_name("dest")
	.dwattr $C$DW$17, DW_AT_type(*$C$DW$T$3)
	.dwattr $C$DW$17, DW_AT_location[DW_OP_reg4]
$C$DW$18	.dwtag  DW_TAG_formal_parameter, DW_AT_name("src")
	.dwattr $C$DW$18, DW_AT_TI_symbol_name("src")
	.dwattr $C$DW$18, DW_AT_type(*$C$DW$T$3)
	.dwattr $C$DW$18, DW_AT_location[DW_OP_reg20]
$C$DW$19	.dwtag  DW_TAG_formal_parameter, DW_AT_name("num_bytes")
	.dwattr $C$DW$19, DW_AT_TI_symbol_name("num_bytes")
	.dwattr $C$DW$19, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$19, DW_AT_location[DW_OP_reg6]
;----------------------------------------------------------------------
;  98 | int nml_mem_cpy (void *dest, void *src, unsigned int num_bytes)        
;----------------------------------------------------------------------

;******************************************************************************
;* FUNCTION NAME: nml_mem_cpy                                                 *
;*                                                                            *
;*   Regs Modified     : A3,A4,B0,B3,B4,B5,B6,B7,SP                           *
;*   Regs Used         : A3,A4,A6,B0,B3,B4,B5,B6,B7,SP                        *
;*   Local Frame Size  : 0 Args + 24 Auto + 4 Save = 28 byte                  *
;******************************************************************************
nml_mem_cpy:
;** --------------------------------------------------------------------------*
	.dwcfi	cfa_offset, 0
           STW     .D2T2   B3,*SP--(32)      ; |99| 
	.dwcfi	cfa_offset, 32
	.dwcfi	save_reg_to_mem, 19, 0
$C$DW$20	.dwtag  DW_TAG_variable, DW_AT_name("dest")
	.dwattr $C$DW$20, DW_AT_TI_symbol_name("dest")
	.dwattr $C$DW$20, DW_AT_type(*$C$DW$T$3)
	.dwattr $C$DW$20, DW_AT_location[DW_OP_breg31 4]
$C$DW$21	.dwtag  DW_TAG_variable, DW_AT_name("src")
	.dwattr $C$DW$21, DW_AT_TI_symbol_name("src")
	.dwattr $C$DW$21, DW_AT_type(*$C$DW$T$3)
	.dwattr $C$DW$21, DW_AT_location[DW_OP_breg31 8]
$C$DW$22	.dwtag  DW_TAG_variable, DW_AT_name("num_bytes")
	.dwattr $C$DW$22, DW_AT_TI_symbol_name("num_bytes")
	.dwattr $C$DW$22, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$22, DW_AT_location[DW_OP_breg31 12]
$C$DW$23	.dwtag  DW_TAG_variable, DW_AT_name("i")
	.dwattr $C$DW$23, DW_AT_TI_symbol_name("i")
	.dwattr $C$DW$23, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$23, DW_AT_location[DW_OP_breg31 16]
$C$DW$24	.dwtag  DW_TAG_variable, DW_AT_name("d")
	.dwattr $C$DW$24, DW_AT_TI_symbol_name("d")
	.dwattr $C$DW$24, DW_AT_type(*$C$DW$T$26)
	.dwattr $C$DW$24, DW_AT_location[DW_OP_breg31 20]
$C$DW$25	.dwtag  DW_TAG_variable, DW_AT_name("s")
	.dwattr $C$DW$25, DW_AT_TI_symbol_name("s")
	.dwattr $C$DW$25, DW_AT_type(*$C$DW$T$26)
	.dwattr $C$DW$25, DW_AT_location[DW_OP_breg31 24]
;----------------------------------------------------------------------
; 100 | unsigned int   i;                                                      
; 101 | unsigned char *d, *s;                                                  
;----------------------------------------------------------------------
           STW     .D2T1   A6,*+SP(12)       ; |99| 
           STW     .D2T2   B4,*+SP(8)        ; |99| 
           STW     .D2T1   A4,*+SP(4)        ; |99| 
	.dwpsn	file "../src/nml_ar_utils.c",line 103,column 5,is_stmt,isa 0
;----------------------------------------------------------------------
; 103 | d = (unsigned char *)dest;                                             
;----------------------------------------------------------------------
           MV      .L2X    A4,B4
           STW     .D2T2   B4,*+SP(20)       ; |103| 
	.dwpsn	file "../src/nml_ar_utils.c",line 104,column 5,is_stmt,isa 0
;----------------------------------------------------------------------
; 104 | s = (unsigned char *)src;                                              
;----------------------------------------------------------------------
           LDW     .D2T2   *+SP(8),B4        ; |104| 
           NOP             4
           STW     .D2T2   B4,*+SP(24)       ; |104| 
	.dwpsn	file "../src/nml_ar_utils.c",line 106,column 10,is_stmt,isa 0
;----------------------------------------------------------------------
; 106 | for (i = 0; i < num_bytes; i++)                                        
;----------------------------------------------------------------------
           ZERO    .L2     B4                ; |106| 
           STW     .D2T2   B4,*+SP(16)       ; |106| 
	.dwpsn	file "../src/nml_ar_utils.c",line 106,column 17,is_stmt,isa 0
           LDW     .D2T2   *+SP(16),B5       ; |106| 
           MV      .L2X    A6,B4
           NOP             3
           CMPLTU  .L2X    B5,A6,B0          ; |106| 
   [!B0]   BNOP    .S1     $C$L4,5           ; |106| 
           ; BRANCHCC OCCURS {$C$L4}         ; |106| 
;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Software pipelining disabled
;*----------------------------------------------------------------------------*
$C$L3:    
$C$DW$L$nml_mem_cpy$2$B:
	.dwpsn	file "../src/nml_ar_utils.c",line 107,column 9,is_stmt,isa 0
;----------------------------------------------------------------------
; 107 | d[i] = s[i];                                                           
;----------------------------------------------------------------------
           LDW     .D2T2   *+SP(16),B4       ; |107| 
           LDW     .D2T2   *+SP(24),B5       ; |107| 
           LDW     .D2T2   *+SP(20),B7       ; |107| 
           NOP             3

           MV      .L2     B4,B6             ; |107| 
||         LDBU    .D2T2   *+B5[B4],B4       ; |107| 

           NOP             4
           STB     .D2T2   B4,*+B7[B6]       ; |107| 
	.dwpsn	file "../src/nml_ar_utils.c",line 106,column 32,is_stmt,isa 0
           LDW     .D2T2   *+SP(16),B4       ; |106| 
           NOP             4
           ADD     .L2     1,B4,B4           ; |106| 
           STW     .D2T2   B4,*+SP(16)       ; |106| 
	.dwpsn	file "../src/nml_ar_utils.c",line 106,column 17,is_stmt,isa 0
           LDW     .D2T2   *+SP(12),B4       ; |106| 
           LDW     .D2T2   *+SP(16),B5       ; |106| 
           NOP             4
           CMPLTU  .L2     B5,B4,B0          ; |106| 
   [ B0]   BNOP    .S1     $C$L3,5           ; |106| 
           ; BRANCHCC OCCURS {$C$L3}         ; |106| 
$C$DW$L$nml_mem_cpy$2$E:
;** --------------------------------------------------------------------------*
$C$L4:    
	.dwpsn	file "../src/nml_ar_utils.c",line 110,column 5,is_stmt,isa 0
;----------------------------------------------------------------------
; 110 | nml_wbinv_cache_block(dest, num_bytes/4);                              
;----------------------------------------------------------------------
           MVKL    .S2     nml_wbinv_cache_block,B5
           MVKH    .S2     nml_wbinv_cache_block,B5
$C$DW$26	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$26, DW_AT_low_pc(0x00)
	.dwattr $C$DW$26, DW_AT_name("nml_wbinv_cache_block")
	.dwattr $C$DW$26, DW_AT_TI_call
           CALL    .S2     B5                ; |110| 
           LDW     .D2T1   *+SP(4),A4        ; |110| 
           SHRU    .S2     B4,2,B4           ; |110| 
           ADDKPC  .S2     $C$RL0,B3,2       ; |110| 
$C$RL0:    ; CALL OCCURS {nml_wbinv_cache_block} {0}  ; |110| 
	.dwpsn	file "../src/nml_ar_utils.c",line 111,column 5,is_stmt,isa 0
;----------------------------------------------------------------------
; 111 | return 0;                                                              
;----------------------------------------------------------------------
           ZERO    .L1     A4                ; |111| 
	.dwpsn	file "../src/nml_ar_utils.c",line 112,column 1,is_stmt,isa 0
           LDW     .D2T2   *++SP(32),B3      ; |112| 
           NOP             4
	.dwcfi	cfa_offset, 0
	.dwcfi	restore_reg, 19
	.dwcfi	cfa_offset, 0
$C$DW$27	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$27, DW_AT_low_pc(0x00)
	.dwattr $C$DW$27, DW_AT_TI_return
           RETNOP  .S2     B3,5              ; |112| 
           ; BRANCH OCCURS {B3}              ; |112| 

$C$DW$28	.dwtag  DW_TAG_TI_loop
	.dwattr $C$DW$28, DW_AT_name("/home/gtbldadm/ti/mcsdk_2_01_02_06/tools/boot_loader/mad-utils/mad-loader/nmlLoader/build/nml_ar_utils.asm:$C$L3:1:1353367587")
	.dwattr $C$DW$28, DW_AT_TI_begin_file("../src/nml_ar_utils.c")
	.dwattr $C$DW$28, DW_AT_TI_begin_line(0x6a)
	.dwattr $C$DW$28, DW_AT_TI_end_line(0x6b)
$C$DW$29	.dwtag  DW_TAG_TI_loop_range
	.dwattr $C$DW$29, DW_AT_low_pc($C$DW$L$nml_mem_cpy$2$B)
	.dwattr $C$DW$29, DW_AT_high_pc($C$DW$L$nml_mem_cpy$2$E)
	.dwendtag $C$DW$28

	.dwattr $C$DW$16, DW_AT_TI_end_file("../src/nml_ar_utils.c")
	.dwattr $C$DW$16, DW_AT_TI_end_line(0x70)
	.dwattr $C$DW$16, DW_AT_TI_end_column(0x01)
	.dwendentry
	.dwendtag $C$DW$16

	.sect	".text"
	.clink
	.global	nml_mem_set

$C$DW$30	.dwtag  DW_TAG_subprogram, DW_AT_name("nml_mem_set")
	.dwattr $C$DW$30, DW_AT_low_pc(nml_mem_set)
	.dwattr $C$DW$30, DW_AT_high_pc(0x00)
	.dwattr $C$DW$30, DW_AT_TI_symbol_name("nml_mem_set")
	.dwattr $C$DW$30, DW_AT_external
	.dwattr $C$DW$30, DW_AT_type(*$C$DW$T$10)
	.dwattr $C$DW$30, DW_AT_TI_begin_file("../src/nml_ar_utils.c")
	.dwattr $C$DW$30, DW_AT_TI_begin_line(0x76)
	.dwattr $C$DW$30, DW_AT_TI_begin_column(0x05)
	.dwattr $C$DW$30, DW_AT_decl_file("../src/nml_ar_utils.c")
	.dwattr $C$DW$30, DW_AT_decl_line(0x76)
	.dwattr $C$DW$30, DW_AT_decl_column(0x05)
	.dwattr $C$DW$30, DW_AT_TI_max_frame_size(0x20)
	.dwpsn	file "../src/nml_ar_utils.c",line 119,column 1,is_stmt,address nml_mem_set,isa 0

	.dwfde $C$DW$CIE, nml_mem_set
$C$DW$31	.dwtag  DW_TAG_formal_parameter, DW_AT_name("dest")
	.dwattr $C$DW$31, DW_AT_TI_symbol_name("dest")
	.dwattr $C$DW$31, DW_AT_type(*$C$DW$T$3)
	.dwattr $C$DW$31, DW_AT_location[DW_OP_reg4]
$C$DW$32	.dwtag  DW_TAG_formal_parameter, DW_AT_name("byte")
	.dwattr $C$DW$32, DW_AT_TI_symbol_name("byte")
	.dwattr $C$DW$32, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$32, DW_AT_location[DW_OP_reg20]
$C$DW$33	.dwtag  DW_TAG_formal_parameter, DW_AT_name("num_bytes")
	.dwattr $C$DW$33, DW_AT_TI_symbol_name("num_bytes")
	.dwattr $C$DW$33, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$33, DW_AT_location[DW_OP_reg6]
;----------------------------------------------------------------------
; 118 | int nml_mem_set (void *dest, unsigned int byte, unsigned int num_bytes)
;----------------------------------------------------------------------

;******************************************************************************
;* FUNCTION NAME: nml_mem_set                                                 *
;*                                                                            *
;*   Regs Modified     : A3,A4,B0,B3,B4,B5,B6,SP                              *
;*   Regs Used         : A3,A4,A6,B0,B3,B4,B5,B6,SP                           *
;*   Local Frame Size  : 0 Args + 24 Auto + 4 Save = 28 byte                  *
;******************************************************************************
nml_mem_set:
;** --------------------------------------------------------------------------*
	.dwcfi	cfa_offset, 0
           STW     .D2T2   B3,*SP--(32)      ; |119| 
	.dwcfi	cfa_offset, 32
	.dwcfi	save_reg_to_mem, 19, 0
$C$DW$34	.dwtag  DW_TAG_variable, DW_AT_name("dest")
	.dwattr $C$DW$34, DW_AT_TI_symbol_name("dest")
	.dwattr $C$DW$34, DW_AT_type(*$C$DW$T$3)
	.dwattr $C$DW$34, DW_AT_location[DW_OP_breg31 4]
$C$DW$35	.dwtag  DW_TAG_variable, DW_AT_name("byte")
	.dwattr $C$DW$35, DW_AT_TI_symbol_name("byte")
	.dwattr $C$DW$35, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$35, DW_AT_location[DW_OP_breg31 8]
$C$DW$36	.dwtag  DW_TAG_variable, DW_AT_name("num_bytes")
	.dwattr $C$DW$36, DW_AT_TI_symbol_name("num_bytes")
	.dwattr $C$DW$36, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$36, DW_AT_location[DW_OP_breg31 12]
$C$DW$37	.dwtag  DW_TAG_variable, DW_AT_name("i")
	.dwattr $C$DW$37, DW_AT_TI_symbol_name("i")
	.dwattr $C$DW$37, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$37, DW_AT_location[DW_OP_breg31 16]
$C$DW$38	.dwtag  DW_TAG_variable, DW_AT_name("d")
	.dwattr $C$DW$38, DW_AT_TI_symbol_name("d")
	.dwattr $C$DW$38, DW_AT_type(*$C$DW$T$26)
	.dwattr $C$DW$38, DW_AT_location[DW_OP_breg31 20]
$C$DW$39	.dwtag  DW_TAG_variable, DW_AT_name("b")
	.dwattr $C$DW$39, DW_AT_TI_symbol_name("b")
	.dwattr $C$DW$39, DW_AT_type(*$C$DW$T$6)
	.dwattr $C$DW$39, DW_AT_location[DW_OP_breg31 24]
;----------------------------------------------------------------------
; 120 | unsigned int   i;                                                      
; 121 | unsigned char *d, b;                                                   
;----------------------------------------------------------------------
           STW     .D2T1   A6,*+SP(12)       ; |119| 
           STW     .D2T2   B4,*+SP(8)        ; |119| 
           STW     .D2T1   A4,*+SP(4)        ; |119| 
	.dwpsn	file "../src/nml_ar_utils.c",line 123,column 5,is_stmt,isa 0
;----------------------------------------------------------------------
; 123 | d = (unsigned char *)dest;                                             
;----------------------------------------------------------------------
           MV      .L2X    A4,B4
           STW     .D2T2   B4,*+SP(20)       ; |123| 
	.dwpsn	file "../src/nml_ar_utils.c",line 124,column 2,is_stmt,isa 0
;----------------------------------------------------------------------
; 124 | b = (unsigned char)byte;                                               
;----------------------------------------------------------------------
           LDBU    .D2T2   *+SP(8),B4        ; |124| 
           NOP             4
           STB     .D2T2   B4,*+SP(24)       ; |124| 
	.dwpsn	file "../src/nml_ar_utils.c",line 126,column 10,is_stmt,isa 0
;----------------------------------------------------------------------
; 126 | for (i = 0; i < num_bytes; i++)                                        
;----------------------------------------------------------------------
           ZERO    .L2     B4                ; |126| 
           STW     .D2T2   B4,*+SP(16)       ; |126| 
	.dwpsn	file "../src/nml_ar_utils.c",line 126,column 17,is_stmt,isa 0
           LDW     .D2T2   *+SP(16),B5       ; |126| 
           MV      .L2X    A6,B4
           NOP             3
           CMPLTU  .L2X    B5,A6,B0          ; |126| 
   [!B0]   BNOP    .S1     $C$L6,5           ; |126| 
           ; BRANCHCC OCCURS {$C$L6}         ; |126| 
;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Software pipelining disabled
;*----------------------------------------------------------------------------*
$C$L5:    
$C$DW$L$nml_mem_set$2$B:
	.dwpsn	file "../src/nml_ar_utils.c",line 127,column 9,is_stmt,isa 0
;----------------------------------------------------------------------
; 127 | d[i] = b;                                                              
;----------------------------------------------------------------------
           LDW     .D2T2   *+SP(16),B5       ; |127| 
           LDW     .D2T2   *+SP(20),B6       ; |127| 
           LDBU    .D2T2   *+SP(24),B4       ; |127| 
           NOP             4
           STB     .D2T2   B4,*+B6[B5]       ; |127| 
	.dwpsn	file "../src/nml_ar_utils.c",line 126,column 32,is_stmt,isa 0
           LDW     .D2T2   *+SP(16),B4       ; |126| 
           NOP             4
           ADD     .L2     1,B4,B4           ; |126| 
           STW     .D2T2   B4,*+SP(16)       ; |126| 
	.dwpsn	file "../src/nml_ar_utils.c",line 126,column 17,is_stmt,isa 0
           LDW     .D2T2   *+SP(12),B4       ; |126| 
           LDW     .D2T2   *+SP(16),B5       ; |126| 
           NOP             4
           CMPLTU  .L2     B5,B4,B0          ; |126| 
   [ B0]   BNOP    .S1     $C$L5,5           ; |126| 
           ; BRANCHCC OCCURS {$C$L5}         ; |126| 
$C$DW$L$nml_mem_set$2$E:
;** --------------------------------------------------------------------------*
$C$L6:    
	.dwpsn	file "../src/nml_ar_utils.c",line 130,column 5,is_stmt,isa 0
;----------------------------------------------------------------------
; 130 | nml_wbinv_cache_block(dest, num_bytes/4);                              
;----------------------------------------------------------------------
           MVKL    .S2     nml_wbinv_cache_block,B5
           MVKH    .S2     nml_wbinv_cache_block,B5
$C$DW$40	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$40, DW_AT_low_pc(0x00)
	.dwattr $C$DW$40, DW_AT_name("nml_wbinv_cache_block")
	.dwattr $C$DW$40, DW_AT_TI_call
           CALL    .S2     B5                ; |130| 
           LDW     .D2T1   *+SP(4),A4        ; |130| 
           SHRU    .S2     B4,2,B4           ; |130| 
           ADDKPC  .S2     $C$RL1,B3,2       ; |130| 
$C$RL1:    ; CALL OCCURS {nml_wbinv_cache_block} {0}  ; |130| 
	.dwpsn	file "../src/nml_ar_utils.c",line 131,column 5,is_stmt,isa 0
;----------------------------------------------------------------------
; 131 | L1D_GLOBAL_WB;                                                         
;----------------------------------------------------------------------
           MVKL    .S2     0x1845040,B5

           MVKH    .S2     0x1845040,B5
||         MVK     .L2     1,B4              ; |131| 

           STW     .D2T2   B4,*B5            ; |131| 
	.dwpsn	file "../src/nml_ar_utils.c",line 132,column 5,is_stmt,isa 0
;----------------------------------------------------------------------
; 132 | L2_GLOBAL_WB;                                                          
;----------------------------------------------------------------------
           MV      .L1X    B4,A3
           MV      .L1X    B5,A4
           STW     .D1T1   A3,*A4            ; |132| 
	.dwpsn	file "../src/nml_ar_utils.c",line 133,column 5,is_stmt,isa 0
;----------------------------------------------------------------------
; 133 | return 0;                                                              
;----------------------------------------------------------------------
           ZERO    .L1     A4                ; |133| 
	.dwpsn	file "../src/nml_ar_utils.c",line 134,column 1,is_stmt,isa 0
           LDW     .D2T2   *++SP(32),B3      ; |134| 
           NOP             4
	.dwcfi	cfa_offset, 0
	.dwcfi	restore_reg, 19
	.dwcfi	cfa_offset, 0
$C$DW$41	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$41, DW_AT_low_pc(0x00)
	.dwattr $C$DW$41, DW_AT_TI_return
           RETNOP  .S2     B3,5              ; |134| 
           ; BRANCH OCCURS {B3}              ; |134| 

$C$DW$42	.dwtag  DW_TAG_TI_loop
	.dwattr $C$DW$42, DW_AT_name("/home/gtbldadm/ti/mcsdk_2_01_02_06/tools/boot_loader/mad-utils/mad-loader/nmlLoader/build/nml_ar_utils.asm:$C$L5:1:1353367587")
	.dwattr $C$DW$42, DW_AT_TI_begin_file("../src/nml_ar_utils.c")
	.dwattr $C$DW$42, DW_AT_TI_begin_line(0x7e)
	.dwattr $C$DW$42, DW_AT_TI_end_line(0x7f)
$C$DW$43	.dwtag  DW_TAG_TI_loop_range
	.dwattr $C$DW$43, DW_AT_low_pc($C$DW$L$nml_mem_set$2$B)
	.dwattr $C$DW$43, DW_AT_high_pc($C$DW$L$nml_mem_set$2$E)
	.dwendtag $C$DW$42

	.dwattr $C$DW$30, DW_AT_TI_end_file("../src/nml_ar_utils.c")
	.dwattr $C$DW$30, DW_AT_TI_end_line(0x86)
	.dwattr $C$DW$30, DW_AT_TI_end_column(0x01)
	.dwendentry
	.dwendtag $C$DW$30

	.sect	".text"
	.clink
	.global	nml_mem_map_set

$C$DW$44	.dwtag  DW_TAG_subprogram, DW_AT_name("nml_mem_map_set")
	.dwattr $C$DW$44, DW_AT_low_pc(nml_mem_map_set)
	.dwattr $C$DW$44, DW_AT_high_pc(0x00)
	.dwattr $C$DW$44, DW_AT_TI_symbol_name("nml_mem_map_set")
	.dwattr $C$DW$44, DW_AT_external
	.dwattr $C$DW$44, DW_AT_type(*$C$DW$T$10)
	.dwattr $C$DW$44, DW_AT_TI_begin_file("../src/nml_ar_utils.c")
	.dwattr $C$DW$44, DW_AT_TI_begin_line(0x9a)
	.dwattr $C$DW$44, DW_AT_TI_begin_column(0x05)
	.dwattr $C$DW$44, DW_AT_decl_file("../src/nml_ar_utils.c")
	.dwattr $C$DW$44, DW_AT_decl_line(0x9a)
	.dwattr $C$DW$44, DW_AT_decl_column(0x05)
	.dwattr $C$DW$44, DW_AT_TI_max_frame_size(0x38)
	.dwpsn	file "../src/nml_ar_utils.c",line 156,column 1,is_stmt,address nml_mem_map_set,isa 0

	.dwfde $C$DW$CIE, nml_mem_map_set
$C$DW$45	.dwtag  DW_TAG_formal_parameter, DW_AT_name("paddr")
	.dwattr $C$DW$45, DW_AT_TI_symbol_name("paddr")
	.dwattr $C$DW$45, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$45, DW_AT_location[DW_OP_reg4]
$C$DW$46	.dwtag  DW_TAG_formal_parameter, DW_AT_name("vaddr")
	.dwattr $C$DW$46, DW_AT_TI_symbol_name("vaddr")
	.dwattr $C$DW$46, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$46, DW_AT_location[DW_OP_reg20]
$C$DW$47	.dwtag  DW_TAG_formal_parameter, DW_AT_name("size")
	.dwattr $C$DW$47, DW_AT_TI_symbol_name("size")
	.dwattr $C$DW$47, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$47, DW_AT_location[DW_OP_reg6]
$C$DW$48	.dwtag  DW_TAG_formal_parameter, DW_AT_name("perm")
	.dwattr $C$DW$48, DW_AT_TI_symbol_name("perm")
	.dwattr $C$DW$48, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$48, DW_AT_location[DW_OP_reg22]
;----------------------------------------------------------------------
; 154 | int nml_mem_map_set (unsigned int paddr, unsigned int vaddr, unsigned i
;     | nt size,                                                               
; 155 | unsigned int perm)                                                     
;----------------------------------------------------------------------

;******************************************************************************
;* FUNCTION NAME: nml_mem_map_set                                             *
;*                                                                            *
;*   Regs Modified     : A0,A3,A4,B0,B3,B4,B5,B6,B7,SP                        *
;*   Regs Used         : A0,A3,A4,A6,B0,B3,B4,B5,B6,B7,SP                     *
;*   Local Frame Size  : 0 Args + 52 Auto + 4 Save = 56 byte                  *
;******************************************************************************
nml_mem_map_set:
;** --------------------------------------------------------------------------*
	.dwcfi	cfa_offset, 0
           STW     .D2T2   B3,*SP--(56)      ; |156| 
	.dwcfi	cfa_offset, 56
	.dwcfi	save_reg_to_mem, 19, 0
$C$DW$49	.dwtag  DW_TAG_variable, DW_AT_name("paddr")
	.dwattr $C$DW$49, DW_AT_TI_symbol_name("paddr")
	.dwattr $C$DW$49, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$49, DW_AT_location[DW_OP_breg31 4]
$C$DW$50	.dwtag  DW_TAG_variable, DW_AT_name("vaddr")
	.dwattr $C$DW$50, DW_AT_TI_symbol_name("vaddr")
	.dwattr $C$DW$50, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$50, DW_AT_location[DW_OP_breg31 8]
$C$DW$51	.dwtag  DW_TAG_variable, DW_AT_name("size")
	.dwattr $C$DW$51, DW_AT_TI_symbol_name("size")
	.dwattr $C$DW$51, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$51, DW_AT_location[DW_OP_breg31 12]
$C$DW$52	.dwtag  DW_TAG_variable, DW_AT_name("perm")
	.dwattr $C$DW$52, DW_AT_TI_symbol_name("perm")
	.dwattr $C$DW$52, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$52, DW_AT_location[DW_OP_breg31 16]
$C$DW$53	.dwtag  DW_TAG_variable, DW_AT_name("permissions")
	.dwattr $C$DW$53, DW_AT_TI_symbol_name("permissions")
	.dwattr $C$DW$53, DW_AT_type(*$C$DW$T$6)
	.dwattr $C$DW$53, DW_AT_location[DW_OP_breg31 20]
$C$DW$54	.dwtag  DW_TAG_variable, DW_AT_name("p")
	.dwattr $C$DW$54, DW_AT_TI_symbol_name("p")
	.dwattr $C$DW$54, DW_AT_type(*$C$DW$T$6)
	.dwattr $C$DW$54, DW_AT_location[DW_OP_breg31 21]
$C$DW$55	.dwtag  DW_TAG_variable, DW_AT_name("num_mppa")
	.dwattr $C$DW$55, DW_AT_TI_symbol_name("num_mppa")
	.dwattr $C$DW$55, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$55, DW_AT_location[DW_OP_breg31 24]
$C$DW$56	.dwtag  DW_TAG_variable, DW_AT_name("start_mppa_idx")
	.dwattr $C$DW$56, DW_AT_TI_symbol_name("start_mppa_idx")
	.dwattr $C$DW$56, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$56, DW_AT_location[DW_OP_breg31 28]
$C$DW$57	.dwtag  DW_TAG_variable, DW_AT_name("start_mppa_addr")
	.dwattr $C$DW$57, DW_AT_TI_symbol_name("start_mppa_addr")
	.dwattr $C$DW$57, DW_AT_type(*$C$DW$T$38)
	.dwattr $C$DW$57, DW_AT_location[DW_OP_breg31 32]
$C$DW$58	.dwtag  DW_TAG_variable, DW_AT_name("i")
	.dwattr $C$DW$58, DW_AT_TI_symbol_name("i")
	.dwattr $C$DW$58, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$58, DW_AT_location[DW_OP_breg31 36]
$C$DW$59	.dwtag  DW_TAG_variable, DW_AT_name("mppa_val")
	.dwattr $C$DW$59, DW_AT_TI_symbol_name("mppa_val")
	.dwattr $C$DW$59, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$59, DW_AT_location[DW_OP_breg31 40]
$C$DW$60	.dwtag  DW_TAG_variable, DW_AT_name("segsz")
	.dwattr $C$DW$60, DW_AT_TI_symbol_name("segsz")
	.dwattr $C$DW$60, DW_AT_type(*$C$DW$T$6)
	.dwattr $C$DW$60, DW_AT_location[DW_OP_breg31 44]
$C$DW$61	.dwtag  DW_TAG_variable, DW_AT_name("raddr")
	.dwattr $C$DW$61, DW_AT_TI_symbol_name("raddr")
	.dwattr $C$DW$61, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$61, DW_AT_location[DW_OP_breg31 48]
$C$DW$62	.dwtag  DW_TAG_variable, DW_AT_name("baddr")
	.dwattr $C$DW$62, DW_AT_TI_symbol_name("baddr")
	.dwattr $C$DW$62, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$62, DW_AT_location[DW_OP_breg31 52]
;----------------------------------------------------------------------
; 157 | unsigned char permissions, p;                                          
; 158 | unsigned int num_mppa, start_mppa_idx, *start_mppa_addr, i, mppa_val;  
; 159 | #if ((DEVICE==6670) || (DEVICE==6678) || (DEVICE==6657))               
; 160 | unsigned char segsz;                                                   
; 161 | unsigned int raddr, baddr;                                             
; 162 | #endif                                                                 
; 164 | #if ((DEVICE==6670) || (DEVICE==6678) || (DEVICE==6657))               
;----------------------------------------------------------------------
           STW     .D2T1   A6,*+SP(12)       ; |156| 
           STW     .D2T2   B4,*+SP(8)        ; |156| 

           MV      .L1X    B6,A3             ; |156| 
||         STW     .D2T1   A4,*+SP(4)        ; |156| 

           STW     .D2T1   A3,*+SP(16)       ; |156| 
	.dwpsn	file "../src/nml_ar_utils.c",line 165,column 2,is_stmt,isa 0
;----------------------------------------------------------------------
; 165 | if (vaddr >= MPAX_MAPPABLE_RANGE_START) {                              
;----------------------------------------------------------------------
           ZERO    .L2     B5
           SET     .S2     B5,0x1a,0x1b,B5
           CMPLTU  .L2     B4,B5,B0          ; |165| 
   [ B0]   BNOP    .S1     $C$L13,5          ; |165| 
           ; BRANCHCC OCCURS {$C$L13}        ; |165| 
;** --------------------------------------------------------------------------*
	.dwpsn	file "../src/nml_ar_utils.c",line 167,column 3,is_stmt,isa 0
;----------------------------------------------------------------------
; 167 | p = (unsigned char)perm;                                               
;----------------------------------------------------------------------
           LDBU    .D2T2   *+SP(16),B4       ; |167| 
           NOP             4
           STB     .D2T2   B4,*+SP(21)       ; |167| 
	.dwpsn	file "../src/nml_ar_utils.c",line 168,column 3,is_stmt,isa 0
;----------------------------------------------------------------------
; 168 | permissions = 0;                                                       
;----------------------------------------------------------------------
           ZERO    .L2     B4                ; |168| 
           STB     .D2T2   B4,*+SP(20)       ; |168| 
	.dwpsn	file "../src/nml_ar_utils.c",line 169,column 3,is_stmt,isa 0
;----------------------------------------------------------------------
; 169 | if (p & UX)                                                            
;----------------------------------------------------------------------
           LDBU    .D2T2   *+SP(21),B4       ; |169| 
           NOP             4
           AND     .L2     1,B4,B0           ; |169| 
   [!B0]   BNOP    .S1     $C$L7,5           ; |169| 
           ; BRANCHCC OCCURS {$C$L7}         ; |169| 
;** --------------------------------------------------------------------------*
	.dwpsn	file "../src/nml_ar_utils.c",line 170,column 4,is_stmt,isa 0
;----------------------------------------------------------------------
; 170 | permissions |=  MPAX_UX;                                               
;----------------------------------------------------------------------
           LDBU    .D2T2   *+SP(20),B4       ; |170| 
           NOP             4
           OR      .L2     1,B4,B4           ; |170| 
           STB     .D2T2   B4,*+SP(20)       ; |170| 
;** --------------------------------------------------------------------------*
$C$L7:    
	.dwpsn	file "../src/nml_ar_utils.c",line 171,column 3,is_stmt,isa 0
;----------------------------------------------------------------------
; 171 | if (p & UW)                                                            
;----------------------------------------------------------------------
           LDBU    .D2T2   *+SP(21),B4       ; |171| 
           NOP             4
           AND     .L2     2,B4,B0           ; |171| 
   [!B0]   BNOP    .S1     $C$L8,5           ; |171| 
           ; BRANCHCC OCCURS {$C$L8}         ; |171| 
;** --------------------------------------------------------------------------*
	.dwpsn	file "../src/nml_ar_utils.c",line 172,column 4,is_stmt,isa 0
;----------------------------------------------------------------------
; 172 | permissions |=  MPAX_UW;                                               
;----------------------------------------------------------------------
           LDBU    .D2T2   *+SP(20),B4       ; |172| 
           NOP             4
           OR      .L2     2,B4,B4           ; |172| 
           STB     .D2T2   B4,*+SP(20)       ; |172| 
;** --------------------------------------------------------------------------*
$C$L8:    
	.dwpsn	file "../src/nml_ar_utils.c",line 173,column 3,is_stmt,isa 0
;----------------------------------------------------------------------
; 173 | if (p & UR)                                                            
;----------------------------------------------------------------------
           LDBU    .D2T2   *+SP(21),B4       ; |173| 
           NOP             4
           AND     .L2     4,B4,B0           ; |173| 
   [!B0]   BNOP    .S1     $C$L9,5           ; |173| 
           ; BRANCHCC OCCURS {$C$L9}         ; |173| 
;** --------------------------------------------------------------------------*
	.dwpsn	file "../src/nml_ar_utils.c",line 174,column 4,is_stmt,isa 0
;----------------------------------------------------------------------
; 174 | permissions |=  MPAX_UR;                                               
;----------------------------------------------------------------------
           LDBU    .D2T2   *+SP(20),B4       ; |174| 
           NOP             4
           OR      .L2     4,B4,B4           ; |174| 
           STB     .D2T2   B4,*+SP(20)       ; |174| 
;** --------------------------------------------------------------------------*
$C$L9:    
	.dwpsn	file "../src/nml_ar_utils.c",line 175,column 3,is_stmt,isa 0
;----------------------------------------------------------------------
; 175 | if (p & SX)                                                            
;----------------------------------------------------------------------
           LDBU    .D2T2   *+SP(21),B4       ; |175| 
           NOP             4
           AND     .L2     8,B4,B0           ; |175| 
   [!B0]   BNOP    .S1     $C$L10,5          ; |175| 
           ; BRANCHCC OCCURS {$C$L10}        ; |175| 
;** --------------------------------------------------------------------------*
	.dwpsn	file "../src/nml_ar_utils.c",line 176,column 4,is_stmt,isa 0
;----------------------------------------------------------------------
; 176 | permissions |=  MPAX_SX;                                               
;----------------------------------------------------------------------
           LDBU    .D2T2   *+SP(20),B4       ; |176| 
           NOP             4
           OR      .L2     8,B4,B4           ; |176| 
           STB     .D2T2   B4,*+SP(20)       ; |176| 
;** --------------------------------------------------------------------------*
$C$L10:    
	.dwpsn	file "../src/nml_ar_utils.c",line 177,column 3,is_stmt,isa 0
;----------------------------------------------------------------------
; 177 | if (p & SW)                                                            
;----------------------------------------------------------------------
           LDBU    .D2T2   *+SP(21),B4       ; |177| 
           NOP             4
           EXTU    .S2     B4,27,31,B0       ; |177| 
   [!B0]   BNOP    .S1     $C$L11,5          ; |177| 
           ; BRANCHCC OCCURS {$C$L11}        ; |177| 
;** --------------------------------------------------------------------------*
	.dwpsn	file "../src/nml_ar_utils.c",line 178,column 4,is_stmt,isa 0
;----------------------------------------------------------------------
; 178 | permissions |=  MPAX_SW;                                               
;----------------------------------------------------------------------
           LDBU    .D2T2   *+SP(20),B4       ; |178| 
           NOP             4
           SET     .S2     B4,4,4,B4         ; |178| 
           STB     .D2T2   B4,*+SP(20)       ; |178| 
;** --------------------------------------------------------------------------*
$C$L11:    
	.dwpsn	file "../src/nml_ar_utils.c",line 179,column 3,is_stmt,isa 0
;----------------------------------------------------------------------
; 179 | if (p & SR)                                                            
;----------------------------------------------------------------------
           LDBU    .D2T2   *+SP(21),B4       ; |179| 
           NOP             4
           EXTU    .S2     B4,26,31,B0       ; |179| 
   [!B0]   BNOP    .S1     $C$L12,5          ; |179| 
           ; BRANCHCC OCCURS {$C$L12}        ; |179| 
;** --------------------------------------------------------------------------*
	.dwpsn	file "../src/nml_ar_utils.c",line 180,column 4,is_stmt,isa 0
;----------------------------------------------------------------------
; 180 | permissions |=  MPAX_SR;                                               
;----------------------------------------------------------------------
           LDBU    .D2T2   *+SP(20),B4       ; |180| 
           NOP             4
           SET     .S2     B4,5,5,B4         ; |180| 
           STB     .D2T2   B4,*+SP(20)       ; |180| 
;** --------------------------------------------------------------------------*
$C$L12:    
	.dwpsn	file "../src/nml_ar_utils.c",line 182,column 3,is_stmt,isa 0
;----------------------------------------------------------------------
; 182 | segsz = MPAX_SEGSZ_VAL_4K + (__logbase2(size) - LOG_BASE2_4K);         
;----------------------------------------------------------------------
           MVKL    .S1     __logbase2,A3
           MVKH    .S1     __logbase2,A3
           MV      .L1     A6,A4             ; |182| 
$C$DW$63	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$63, DW_AT_low_pc(0x00)
	.dwattr $C$DW$63, DW_AT_name("__logbase2")
	.dwattr $C$DW$63, DW_AT_TI_call
           CALL    .S2X    A3                ; |182| 
           ADDKPC  .S2     $C$RL2,B3,4       ; |182| 
$C$RL2:    ; CALL OCCURS {__logbase2} {0}    ; |182| 
           SUB     .L1     A4,1,A3           ; |182| 
           STB     .D2T1   A3,*+SP(44)       ; |182| 
	.dwpsn	file "../src/nml_ar_utils.c",line 184,column 3,is_stmt,isa 0
;----------------------------------------------------------------------
; 184 | baddr = vaddr >> 12; /* upper 20 bits of vaddr */                      
;----------------------------------------------------------------------
           LDW     .D2T2   *+SP(8),B4        ; |184| 
           NOP             4
           SHRU    .S2     B4,12,B4          ; |184| 
           STW     .D2T2   B4,*+SP(52)       ; |184| 
	.dwpsn	file "../src/nml_ar_utils.c",line 185,column 3,is_stmt,isa 0
;----------------------------------------------------------------------
; 185 | raddr = paddr >> 8;  /* upper 24 bits of paddr */                      
;----------------------------------------------------------------------
           LDW     .D2T2   *+SP(4),B4        ; |185| 
           NOP             4
           SHRU    .S1X    B4,8,A3           ; |185| 
           STW     .D2T1   A3,*+SP(48)       ; |185| 
	.dwpsn	file "../src/nml_ar_utils.c",line 186,column 3,is_stmt,isa 0
;----------------------------------------------------------------------
; 186 | *(volatile unsigned int *)XMPAXL(nml_mpax_seg_idx[DNUM]) = (raddr << 8)
;     |   | permissions;                                                       
;----------------------------------------------------------------------
           LDBU    .D2T2   *+SP(20),B6       ; |186| 
           MV      .L2X    A3,B4
           MVKL    .S2     nml_mpax_seg_idx,B5
           SHL     .S1X    B4,8,A3           ; |186| 
           MVKH    .S2     nml_mpax_seg_idx,B5

           OR      .L2X    B6,A3,B6          ; |186| 
||         MVC     .S2     DNUM,B4           ; |186| 

           LDBU    .D2T2   *+B4[B5],B4       ; |186| 
           ZERO    .L2     B5
           SET     .S2     B5,0x1b,0x1b,B5
           NOP             2
           ADDAD   .D2     B5,B4,B4          ; |186| 
           STW     .D2T2   B6,*B4            ; |186| 
	.dwpsn	file "../src/nml_ar_utils.c",line 187,column 3,is_stmt,isa 0
;----------------------------------------------------------------------
; 187 | *(volatile unsigned int *)XMPAXH(nml_mpax_seg_idx[DNUM]) = (baddr << 12
;     | ) | segsz;                                                             
;----------------------------------------------------------------------
           LDW     .D2T2   *+SP(52),B4       ; |187| 
           LDBU    .D2T2   *+SP(44),B6       ; |187| 
           MVKL    .S2     nml_mpax_seg_idx,B5
           MVKH    .S2     nml_mpax_seg_idx,B5
           NOP             1
           SHL     .S1X    B4,12,A3          ; |187| 
           NOP             1

           OR      .L2X    B6,A3,B6          ; |187| 
||         MVC     .S2     DNUM,B4           ; |187| 

           LDBU    .D2T2   *+B4[B5],B4       ; |187| 
           MVKL    .S2     0x8000004,B5
           MVKH    .S2     0x8000004,B5
           NOP             2
           ADDAD   .D2     B5,B4,B4          ; |187| 
           STW     .D2T2   B6,*B4            ; |187| 
	.dwpsn	file "../src/nml_ar_utils.c",line 188,column 3,is_stmt,isa 0
;----------------------------------------------------------------------
; 188 | nml_mpax_seg_idx[DNUM]++;                                              
;----------------------------------------------------------------------
           MVC     .S2     DNUM,B4           ; |188| 
           MVKL    .S2     nml_mpax_seg_idx,B5
           MVKH    .S2     nml_mpax_seg_idx,B5
           ADD     .L2     B5,B4,B5          ; |188| 
           LDBU    .D2T2   *B5,B4            ; |188| 
           NOP             4
           ADD     .L2     1,B4,B4           ; |188| 
           STB     .D2T2   B4,*B5            ; |188| 
	.dwpsn	file "../src/nml_ar_utils.c",line 189,column 3,is_stmt,isa 0
;----------------------------------------------------------------------
; 189 | return 0;                                                              
; 191 | #endif /* C6670, C6678 */                                              
;----------------------------------------------------------------------
           BNOP    .S1     $C$L29,4          ; |189| 
           ZERO    .L1     A4                ; |189| 
           ; BRANCH OCCURS {$C$L29}          ; |189| 
;** --------------------------------------------------------------------------*
$C$L13:    
	.dwpsn	file "../src/nml_ar_utils.c",line 194,column 2,is_stmt,isa 0
;----------------------------------------------------------------------
; 194 | p = (unsigned char)perm;                                               
;----------------------------------------------------------------------
           LDBU    .D2T2   *+SP(16),B4       ; |194| 
           NOP             4
           STB     .D2T2   B4,*+SP(21)       ; |194| 
	.dwpsn	file "../src/nml_ar_utils.c",line 195,column 2,is_stmt,isa 0
;----------------------------------------------------------------------
; 195 | permissions = 0;                                                       
;----------------------------------------------------------------------
           ZERO    .L2     B4                ; |195| 
           STB     .D2T2   B4,*+SP(20)       ; |195| 
	.dwpsn	file "../src/nml_ar_utils.c",line 196,column 2,is_stmt,isa 0
;----------------------------------------------------------------------
; 196 | if (p & UX)                                                            
;----------------------------------------------------------------------
           LDBU    .D2T2   *+SP(21),B4       ; |196| 
           NOP             4
           AND     .L2     1,B4,B0           ; |196| 
   [!B0]   BNOP    .S1     $C$L14,5          ; |196| 
           ; BRANCHCC OCCURS {$C$L14}        ; |196| 
;** --------------------------------------------------------------------------*
	.dwpsn	file "../src/nml_ar_utils.c",line 197,column 3,is_stmt,isa 0
;----------------------------------------------------------------------
; 197 | permissions |=  MPPA_UX;                                               
;----------------------------------------------------------------------
           LDBU    .D2T2   *+SP(20),B4       ; |197| 
           NOP             4
           OR      .L2     1,B4,B4           ; |197| 
           STB     .D2T2   B4,*+SP(20)       ; |197| 
;** --------------------------------------------------------------------------*
$C$L14:    
	.dwpsn	file "../src/nml_ar_utils.c",line 198,column 2,is_stmt,isa 0
;----------------------------------------------------------------------
; 198 | if (p & UW)                                                            
;----------------------------------------------------------------------
           LDBU    .D2T2   *+SP(21),B4       ; |198| 
           NOP             4
           AND     .L2     2,B4,B0           ; |198| 
   [!B0]   BNOP    .S1     $C$L15,5          ; |198| 
           ; BRANCHCC OCCURS {$C$L15}        ; |198| 
;** --------------------------------------------------------------------------*
	.dwpsn	file "../src/nml_ar_utils.c",line 199,column 3,is_stmt,isa 0
;----------------------------------------------------------------------
; 199 | permissions |=  MPPA_UW;                                               
;----------------------------------------------------------------------
           LDBU    .D2T2   *+SP(20),B4       ; |199| 
           NOP             4
           OR      .L2     2,B4,B4           ; |199| 
           STB     .D2T2   B4,*+SP(20)       ; |199| 
;** --------------------------------------------------------------------------*
$C$L15:    
	.dwpsn	file "../src/nml_ar_utils.c",line 200,column 2,is_stmt,isa 0
;----------------------------------------------------------------------
; 200 | if (p & UR)                                                            
;----------------------------------------------------------------------
           LDBU    .D2T2   *+SP(21),B4       ; |200| 
           NOP             4
           AND     .L2     4,B4,B0           ; |200| 
   [!B0]   BNOP    .S1     $C$L16,5          ; |200| 
           ; BRANCHCC OCCURS {$C$L16}        ; |200| 
;** --------------------------------------------------------------------------*
	.dwpsn	file "../src/nml_ar_utils.c",line 201,column 3,is_stmt,isa 0
;----------------------------------------------------------------------
; 201 | permissions |=  MPPA_UR;                                               
;----------------------------------------------------------------------
           LDBU    .D2T2   *+SP(20),B4       ; |201| 
           NOP             4
           OR      .L2     4,B4,B4           ; |201| 
           STB     .D2T2   B4,*+SP(20)       ; |201| 
;** --------------------------------------------------------------------------*
$C$L16:    
	.dwpsn	file "../src/nml_ar_utils.c",line 202,column 2,is_stmt,isa 0
;----------------------------------------------------------------------
; 202 | if (p & SX)                                                            
;----------------------------------------------------------------------
           LDBU    .D2T2   *+SP(21),B4       ; |202| 
           NOP             4
           AND     .L2     8,B4,B0           ; |202| 
   [!B0]   BNOP    .S1     $C$L17,5          ; |202| 
           ; BRANCHCC OCCURS {$C$L17}        ; |202| 
;** --------------------------------------------------------------------------*
	.dwpsn	file "../src/nml_ar_utils.c",line 203,column 3,is_stmt,isa 0
;----------------------------------------------------------------------
; 203 | permissions |=  MPPA_SX;                                               
;----------------------------------------------------------------------
           LDBU    .D2T2   *+SP(20),B4       ; |203| 
           NOP             4
           OR      .L2     8,B4,B4           ; |203| 
           STB     .D2T2   B4,*+SP(20)       ; |203| 
;** --------------------------------------------------------------------------*
$C$L17:    
	.dwpsn	file "../src/nml_ar_utils.c",line 204,column 2,is_stmt,isa 0
;----------------------------------------------------------------------
; 204 | if (p & SW)                                                            
;----------------------------------------------------------------------
           LDBU    .D2T2   *+SP(21),B4       ; |204| 
           NOP             4
           EXTU    .S2     B4,27,31,B0       ; |204| 
   [!B0]   BNOP    .S1     $C$L18,5          ; |204| 
           ; BRANCHCC OCCURS {$C$L18}        ; |204| 
;** --------------------------------------------------------------------------*
	.dwpsn	file "../src/nml_ar_utils.c",line 205,column 3,is_stmt,isa 0
;----------------------------------------------------------------------
; 205 | permissions |=  MPPA_SW;                                               
;----------------------------------------------------------------------
           LDBU    .D2T2   *+SP(20),B4       ; |205| 
           NOP             4
           SET     .S2     B4,4,4,B4         ; |205| 
           STB     .D2T2   B4,*+SP(20)       ; |205| 
;** --------------------------------------------------------------------------*
$C$L18:    
	.dwpsn	file "../src/nml_ar_utils.c",line 206,column 2,is_stmt,isa 0
;----------------------------------------------------------------------
; 206 | if (p & SR)                                                            
;----------------------------------------------------------------------
           LDBU    .D2T2   *+SP(21),B4       ; |206| 
           NOP             4
           EXTU    .S2     B4,26,31,B0       ; |206| 
   [!B0]   BNOP    .S1     $C$L19,5          ; |206| 
           ; BRANCHCC OCCURS {$C$L19}        ; |206| 
;** --------------------------------------------------------------------------*
	.dwpsn	file "../src/nml_ar_utils.c",line 207,column 3,is_stmt,isa 0
;----------------------------------------------------------------------
; 207 | permissions |=  MPPA_SR;                                               
;----------------------------------------------------------------------
           LDBU    .D2T2   *+SP(20),B4       ; |207| 
           NOP             4
           SET     .S2     B4,5,5,B4         ; |207| 
           STB     .D2T2   B4,*+SP(20)       ; |207| 
;** --------------------------------------------------------------------------*
$C$L19:    
	.dwpsn	file "../src/nml_ar_utils.c",line 210,column 2,is_stmt,isa 0
;----------------------------------------------------------------------
; 210 | if ((vaddr >= L2_SRAM_PORT0_START) & ((vaddr+size) <= (L2_SRAM_PORT0_EN
;     | D+1))) {                                                               
;----------------------------------------------------------------------
           LDW     .D2T2   *+SP(8),B4        ; |210| 
           ZERO    .L2     B5
           MVKH    .S2     0x900000,B5
           ZERO    .L1     A3
           SET     .S1     A3,0x17,0x17,A3

           MV      .L2     B4,B7             ; |210| 
||         ADD     .S2X    A6,B4,B4          ; |210| 

           CMPGTU  .L2     B4,B5,B4          ; |210| 
           CMPLTU  .L1X    B7,A3,A3          ; |210| 
           OR      .L1X    A3,B4,A0
   [ A0]   BNOP    .S1     $C$L21,4          ; |210| 
           MV      .L2X    A6,B6             ; |210| 
           ; BRANCHCC OCCURS {$C$L21}        ; |210| 
;** --------------------------------------------------------------------------*
	.dwpsn	file "../src/nml_ar_utils.c",line 211,column 3,is_stmt,isa 0
;----------------------------------------------------------------------
; 211 | start_mppa_idx = (vaddr - L2_SRAM_PORT0_START) / L2_SRAM_PORT0_PAGE_SZ;
;     |                                                                        
;----------------------------------------------------------------------
           ZERO    .L2     B5
           SET     .S2     B5,0x17,0x17,B5
           SUB     .L2     B7,B5,B4          ; |211| 
           SHRU    .S2     B4,15,B4          ; |211| 
           STW     .D2T2   B4,*+SP(28)       ; |211| 
	.dwpsn	file "../src/nml_ar_utils.c",line 212,column 3,is_stmt,isa 0
;----------------------------------------------------------------------
; 212 | num_mppa = size / L2_SRAM_PORT0_PAGE_SZ;                               
;----------------------------------------------------------------------
           MV      .L2     B6,B4
           NOP             1
           SHRU    .S1X    B4,15,A3          ; |212| 
           STW     .D2T1   A3,*+SP(24)       ; |212| 
	.dwpsn	file "../src/nml_ar_utils.c",line 213,column 3,is_stmt,isa 0
;----------------------------------------------------------------------
; 213 | if (size % (L2_SRAM_PORT0_PAGE_SZ))                                    
;----------------------------------------------------------------------
           EXTU    .S2     B4,17,17,B0       ; |213| 
   [!B0]   BNOP    .S1     $C$L20,5          ; |213| 
           ; BRANCHCC OCCURS {$C$L20}        ; |213| 
;** --------------------------------------------------------------------------*
	.dwpsn	file "../src/nml_ar_utils.c",line 214,column 4,is_stmt,isa 0
;----------------------------------------------------------------------
; 214 | num_mppa++;                                                            
;----------------------------------------------------------------------
           ADD     .L2X    1,A3,B4           ; |214| 
           STW     .D2T2   B4,*+SP(24)       ; |214| 
;** --------------------------------------------------------------------------*
$C$L20:    
	.dwpsn	file "../src/nml_ar_utils.c",line 215,column 3,is_stmt,isa 0
;----------------------------------------------------------------------
; 215 | start_mppa_addr = (unsigned int *)L2MPPA_ADDR(start_mppa_idx);         
;----------------------------------------------------------------------
           LDW     .D2T2   *+SP(28),B4       ; |215| 
           MVKL    .S2     0x184a200,B5
           MVKH    .S2     0x184a200,B5
           NOP             2
           ADDAW   .D2     B5,B4,B4          ; |215| 
           STW     .D2T2   B4,*+SP(32)       ; |215| 
	.dwpsn	file "../src/nml_ar_utils.c",line 216,column 2,is_stmt,isa 0
;----------------------------------------------------------------------
; 217 | #if (DEVICE==6472)                                                     
; 219 | else if ((vaddr >= L2_SRAM_PORT1_START) & ((vaddr+size) <= (L2_SRAM_POR
;     | T1_END+1))) {                                                          
; 220 |         start_mppa_idx = L2_SRAM_PORT1_MPPA_REG_IDX_START;             
; 221 |         start_mppa_idx += (vaddr - L2_SRAM_PORT1_START) / L2_SRAM_PORT1
;     | _PAGE_SZ;                                                              
; 222 |         num_mppa = size / L2_SRAM_PORT1_PAGE_SZ;                       
; 223 |         if (size % (L2_SRAM_PORT1_PAGE_SZ))                            
; 224 |                 num_mppa++;                                            
; 225 |         start_mppa_addr = (unsigned int *)L2MPPA_ADDR(start_mppa_idx); 
; 227 | #endif /* C6472 */                                                     
;----------------------------------------------------------------------
           BNOP    .S1     $C$L26,5          ; |216| 
           ; BRANCH OCCURS {$C$L26}          ; |216| 
;** --------------------------------------------------------------------------*
$C$L21:    
	.dwpsn	file "../src/nml_ar_utils.c",line 229,column 7,is_stmt,isa 0
;----------------------------------------------------------------------
; 229 | else if ((vaddr >= L1D_START) & ((vaddr+size) <= (L1D_END+1))) {       
;----------------------------------------------------------------------

           ADD     .L2     B6,B7,B4          ; |229| 
||         MV      .D2     B6,B5
||         MVKL    .S2     0xf08000,B6

           MVKH    .S2     0xf08000,B6
||         ZERO    .L1     A3

           CMPGTU  .L2     B4,B6,B4          ; |229| 
||         SET     .S1     A3,0x14,0x17,A3

           CMPLTU  .L1X    B7,A3,A3          ; |229| 
           OR      .L1X    A3,B4,A0
   [ A0]   BNOP    .S1     $C$L23,5          ; |229| 
           ; BRANCHCC OCCURS {$C$L23}        ; |229| 
;** --------------------------------------------------------------------------*
	.dwpsn	file "../src/nml_ar_utils.c",line 230,column 3,is_stmt,isa 0
;----------------------------------------------------------------------
; 230 | start_mppa_idx = L1D_MPPA_REG_IDX_START;                               
;----------------------------------------------------------------------
           MVK     .S1     16,A3             ; |230| 
           STW     .D2T1   A3,*+SP(28)       ; |230| 
	.dwpsn	file "../src/nml_ar_utils.c",line 231,column 3,is_stmt,isa 0
;----------------------------------------------------------------------
; 231 | start_mppa_idx += (vaddr - L1D_START) / L1D_PAGE_SZ;                   
;----------------------------------------------------------------------
           ZERO    .L2     B6
           SET     .S2     B6,0x14,0x17,B6
           SUB     .L2     B7,B6,B4          ; |231| 
           SHRU    .S2     B4,11,B4          ; |231| 
           ADD     .L2X    B4,A3,B4          ; |231| 
           STW     .D2T2   B4,*+SP(28)       ; |231| 
	.dwpsn	file "../src/nml_ar_utils.c",line 232,column 3,is_stmt,isa 0
;----------------------------------------------------------------------
; 232 | num_mppa = size / L1D_PAGE_SZ;                                         
;----------------------------------------------------------------------
           MV      .L2X    A6,B4
           SHRU    .S2     B4,11,B4          ; |232| 
           STW     .D2T2   B4,*+SP(24)       ; |232| 
	.dwpsn	file "../src/nml_ar_utils.c",line 233,column 3,is_stmt,isa 0
;----------------------------------------------------------------------
; 233 | if (size % (L1D_PAGE_SZ))                                              
;----------------------------------------------------------------------
           MV      .L2X    A6,B4
           EXTU    .S2     B4,21,21,B0       ; |233| 
   [!B0]   BNOP    .S1     $C$L22,5          ; |233| 
           ; BRANCHCC OCCURS {$C$L22}        ; |233| 
;** --------------------------------------------------------------------------*
	.dwpsn	file "../src/nml_ar_utils.c",line 234,column 4,is_stmt,isa 0
;----------------------------------------------------------------------
; 234 | num_mppa++;                                                            
;----------------------------------------------------------------------
           LDW     .D2T2   *+SP(24),B4       ; |234| 
           NOP             4
           ADD     .L2     1,B4,B4           ; |234| 
           STW     .D2T2   B4,*+SP(24)       ; |234| 
;** --------------------------------------------------------------------------*
$C$L22:    
	.dwpsn	file "../src/nml_ar_utils.c",line 235,column 3,is_stmt,isa 0
;----------------------------------------------------------------------
; 235 | start_mppa_addr = (unsigned int *)L1D_MPPA_ADDR(start_mppa_idx);       
;----------------------------------------------------------------------
           LDW     .D2T2   *+SP(28),B4       ; |235| 
           MVKL    .S2     0x184ae00,B5
           MVKH    .S2     0x184ae00,B5
           NOP             2
           ADDAW   .D2     B5,B4,B4          ; |235| 
           STW     .D2T2   B4,*+SP(32)       ; |235| 
	.dwpsn	file "../src/nml_ar_utils.c",line 236,column 2,is_stmt,isa 0
           BNOP    .S1     $C$L26,5          ; |236| 
           ; BRANCH OCCURS {$C$L26}          ; |236| 
;** --------------------------------------------------------------------------*
$C$L23:    
	.dwpsn	file "../src/nml_ar_utils.c",line 238,column 7,is_stmt,isa 0
;----------------------------------------------------------------------
; 238 | else if ((vaddr >= L1P_START) & ((vaddr+size) <= (L1P_END+1))) {       
;----------------------------------------------------------------------
           MVKL    .S2     0xe08000,B6

           MVKH    .S2     0xe08000,B6
||         ADD     .L2     B5,B7,B4          ; |238| 
||         ZERO    .L1     A3

           CMPGTU  .L2     B4,B6,B4          ; |238| 
||         SET     .S1     A3,0x15,0x17,A3

           CMPLTU  .L1X    B7,A3,A3          ; |238| 
           OR      .L1X    A3,B4,A0
   [ A0]   BNOP    .S1     $C$L25,5          ; |238| 
           ; BRANCHCC OCCURS {$C$L25}        ; |238| 
;** --------------------------------------------------------------------------*
	.dwpsn	file "../src/nml_ar_utils.c",line 239,column 3,is_stmt,isa 0
;----------------------------------------------------------------------
; 239 | start_mppa_idx = L1P_MPPA_REG_IDX_START;                               
;----------------------------------------------------------------------
           MVK     .S1     16,A3             ; |239| 
           STW     .D2T1   A3,*+SP(28)       ; |239| 
	.dwpsn	file "../src/nml_ar_utils.c",line 240,column 3,is_stmt,isa 0
;----------------------------------------------------------------------
; 240 | start_mppa_idx += (vaddr - L1P_START) / L1P_PAGE_SZ;                   
;----------------------------------------------------------------------
           ZERO    .L2     B6
           SET     .S2     B6,0x15,0x17,B6
           SUB     .L2     B7,B6,B5          ; |240| 
           SHRU    .S2     B5,11,B5          ; |240| 
           ADD     .L2X    B5,A3,B4          ; |240| 
           STW     .D2T2   B4,*+SP(28)       ; |240| 
	.dwpsn	file "../src/nml_ar_utils.c",line 241,column 3,is_stmt,isa 0
;----------------------------------------------------------------------
; 241 | num_mppa = size / L1P_PAGE_SZ;                                         
;----------------------------------------------------------------------
           MV      .L2X    A6,B4
           SHRU    .S2     B4,11,B4          ; |241| 
           STW     .D2T2   B4,*+SP(24)       ; |241| 
	.dwpsn	file "../src/nml_ar_utils.c",line 242,column 3,is_stmt,isa 0
;----------------------------------------------------------------------
; 242 | if (size % (L1P_PAGE_SZ))                                              
;----------------------------------------------------------------------
           MV      .L2X    A6,B4
           EXTU    .S2     B4,21,21,B0       ; |242| 
   [!B0]   BNOP    .S1     $C$L24,5          ; |242| 
           ; BRANCHCC OCCURS {$C$L24}        ; |242| 
;** --------------------------------------------------------------------------*
	.dwpsn	file "../src/nml_ar_utils.c",line 243,column 4,is_stmt,isa 0
;----------------------------------------------------------------------
; 243 | num_mppa++;                                                            
;----------------------------------------------------------------------
           LDW     .D2T2   *+SP(24),B4       ; |243| 
           NOP             4
           ADD     .L2     1,B4,B4           ; |243| 
           STW     .D2T2   B4,*+SP(24)       ; |243| 
;** --------------------------------------------------------------------------*
$C$L24:    
	.dwpsn	file "../src/nml_ar_utils.c",line 244,column 3,is_stmt,isa 0
;----------------------------------------------------------------------
; 244 | start_mppa_addr = (unsigned int *)L1P_MPPA_ADDR(start_mppa_idx);       
;----------------------------------------------------------------------
           LDW     .D2T2   *+SP(28),B4       ; |244| 
           MVKL    .S2     0x184a600,B5
           MVKH    .S2     0x184a600,B5
           NOP             2
           ADDAW   .D2     B5,B4,B4          ; |244| 
           STW     .D2T2   B4,*+SP(32)       ; |244| 
	.dwpsn	file "../src/nml_ar_utils.c",line 245,column 2,is_stmt,isa 0
;----------------------------------------------------------------------
; 246 | else {                                                                 
;----------------------------------------------------------------------
           BNOP    .S1     $C$L26,5          ; |245| 
           ; BRANCH OCCURS {$C$L26}          ; |245| 
;** --------------------------------------------------------------------------*
$C$L25:    
	.dwpsn	file "../src/nml_ar_utils.c",line 247,column 3,is_stmt,isa 0
;----------------------------------------------------------------------
; 247 | return 0;                                                              
;----------------------------------------------------------------------
           BNOP    .S1     $C$L29,4          ; |247| 
           ZERO    .L1     A4                ; |247| 
           ; BRANCH OCCURS {$C$L29}          ; |247| 
;** --------------------------------------------------------------------------*
$C$L26:    
	.dwpsn	file "../src/nml_ar_utils.c",line 251,column 7,is_stmt,isa 0
;----------------------------------------------------------------------
; 251 | for (i=0; i<num_mppa; i++) {                                           
;----------------------------------------------------------------------
           ZERO    .L2     B4                ; |251| 
           STW     .D2T2   B4,*+SP(36)       ; |251| 
	.dwpsn	file "../src/nml_ar_utils.c",line 251,column 12,is_stmt,isa 0
           LDW     .D2T2   *+SP(24),B4       ; |251| 
           LDW     .D2T2   *+SP(36),B5       ; |251| 
           NOP             4
           CMPLTU  .L2     B5,B4,B0          ; |251| 
   [!B0]   BNOP    .S1     $C$L28,5          ; |251| 
           ; BRANCHCC OCCURS {$C$L28}        ; |251| 
;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Software pipelining disabled
;*----------------------------------------------------------------------------*
$C$L27:    
$C$DW$L$nml_mem_map_set$41$B:
	.dwpsn	file "../src/nml_ar_utils.c",line 252,column 3,is_stmt,isa 0
;----------------------------------------------------------------------
; 252 | mppa_val = *(start_mppa_addr+i) & ~MPPA_PERM_MASK;                     
;----------------------------------------------------------------------
           LDW     .D2T2   *+SP(36),B4       ; |252| 
           LDW     .D2T2   *+SP(32),B5       ; |252| 
           NOP             4
           LDW     .D2T2   *+B5[B4],B4       ; |252| 
           NOP             4
           CLR     .S2     B4,0,5,B4         ; |252| 
           STW     .D2T2   B4,*+SP(40)       ; |252| 
	.dwpsn	file "../src/nml_ar_utils.c",line 253,column 3,is_stmt,isa 0
;----------------------------------------------------------------------
; 253 | mppa_val |= permissions;                                               
;----------------------------------------------------------------------
           LDBU    .D2T2   *+SP(20),B5       ; |253| 
           NOP             4
           OR      .L2     B5,B4,B4          ; |253| 
           STW     .D2T2   B4,*+SP(40)       ; |253| 
	.dwpsn	file "../src/nml_ar_utils.c",line 254,column 3,is_stmt,isa 0
;----------------------------------------------------------------------
; 254 | *(start_mppa_addr+i) = mppa_val;                                       
;----------------------------------------------------------------------
           LDW     .D2T1   *+SP(36),A3       ; |254| 
           LDW     .D2T1   *+SP(32),A4       ; |254| 
           NOP             4
           STW     .D1T2   B4,*+A4[A3]       ; |254| 
	.dwpsn	file "../src/nml_ar_utils.c",line 251,column 24,is_stmt,isa 0
           LDW     .D2T2   *+SP(36),B4       ; |251| 
           NOP             4
           ADD     .L2     1,B4,B4           ; |251| 
           STW     .D2T2   B4,*+SP(36)       ; |251| 
	.dwpsn	file "../src/nml_ar_utils.c",line 251,column 12,is_stmt,isa 0
           LDW     .D2T2   *+SP(24),B4       ; |251| 
           LDW     .D2T2   *+SP(36),B5       ; |251| 
           NOP             4
           CMPLTU  .L2     B5,B4,B0          ; |251| 
   [ B0]   BNOP    .S1     $C$L27,5          ; |251| 
           ; BRANCHCC OCCURS {$C$L27}        ; |251| 
$C$DW$L$nml_mem_map_set$41$E:
;** --------------------------------------------------------------------------*
$C$L28:    
	.dwpsn	file "../src/nml_ar_utils.c",line 257,column 2,is_stmt,isa 0
;----------------------------------------------------------------------
; 257 | return 0;                                                              
;----------------------------------------------------------------------
           ZERO    .L1     A4                ; |257| 
;** --------------------------------------------------------------------------*
$C$L29:    
	.dwpsn	file "../src/nml_ar_utils.c",line 258,column 1,is_stmt,isa 0
           LDW     .D2T2   *++SP(56),B3      ; |258| 
           NOP             4
	.dwcfi	cfa_offset, 0
	.dwcfi	restore_reg, 19
	.dwcfi	cfa_offset, 0
$C$DW$64	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$64, DW_AT_low_pc(0x00)
	.dwattr $C$DW$64, DW_AT_TI_return
           RETNOP  .S2     B3,5              ; |258| 
           ; BRANCH OCCURS {B3}              ; |258| 

$C$DW$65	.dwtag  DW_TAG_TI_loop
	.dwattr $C$DW$65, DW_AT_name("/home/gtbldadm/ti/mcsdk_2_01_02_06/tools/boot_loader/mad-utils/mad-loader/nmlLoader/build/nml_ar_utils.asm:$C$L27:1:1353367587")
	.dwattr $C$DW$65, DW_AT_TI_begin_file("../src/nml_ar_utils.c")
	.dwattr $C$DW$65, DW_AT_TI_begin_line(0xfb)
	.dwattr $C$DW$65, DW_AT_TI_end_line(0xff)
$C$DW$66	.dwtag  DW_TAG_TI_loop_range
	.dwattr $C$DW$66, DW_AT_low_pc($C$DW$L$nml_mem_map_set$41$B)
	.dwattr $C$DW$66, DW_AT_high_pc($C$DW$L$nml_mem_map_set$41$E)
	.dwendtag $C$DW$65

	.dwattr $C$DW$44, DW_AT_TI_end_file("../src/nml_ar_utils.c")
	.dwattr $C$DW$44, DW_AT_TI_end_line(0x102)
	.dwattr $C$DW$44, DW_AT_TI_end_column(0x01)
	.dwendentry
	.dwendtag $C$DW$44

	.sect	".text"
	.clink
	.global	nml_mem_attr_set

$C$DW$67	.dwtag  DW_TAG_subprogram, DW_AT_name("nml_mem_attr_set")
	.dwattr $C$DW$67, DW_AT_low_pc(nml_mem_attr_set)
	.dwattr $C$DW$67, DW_AT_high_pc(0x00)
	.dwattr $C$DW$67, DW_AT_TI_symbol_name("nml_mem_attr_set")
	.dwattr $C$DW$67, DW_AT_external
	.dwattr $C$DW$67, DW_AT_type(*$C$DW$T$10)
	.dwattr $C$DW$67, DW_AT_TI_begin_file("../src/nml_ar_utils.c")
	.dwattr $C$DW$67, DW_AT_TI_begin_line(0x10a)
	.dwattr $C$DW$67, DW_AT_TI_begin_column(0x05)
	.dwattr $C$DW$67, DW_AT_decl_file("../src/nml_ar_utils.c")
	.dwattr $C$DW$67, DW_AT_decl_line(0x10a)
	.dwattr $C$DW$67, DW_AT_decl_column(0x05)
	.dwattr $C$DW$67, DW_AT_TI_max_frame_size(0x20)
	.dwpsn	file "../src/nml_ar_utils.c",line 267,column 1,is_stmt,address nml_mem_attr_set,isa 0

	.dwfde $C$DW$CIE, nml_mem_attr_set
$C$DW$68	.dwtag  DW_TAG_formal_parameter, DW_AT_name("vaddr")
	.dwattr $C$DW$68, DW_AT_TI_symbol_name("vaddr")
	.dwattr $C$DW$68, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$68, DW_AT_location[DW_OP_reg4]
$C$DW$69	.dwtag  DW_TAG_formal_parameter, DW_AT_name("size")
	.dwattr $C$DW$69, DW_AT_TI_symbol_name("size")
	.dwattr $C$DW$69, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$69, DW_AT_location[DW_OP_reg20]
$C$DW$70	.dwtag  DW_TAG_formal_parameter, DW_AT_name("attrs")
	.dwattr $C$DW$70, DW_AT_TI_symbol_name("attrs")
	.dwattr $C$DW$70, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$70, DW_AT_location[DW_OP_reg6]
;----------------------------------------------------------------------
; 266 | int nml_mem_attr_set (unsigned int vaddr, unsigned int size, unsigned i
;     | nt attrs)                                                              
;----------------------------------------------------------------------

;******************************************************************************
;* FUNCTION NAME: nml_mem_attr_set                                            *
;*                                                                            *
;*   Regs Modified     : A0,A3,A4,B0,B4,B5,B6,SP                              *
;*   Regs Used         : A0,A3,A4,A6,B0,B3,B4,B5,B6,SP                        *
;*   Local Frame Size  : 0 Args + 28 Auto + 0 Save = 28 byte                  *
;******************************************************************************
nml_mem_attr_set:
;** --------------------------------------------------------------------------*
	.dwcfi	cfa_offset, 0
           ADDK    .S2     -32,SP            ; |267| 
	.dwcfi	cfa_offset, 32
$C$DW$71	.dwtag  DW_TAG_variable, DW_AT_name("vaddr")
	.dwattr $C$DW$71, DW_AT_TI_symbol_name("vaddr")
	.dwattr $C$DW$71, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$71, DW_AT_location[DW_OP_breg31 4]
$C$DW$72	.dwtag  DW_TAG_variable, DW_AT_name("size")
	.dwattr $C$DW$72, DW_AT_TI_symbol_name("size")
	.dwattr $C$DW$72, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$72, DW_AT_location[DW_OP_breg31 8]
$C$DW$73	.dwtag  DW_TAG_variable, DW_AT_name("attrs")
	.dwattr $C$DW$73, DW_AT_TI_symbol_name("attrs")
	.dwattr $C$DW$73, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$73, DW_AT_location[DW_OP_breg31 12]
$C$DW$74	.dwtag  DW_TAG_variable, DW_AT_name("start_mar")
	.dwattr $C$DW$74, DW_AT_TI_symbol_name("start_mar")
	.dwattr $C$DW$74, DW_AT_type(*$C$DW$T$9)
	.dwattr $C$DW$74, DW_AT_location[DW_OP_breg31 16]
$C$DW$75	.dwtag  DW_TAG_variable, DW_AT_name("num_mars")
	.dwattr $C$DW$75, DW_AT_TI_symbol_name("num_mars")
	.dwattr $C$DW$75, DW_AT_type(*$C$DW$T$9)
	.dwattr $C$DW$75, DW_AT_location[DW_OP_breg31 18]
$C$DW$76	.dwtag  DW_TAG_variable, DW_AT_name("i")
	.dwattr $C$DW$76, DW_AT_TI_symbol_name("i")
	.dwattr $C$DW$76, DW_AT_type(*$C$DW$T$9)
	.dwattr $C$DW$76, DW_AT_location[DW_OP_breg31 20]
$C$DW$77	.dwtag  DW_TAG_variable, DW_AT_name("cache_en")
	.dwattr $C$DW$77, DW_AT_TI_symbol_name("cache_en")
	.dwattr $C$DW$77, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$77, DW_AT_location[DW_OP_breg31 24]
$C$DW$78	.dwtag  DW_TAG_variable, DW_AT_name("prefetch_en")
	.dwattr $C$DW$78, DW_AT_TI_symbol_name("prefetch_en")
	.dwattr $C$DW$78, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$78, DW_AT_location[DW_OP_breg31 28]
;----------------------------------------------------------------------
; 268 | unsigned short start_mar, num_mars, i;                                 
; 269 | unsigned int cache_en;                                                 
; 270 | unsigned int prefetch_en;                                              
;----------------------------------------------------------------------
           STW     .D2T1   A6,*+SP(12)       ; |267| 
           STW     .D2T2   B4,*+SP(8)        ; |267| 
           STW     .D2T1   A4,*+SP(4)        ; |267| 
	.dwpsn	file "../src/nml_ar_utils.c",line 273,column 2,is_stmt,isa 0
;----------------------------------------------------------------------
; 273 | if (vaddr < MAR16_RANGE_START)                                         
;----------------------------------------------------------------------
           ZERO    .L2     B5
           SET     .S2     B5,0x1c,0x1c,B5
           CMPLTU  .L2X    A4,B5,B0          ; |273| 
   [!B0]   BNOP    .S1     $C$L30,5          ; |273| 
           ; BRANCHCC OCCURS {$C$L30}        ; |273| 
;** --------------------------------------------------------------------------*
	.dwpsn	file "../src/nml_ar_utils.c",line 274,column 3,is_stmt,isa 0
;----------------------------------------------------------------------
; 274 | return 0;                                                              
;----------------------------------------------------------------------
           BNOP    .S1     $C$L36,4          ; |274| 
           ZERO    .L1     A4                ; |274| 
           ; BRANCH OCCURS {$C$L36}          ; |274| 
;** --------------------------------------------------------------------------*
$C$L30:    
	.dwpsn	file "../src/nml_ar_utils.c",line 276,column 2,is_stmt,isa 0
;----------------------------------------------------------------------
; 276 | cache_en = (attrs & CACHE_EN)? CACHE_EN_MASK:0;                        
; 277 | #if ((DEVICE==6670) || (DEVICE==6678) || (DEVICE==6657))               
;----------------------------------------------------------------------
           MV      .L2X    A6,B4
           AND     .L2     1,B4,B0           ; |276| 
   [ B0]   BNOP    .S1     $C$L31,4          ; |276| 
           MVK     .L2     0x1,B4            ; |276| 
           ; BRANCHCC OCCURS {$C$L31}        ; |276| 
;** --------------------------------------------------------------------------*
           ZERO    .L2     B4                ; |276| 
;** --------------------------------------------------------------------------*
$C$L31:    
           STW     .D2T2   B4,*+SP(24)       ; |276| 
	.dwpsn	file "../src/nml_ar_utils.c",line 278,column 2,is_stmt,isa 0
;----------------------------------------------------------------------
; 278 | prefetch_en = (attrs & PREFETCH_EN)? PREFETCH_EN_MASK:0;               
; 279 | #else                                                                  
; 280 | prefetch_en = 0;                                                       
; 281 | #endif                                                                 
;----------------------------------------------------------------------
           MV      .L2X    A6,B4
           AND     .L2     2,B4,B0           ; |278| 
   [ B0]   BNOP    .S1     $C$L32,4          ; |278| 
           MVK     .L2     0x8,B4            ; |278| 
           ; BRANCHCC OCCURS {$C$L32}        ; |278| 
;** --------------------------------------------------------------------------*
           ZERO    .L2     B4                ; |278| 
;** --------------------------------------------------------------------------*
$C$L32:    
           STW     .D2T2   B4,*+SP(28)       ; |278| 
	.dwpsn	file "../src/nml_ar_utils.c",line 283,column 2,is_stmt,isa 0
;----------------------------------------------------------------------
; 283 | start_mar = vaddr >> 24;  /* divide by 16MB */                         
;----------------------------------------------------------------------
           MV      .L2X    A4,B4
           SHRU    .S2     B4,24,B4          ; |283| 
           STH     .D2T2   B4,*+SP(16)       ; |283| 
	.dwpsn	file "../src/nml_ar_utils.c",line 284,column 2,is_stmt,isa 0
;----------------------------------------------------------------------
; 284 | num_mars = size >> 24;    /* divide by 16MB */                         
;----------------------------------------------------------------------
           LDW     .D2T2   *+SP(8),B4        ; |284| 
           NOP             4
           SHRU    .S2     B4,24,B4          ; |284| 
           STH     .D2T2   B4,*+SP(18)       ; |284| 
	.dwpsn	file "../src/nml_ar_utils.c",line 285,column 2,is_stmt,isa 0
;----------------------------------------------------------------------
; 285 | if (size % (16*1024*1024))                                             
;----------------------------------------------------------------------
           LDW     .D2T1   *+SP(8),A3        ; |285| 
           NOP             4
           EXTU    .S1     A3,8,8,A0         ; |285| 
   [!A0]   BNOP    .S1     $C$L33,5          ; |285| 
           ; BRANCHCC OCCURS {$C$L33}        ; |285| 
;** --------------------------------------------------------------------------*
	.dwpsn	file "../src/nml_ar_utils.c",line 286,column 3,is_stmt,isa 0
;----------------------------------------------------------------------
; 286 | num_mars++;                                                            
;----------------------------------------------------------------------
           LDHU    .D2T2   *+SP(18),B4       ; |286| 
           NOP             4
           ADD     .L2     1,B4,B4           ; |286| 
           STH     .D2T2   B4,*+SP(18)       ; |286| 
;** --------------------------------------------------------------------------*
$C$L33:    
	.dwpsn	file "../src/nml_ar_utils.c",line 288,column 7,is_stmt,isa 0
;----------------------------------------------------------------------
; 288 | for (i=0; i<num_mars; i++) {                                           
;----------------------------------------------------------------------
           ZERO    .L2     B4                ; |288| 
           STH     .D2T2   B4,*+SP(20)       ; |288| 
	.dwpsn	file "../src/nml_ar_utils.c",line 288,column 12,is_stmt,isa 0
           LDHU    .D2T2   *+SP(18),B4       ; |288| 
           LDHU    .D2T2   *+SP(20),B5       ; |288| 
           NOP             4
           CMPLTU  .L2     B5,B4,B0          ; |288| 
   [!B0]   BNOP    .S1     $C$L35,5          ; |288| 
           ; BRANCHCC OCCURS {$C$L35}        ; |288| 
;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Software pipelining disabled
;*----------------------------------------------------------------------------*
$C$L34:    
$C$DW$L$nml_mem_attr_set$10$B:
	.dwpsn	file "../src/nml_ar_utils.c",line 289,column 3,is_stmt,isa 0
;----------------------------------------------------------------------
; 289 | *(unsigned int*)MAR_ADDR((start_mar+i)) = (cache_en|prefetch_en);      
;----------------------------------------------------------------------
           LDHU    .D2T1   *+SP(20),A3       ; |289| 
           LDHU    .D2T2   *+SP(16),B6       ; |289| 
           LDW     .D2T2   *+SP(28),B5       ; |289| 
           LDW     .D2T2   *+SP(24),B4       ; |289| 
           MVKL    .S1     0x1848000,A4
           MVKH    .S1     0x1848000,A4
           ADD     .L1X    A3,B6,A3          ; |289| 
           NOP             1
           OR      .L2     B5,B4,B4          ; |289| 
           STW     .D1T2   B4,*+A4[A3]       ; |289| 
	.dwpsn	file "../src/nml_ar_utils.c",line 288,column 24,is_stmt,isa 0
           LDHU    .D2T2   *+SP(20),B4       ; |288| 
           NOP             4
           ADD     .L2     1,B4,B4           ; |288| 
           STH     .D2T2   B4,*+SP(20)       ; |288| 
	.dwpsn	file "../src/nml_ar_utils.c",line 288,column 12,is_stmt,isa 0
           LDHU    .D2T2   *+SP(18),B4       ; |288| 
           LDHU    .D2T2   *+SP(20),B5       ; |288| 
           NOP             4
           CMPLTU  .L2     B5,B4,B0          ; |288| 
   [ B0]   BNOP    .S1     $C$L34,5          ; |288| 
           ; BRANCHCC OCCURS {$C$L34}        ; |288| 
$C$DW$L$nml_mem_attr_set$10$E:
;** --------------------------------------------------------------------------*
$C$L35:    
	.dwpsn	file "../src/nml_ar_utils.c",line 291,column 2,is_stmt,isa 0
;----------------------------------------------------------------------
; 291 | return 0;                                                              
;----------------------------------------------------------------------
           ZERO    .L1     A4                ; |291| 
;** --------------------------------------------------------------------------*
$C$L36:    
	.dwpsn	file "../src/nml_ar_utils.c",line 292,column 1,is_stmt,isa 0
           ADDK    .S2     32,SP             ; |292| 
	.dwcfi	cfa_offset, 0
	.dwcfi	cfa_offset, 0
$C$DW$79	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$79, DW_AT_low_pc(0x00)
	.dwattr $C$DW$79, DW_AT_TI_return
           RETNOP  .S2     B3,5              ; |292| 
           ; BRANCH OCCURS {B3}              ; |292| 

$C$DW$80	.dwtag  DW_TAG_TI_loop
	.dwattr $C$DW$80, DW_AT_name("/home/gtbldadm/ti/mcsdk_2_01_02_06/tools/boot_loader/mad-utils/mad-loader/nmlLoader/build/nml_ar_utils.asm:$C$L34:1:1353367587")
	.dwattr $C$DW$80, DW_AT_TI_begin_file("../src/nml_ar_utils.c")
	.dwattr $C$DW$80, DW_AT_TI_begin_line(0x120)
	.dwattr $C$DW$80, DW_AT_TI_end_line(0x122)
$C$DW$81	.dwtag  DW_TAG_TI_loop_range
	.dwattr $C$DW$81, DW_AT_low_pc($C$DW$L$nml_mem_attr_set$10$B)
	.dwattr $C$DW$81, DW_AT_high_pc($C$DW$L$nml_mem_attr_set$10$E)
	.dwendtag $C$DW$80

	.dwattr $C$DW$67, DW_AT_TI_end_file("../src/nml_ar_utils.c")
	.dwattr $C$DW$67, DW_AT_TI_end_line(0x124)
	.dwattr $C$DW$67, DW_AT_TI_end_column(0x01)
	.dwendentry
	.dwendtag $C$DW$67

	.sect	".text"
	.clink
	.global	nml_fn_call

$C$DW$82	.dwtag  DW_TAG_subprogram, DW_AT_name("nml_fn_call")
	.dwattr $C$DW$82, DW_AT_low_pc(nml_fn_call)
	.dwattr $C$DW$82, DW_AT_high_pc(0x00)
	.dwattr $C$DW$82, DW_AT_TI_symbol_name("nml_fn_call")
	.dwattr $C$DW$82, DW_AT_external
	.dwattr $C$DW$82, DW_AT_type(*$C$DW$T$10)
	.dwattr $C$DW$82, DW_AT_TI_begin_file("../src/nml_ar_utils.c")
	.dwattr $C$DW$82, DW_AT_TI_begin_line(0x12a)
	.dwattr $C$DW$82, DW_AT_TI_begin_column(0x05)
	.dwattr $C$DW$82, DW_AT_decl_file("../src/nml_ar_utils.c")
	.dwattr $C$DW$82, DW_AT_decl_line(0x12a)
	.dwattr $C$DW$82, DW_AT_decl_column(0x05)
	.dwattr $C$DW$82, DW_AT_TI_max_frame_size(0x18)
	.dwpsn	file "../src/nml_ar_utils.c",line 299,column 1,is_stmt,address nml_fn_call,isa 0

	.dwfde $C$DW$CIE, nml_fn_call
$C$DW$83	.dwtag  DW_TAG_formal_parameter, DW_AT_name("fn")
	.dwattr $C$DW$83, DW_AT_TI_symbol_name("fn")
	.dwattr $C$DW$83, DW_AT_type(*$C$DW$T$24)
	.dwattr $C$DW$83, DW_AT_location[DW_OP_reg4]
$C$DW$84	.dwtag  DW_TAG_formal_parameter, DW_AT_name("arg1")
	.dwattr $C$DW$84, DW_AT_TI_symbol_name("arg1")
	.dwattr $C$DW$84, DW_AT_type(*$C$DW$T$3)
	.dwattr $C$DW$84, DW_AT_location[DW_OP_reg20]
$C$DW$85	.dwtag  DW_TAG_formal_parameter, DW_AT_name("arg2")
	.dwattr $C$DW$85, DW_AT_TI_symbol_name("arg2")
	.dwattr $C$DW$85, DW_AT_type(*$C$DW$T$3)
	.dwattr $C$DW$85, DW_AT_location[DW_OP_reg6]
$C$DW$86	.dwtag  DW_TAG_formal_parameter, DW_AT_name("arg3")
	.dwattr $C$DW$86, DW_AT_TI_symbol_name("arg3")
	.dwattr $C$DW$86, DW_AT_type(*$C$DW$T$3)
	.dwattr $C$DW$86, DW_AT_location[DW_OP_reg22]
;----------------------------------------------------------------------
; 298 | int nml_fn_call (fptr fn, void *arg1, void *arg2, void *arg3)          
;----------------------------------------------------------------------

;******************************************************************************
;* FUNCTION NAME: nml_fn_call                                                 *
;*                                                                            *
;*   Regs Modified     : A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,B0,B1,B2,B3,B4,B5,B6,  *
;*                           B7,B8,B9,SP,A16,A17,A18,A19,A20,A21,A22,A23,A24, *
;*                           A25,A26,A27,A28,A29,A30,A31,B16,B17,B18,B19,B20, *
;*                           B21,B22,B23,B24,B25,B26,B27,B28,B29,B30,B31      *
;*   Regs Used         : A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,B0,B1,B2,B3,B4,B5,B6,  *
;*                           B7,B8,B9,DP,SP,A16,A17,A18,A19,A20,A21,A22,A23,  *
;*                           A24,A25,A26,A27,A28,A29,A30,A31,B16,B17,B18,B19, *
;*                           B20,B21,B22,B23,B24,B25,B26,B27,B28,B29,B30,B31  *
;*   Local Frame Size  : 0 Args + 16 Auto + 4 Save = 20 byte                  *
;******************************************************************************
nml_fn_call:
;** --------------------------------------------------------------------------*
	.dwcfi	cfa_offset, 0
           STW     .D2T2   B3,*SP--(24)      ; |299| 
	.dwcfi	cfa_offset, 24
	.dwcfi	save_reg_to_mem, 19, 0
$C$DW$87	.dwtag  DW_TAG_variable, DW_AT_name("fn")
	.dwattr $C$DW$87, DW_AT_TI_symbol_name("fn")
	.dwattr $C$DW$87, DW_AT_type(*$C$DW$T$24)
	.dwattr $C$DW$87, DW_AT_location[DW_OP_breg31 4]
$C$DW$88	.dwtag  DW_TAG_variable, DW_AT_name("arg1")
	.dwattr $C$DW$88, DW_AT_TI_symbol_name("arg1")
	.dwattr $C$DW$88, DW_AT_type(*$C$DW$T$3)
	.dwattr $C$DW$88, DW_AT_location[DW_OP_breg31 8]
$C$DW$89	.dwtag  DW_TAG_variable, DW_AT_name("arg2")
	.dwattr $C$DW$89, DW_AT_TI_symbol_name("arg2")
	.dwattr $C$DW$89, DW_AT_type(*$C$DW$T$3)
	.dwattr $C$DW$89, DW_AT_location[DW_OP_breg31 12]
$C$DW$90	.dwtag  DW_TAG_variable, DW_AT_name("arg3")
	.dwattr $C$DW$90, DW_AT_TI_symbol_name("arg3")
	.dwattr $C$DW$90, DW_AT_type(*$C$DW$T$3)
	.dwattr $C$DW$90, DW_AT_location[DW_OP_breg31 16]
           STW     .D2T2   B6,*+SP(16)       ; |299| 
           STW     .D2T1   A6,*+SP(12)       ; |299| 
           STW     .D2T2   B4,*+SP(8)        ; |299| 
           STW     .D2T1   A4,*+SP(4)        ; |299| 
	.dwpsn	file "../src/nml_ar_utils.c",line 300,column 2,is_stmt,isa 0
;----------------------------------------------------------------------
; 300 | (*fn)(arg1, arg2, arg3);                                               
;----------------------------------------------------------------------
           MV      .L2X    A4,B5
$C$DW$91	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$91, DW_AT_low_pc(0x00)
	.dwattr $C$DW$91, DW_AT_TI_call
	.dwattr $C$DW$91, DW_AT_TI_indirect
           CALL    .S2     B5                ; |300| 
           LDW     .D2T1   *+SP(8),A4        ; |300| 
           ADDKPC  .S2     $C$RL3,B3,2       ; |300| 

           MV      .L2X    A6,B4
||         MV      .L1X    B6,A6

$C$RL3:    ; CALL OCCURS {B5} {0}            ; |300| 
	.dwpsn	file "../src/nml_ar_utils.c",line 301,column 2,is_stmt,isa 0
;----------------------------------------------------------------------
; 301 | return 0;                                                              
;----------------------------------------------------------------------
           ZERO    .L1     A4                ; |301| 
	.dwpsn	file "../src/nml_ar_utils.c",line 302,column 1,is_stmt,isa 0
           LDW     .D2T2   *++SP(24),B3      ; |302| 
           NOP             4
	.dwcfi	cfa_offset, 0
	.dwcfi	restore_reg, 19
	.dwcfi	cfa_offset, 0
$C$DW$92	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$92, DW_AT_low_pc(0x00)
	.dwattr $C$DW$92, DW_AT_TI_return
           RETNOP  .S2     B3,5              ; |302| 
           ; BRANCH OCCURS {B3}              ; |302| 
	.dwattr $C$DW$82, DW_AT_TI_end_file("../src/nml_ar_utils.c")
	.dwattr $C$DW$82, DW_AT_TI_end_line(0x12e)
	.dwattr $C$DW$82, DW_AT_TI_end_column(0x01)
	.dwendentry
	.dwendtag $C$DW$82

	.sect	".text"
	.clink
	.global	nml_upd_status

$C$DW$93	.dwtag  DW_TAG_subprogram, DW_AT_name("nml_upd_status")
	.dwattr $C$DW$93, DW_AT_low_pc(nml_upd_status)
	.dwattr $C$DW$93, DW_AT_high_pc(0x00)
	.dwattr $C$DW$93, DW_AT_TI_symbol_name("nml_upd_status")
	.dwattr $C$DW$93, DW_AT_external
	.dwattr $C$DW$93, DW_AT_type(*$C$DW$T$10)
	.dwattr $C$DW$93, DW_AT_TI_begin_file("../src/nml_ar_utils.c")
	.dwattr $C$DW$93, DW_AT_TI_begin_line(0x134)
	.dwattr $C$DW$93, DW_AT_TI_begin_column(0x05)
	.dwattr $C$DW$93, DW_AT_decl_file("../src/nml_ar_utils.c")
	.dwattr $C$DW$93, DW_AT_decl_line(0x134)
	.dwattr $C$DW$93, DW_AT_decl_column(0x05)
	.dwattr $C$DW$93, DW_AT_TI_max_frame_size(0x08)
	.dwpsn	file "../src/nml_ar_utils.c",line 309,column 1,is_stmt,address nml_upd_status,isa 0

	.dwfde $C$DW$CIE, nml_upd_status
$C$DW$94	.dwtag  DW_TAG_formal_parameter, DW_AT_name("status")
	.dwattr $C$DW$94, DW_AT_TI_symbol_name("status")
	.dwattr $C$DW$94, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$94, DW_AT_location[DW_OP_reg4]
;----------------------------------------------------------------------
; 308 | int nml_upd_status (unsigned int status)                               
;----------------------------------------------------------------------

;******************************************************************************
;* FUNCTION NAME: nml_upd_status                                              *
;*                                                                            *
;*   Regs Modified     : A3,A4,B3,B4,B5,B6,SP                                 *
;*   Regs Used         : A3,A4,B3,B4,B5,B6,SP                                 *
;*   Local Frame Size  : 0 Args + 4 Auto + 4 Save = 8 byte                    *
;******************************************************************************
nml_upd_status:
;** --------------------------------------------------------------------------*
	.dwcfi	cfa_offset, 0
           STW     .D2T2   B3,*SP--(8)       ; |309| 
	.dwcfi	cfa_offset, 8
	.dwcfi	save_reg_to_mem, 19, 0
$C$DW$95	.dwtag  DW_TAG_variable, DW_AT_name("status")
	.dwattr $C$DW$95, DW_AT_TI_symbol_name("status")
	.dwattr $C$DW$95, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$95, DW_AT_location[DW_OP_breg31 4]
           STW     .D2T1   A4,*+SP(4)        ; |309| 
	.dwpsn	file "../src/nml_ar_utils.c",line 310,column 2,is_stmt,isa 0
;----------------------------------------------------------------------
; 310 | nml_boot_status[DNUM] = status;                                        
;----------------------------------------------------------------------
           MVC     .S2     DNUM,B5           ; |310| 
           MVKL    .S2     nml_boot_status,B6

           MVKH    .S2     nml_boot_status,B6
||         MV      .L2X    A4,B4             ; |310| 

           STW     .D2T2   B4,*+B6[B5]       ; |310| 
	.dwpsn	file "../src/nml_ar_utils.c",line 312,column 5,is_stmt,isa 0
;----------------------------------------------------------------------
; 312 | nml_wbinv_cache_block(&nml_boot_status[DNUM], 1);                      
;----------------------------------------------------------------------
           MVC     .S2     DNUM,B4           ; |312| 
           MVKL    .S1     nml_wbinv_cache_block,A3
           MVKH    .S1     nml_wbinv_cache_block,A3
           MV      .L2     B6,B5             ; |312| 
$C$DW$96	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$96, DW_AT_low_pc(0x00)
	.dwattr $C$DW$96, DW_AT_name("nml_wbinv_cache_block")
	.dwattr $C$DW$96, DW_AT_TI_call
           CALL    .S2X    A3                ; |312| 
           ADDAW   .D2     B5,B4,B5          ; |312| 
           ADDKPC  .S2     $C$RL4,B3,2       ; |312| 

           MV      .L1X    B5,A4             ; |312| 
||         MVK     .L2     0x1,B4            ; |312| 

$C$RL4:    ; CALL OCCURS {nml_wbinv_cache_block} {0}  ; |312| 
	.dwpsn	file "../src/nml_ar_utils.c",line 313,column 2,is_stmt,isa 0
;----------------------------------------------------------------------
; 313 | return 0;                                                              
;----------------------------------------------------------------------
           ZERO    .L1     A4                ; |313| 
	.dwpsn	file "../src/nml_ar_utils.c",line 314,column 1,is_stmt,isa 0
           LDW     .D2T2   *++SP(8),B3       ; |314| 
           NOP             4
	.dwcfi	cfa_offset, 0
	.dwcfi	restore_reg, 19
	.dwcfi	cfa_offset, 0
$C$DW$97	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$97, DW_AT_low_pc(0x00)
	.dwattr $C$DW$97, DW_AT_TI_return
           RETNOP  .S2     B3,5              ; |314| 
           ; BRANCH OCCURS {B3}              ; |314| 
	.dwattr $C$DW$93, DW_AT_TI_end_file("../src/nml_ar_utils.c")
	.dwattr $C$DW$93, DW_AT_TI_end_line(0x13a)
	.dwattr $C$DW$93, DW_AT_TI_end_column(0x01)
	.dwendentry
	.dwendtag $C$DW$93

;*****************************************************************************
;* UNDEFINED EXTERNAL REFERENCES                                             *
;*****************************************************************************
	.global	nml_boot_status
	.global	nml_mpax_seg_idx

;******************************************************************************
;* BUILD ATTRIBUTES                                                           *
;******************************************************************************
	.battr "TI", Tag_File, 1, Tag_Long_Precision_Bits(2)
	.battr "TI", Tag_File, 1, Tag_Bitfield_layout(2)
	.battr "TI", Tag_File, 1, Tag_ABI_enum_size(3)
	.battr "c6xabi", Tag_File, 1, Tag_ABI_wchar_t(1)
	.battr "c6xabi", Tag_File, 1, Tag_ABI_array_object_alignment(0)
	.battr "c6xabi", Tag_File, 1, Tag_ABI_array_object_align_expected(0)
	.battr "c6xabi", Tag_File, 1, Tag_ABI_PIC(0)
	.battr "c6xabi", Tag_File, 1, Tag_ABI_PID(0)
	.battr "c6xabi", Tag_File, 1, Tag_ABI_DSBT(0)
	.battr "c6xabi", Tag_File, 1, Tag_ABI_stack_align_needed(0)
	.battr "c6xabi", Tag_File, 1, Tag_ABI_stack_align_preserved(0)
	.battr "TI", Tag_File, 1, Tag_Tramps_Use_SOC(1)

;******************************************************************************
;* TYPE INFORMATION                                                           *
;******************************************************************************
$C$DW$T$2	.dwtag  DW_TAG_unspecified_type
	.dwattr $C$DW$T$2, DW_AT_name("void")
$C$DW$T$3	.dwtag  DW_TAG_pointer_type
	.dwattr $C$DW$T$3, DW_AT_type(*$C$DW$T$2)
	.dwattr $C$DW$T$3, DW_AT_address_class(0x20)

$C$DW$T$22	.dwtag  DW_TAG_subroutine_type
	.dwattr $C$DW$T$22, DW_AT_language(DW_LANG_C)
$C$DW$98	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$98, DW_AT_type(*$C$DW$T$3)
$C$DW$99	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$99, DW_AT_type(*$C$DW$T$3)
$C$DW$100	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$100, DW_AT_type(*$C$DW$T$3)
	.dwendtag $C$DW$T$22

$C$DW$T$23	.dwtag  DW_TAG_pointer_type
	.dwattr $C$DW$T$23, DW_AT_type(*$C$DW$T$22)
	.dwattr $C$DW$T$23, DW_AT_address_class(0x20)
$C$DW$T$24	.dwtag  DW_TAG_typedef, DW_AT_name("fptr")
	.dwattr $C$DW$T$24, DW_AT_type(*$C$DW$T$23)
	.dwattr $C$DW$T$24, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$24, DW_AT_decl_file("../src/nml_ar_utils.h")
	.dwattr $C$DW$T$24, DW_AT_decl_line(0x4a)
	.dwattr $C$DW$T$24, DW_AT_decl_column(0x10)
$C$DW$T$4	.dwtag  DW_TAG_base_type
	.dwattr $C$DW$T$4, DW_AT_encoding(DW_ATE_boolean)
	.dwattr $C$DW$T$4, DW_AT_name("bool")
	.dwattr $C$DW$T$4, DW_AT_byte_size(0x01)
$C$DW$T$5	.dwtag  DW_TAG_base_type
	.dwattr $C$DW$T$5, DW_AT_encoding(DW_ATE_signed_char)
	.dwattr $C$DW$T$5, DW_AT_name("signed char")
	.dwattr $C$DW$T$5, DW_AT_byte_size(0x01)
$C$DW$T$6	.dwtag  DW_TAG_base_type
	.dwattr $C$DW$T$6, DW_AT_encoding(DW_ATE_unsigned_char)
	.dwattr $C$DW$T$6, DW_AT_name("unsigned char")
	.dwattr $C$DW$T$6, DW_AT_byte_size(0x01)

$C$DW$T$25	.dwtag  DW_TAG_array_type
	.dwattr $C$DW$T$25, DW_AT_type(*$C$DW$T$6)
	.dwattr $C$DW$T$25, DW_AT_language(DW_LANG_C)
$C$DW$101	.dwtag  DW_TAG_subrange_type
	.dwendtag $C$DW$T$25

$C$DW$T$26	.dwtag  DW_TAG_pointer_type
	.dwattr $C$DW$T$26, DW_AT_type(*$C$DW$T$6)
	.dwattr $C$DW$T$26, DW_AT_address_class(0x20)
$C$DW$T$7	.dwtag  DW_TAG_base_type
	.dwattr $C$DW$T$7, DW_AT_encoding(DW_ATE_signed_char)
	.dwattr $C$DW$T$7, DW_AT_name("wchar_t")
	.dwattr $C$DW$T$7, DW_AT_byte_size(0x02)
$C$DW$T$8	.dwtag  DW_TAG_base_type
	.dwattr $C$DW$T$8, DW_AT_encoding(DW_ATE_signed)
	.dwattr $C$DW$T$8, DW_AT_name("short")
	.dwattr $C$DW$T$8, DW_AT_byte_size(0x02)
$C$DW$T$9	.dwtag  DW_TAG_base_type
	.dwattr $C$DW$T$9, DW_AT_encoding(DW_ATE_unsigned)
	.dwattr $C$DW$T$9, DW_AT_name("unsigned short")
	.dwattr $C$DW$T$9, DW_AT_byte_size(0x02)
$C$DW$T$10	.dwtag  DW_TAG_base_type
	.dwattr $C$DW$T$10, DW_AT_encoding(DW_ATE_signed)
	.dwattr $C$DW$T$10, DW_AT_name("int")
	.dwattr $C$DW$T$10, DW_AT_byte_size(0x04)
$C$DW$T$11	.dwtag  DW_TAG_base_type
	.dwattr $C$DW$T$11, DW_AT_encoding(DW_ATE_unsigned)
	.dwattr $C$DW$T$11, DW_AT_name("unsigned int")
	.dwattr $C$DW$T$11, DW_AT_byte_size(0x04)

$C$DW$T$37	.dwtag  DW_TAG_array_type
	.dwattr $C$DW$T$37, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$T$37, DW_AT_language(DW_LANG_C)
$C$DW$102	.dwtag  DW_TAG_subrange_type
	.dwendtag $C$DW$T$37

$C$DW$T$38	.dwtag  DW_TAG_pointer_type
	.dwattr $C$DW$T$38, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$T$38, DW_AT_address_class(0x20)
$C$DW$T$12	.dwtag  DW_TAG_base_type
	.dwattr $C$DW$T$12, DW_AT_encoding(DW_ATE_signed)
	.dwattr $C$DW$T$12, DW_AT_name("__int40_t")
	.dwattr $C$DW$T$12, DW_AT_byte_size(0x08)
	.dwattr $C$DW$T$12, DW_AT_bit_size(0x28)
	.dwattr $C$DW$T$12, DW_AT_bit_offset(0x18)
$C$DW$T$13	.dwtag  DW_TAG_base_type
	.dwattr $C$DW$T$13, DW_AT_encoding(DW_ATE_unsigned)
	.dwattr $C$DW$T$13, DW_AT_name("unsigned __int40_t")
	.dwattr $C$DW$T$13, DW_AT_byte_size(0x08)
	.dwattr $C$DW$T$13, DW_AT_bit_size(0x28)
	.dwattr $C$DW$T$13, DW_AT_bit_offset(0x18)
$C$DW$T$14	.dwtag  DW_TAG_base_type
	.dwattr $C$DW$T$14, DW_AT_encoding(DW_ATE_signed)
	.dwattr $C$DW$T$14, DW_AT_name("long long")
	.dwattr $C$DW$T$14, DW_AT_byte_size(0x08)
$C$DW$T$15	.dwtag  DW_TAG_base_type
	.dwattr $C$DW$T$15, DW_AT_encoding(DW_ATE_unsigned)
	.dwattr $C$DW$T$15, DW_AT_name("unsigned long long")
	.dwattr $C$DW$T$15, DW_AT_byte_size(0x08)
$C$DW$T$16	.dwtag  DW_TAG_base_type
	.dwattr $C$DW$T$16, DW_AT_encoding(DW_ATE_float)
	.dwattr $C$DW$T$16, DW_AT_name("float")
	.dwattr $C$DW$T$16, DW_AT_byte_size(0x04)
$C$DW$T$17	.dwtag  DW_TAG_base_type
	.dwattr $C$DW$T$17, DW_AT_encoding(DW_ATE_float)
	.dwattr $C$DW$T$17, DW_AT_name("double")
	.dwattr $C$DW$T$17, DW_AT_byte_size(0x08)
$C$DW$T$18	.dwtag  DW_TAG_base_type
	.dwattr $C$DW$T$18, DW_AT_encoding(DW_ATE_float)
	.dwattr $C$DW$T$18, DW_AT_name("long double")
	.dwattr $C$DW$T$18, DW_AT_byte_size(0x08)

$C$DW$T$19	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$19, DW_AT_name("mal_lib_activationRecord_s")
	.dwattr $C$DW$T$19, DW_AT_byte_size(0x14)
$C$DW$103	.dwtag  DW_TAG_member
	.dwattr $C$DW$103, DW_AT_type(*$C$DW$T$10)
	.dwattr $C$DW$103, DW_AT_name("opcode")
	.dwattr $C$DW$103, DW_AT_TI_symbol_name("opcode")
	.dwattr $C$DW$103, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$103, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$103, DW_AT_decl_file("../../mal/malLib/include/mal_lib_activation_record.h")
	.dwattr $C$DW$103, DW_AT_decl_line(0x49)
	.dwattr $C$DW$103, DW_AT_decl_column(0x06)
$C$DW$104	.dwtag  DW_TAG_member
	.dwattr $C$DW$104, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$104, DW_AT_name("arg1")
	.dwattr $C$DW$104, DW_AT_TI_symbol_name("arg1")
	.dwattr $C$DW$104, DW_AT_data_member_location[DW_OP_plus_uconst 0x4]
	.dwattr $C$DW$104, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$104, DW_AT_decl_file("../../mal/malLib/include/mal_lib_activation_record.h")
	.dwattr $C$DW$104, DW_AT_decl_line(0x4a)
	.dwattr $C$DW$104, DW_AT_decl_column(0x0f)
$C$DW$105	.dwtag  DW_TAG_member
	.dwattr $C$DW$105, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$105, DW_AT_name("arg2")
	.dwattr $C$DW$105, DW_AT_TI_symbol_name("arg2")
	.dwattr $C$DW$105, DW_AT_data_member_location[DW_OP_plus_uconst 0x8]
	.dwattr $C$DW$105, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$105, DW_AT_decl_file("../../mal/malLib/include/mal_lib_activation_record.h")
	.dwattr $C$DW$105, DW_AT_decl_line(0x4b)
	.dwattr $C$DW$105, DW_AT_decl_column(0x0f)
$C$DW$106	.dwtag  DW_TAG_member
	.dwattr $C$DW$106, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$106, DW_AT_name("arg3")
	.dwattr $C$DW$106, DW_AT_TI_symbol_name("arg3")
	.dwattr $C$DW$106, DW_AT_data_member_location[DW_OP_plus_uconst 0xc]
	.dwattr $C$DW$106, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$106, DW_AT_decl_file("../../mal/malLib/include/mal_lib_activation_record.h")
	.dwattr $C$DW$106, DW_AT_decl_line(0x4c)
	.dwattr $C$DW$106, DW_AT_decl_column(0x0f)
$C$DW$107	.dwtag  DW_TAG_member
	.dwattr $C$DW$107, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$107, DW_AT_name("arg4")
	.dwattr $C$DW$107, DW_AT_TI_symbol_name("arg4")
	.dwattr $C$DW$107, DW_AT_data_member_location[DW_OP_plus_uconst 0x10]
	.dwattr $C$DW$107, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$107, DW_AT_decl_file("../../mal/malLib/include/mal_lib_activation_record.h")
	.dwattr $C$DW$107, DW_AT_decl_line(0x4d)
	.dwattr $C$DW$107, DW_AT_decl_column(0x0f)
	.dwendtag $C$DW$T$19

	.dwattr $C$DW$T$19, DW_AT_decl_file("../../mal/malLib/include/mal_lib_activation_record.h")
	.dwattr $C$DW$T$19, DW_AT_decl_line(0x47)
	.dwattr $C$DW$T$19, DW_AT_decl_column(0x10)
$C$DW$T$39	.dwtag  DW_TAG_typedef, DW_AT_name("mal_lib_activationRecord_t")
	.dwattr $C$DW$T$39, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$T$39, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$39, DW_AT_decl_file("../../mal/malLib/include/mal_lib_activation_record.h")
	.dwattr $C$DW$T$39, DW_AT_decl_line(0x4e)
	.dwattr $C$DW$T$39, DW_AT_decl_column(0x03)
	.dwattr $C$DW$CU, DW_AT_language(DW_LANG_C)

;***************************************************************
;* DWARF CIE ENTRIES                                           *
;***************************************************************

$C$DW$CIE	.dwcie 19
	.dwcfi	cfa_register, 31
	.dwcfi	cfa_offset, 0
	.dwcfi	undefined, 0
	.dwcfi	undefined, 1
	.dwcfi	undefined, 2
	.dwcfi	undefined, 3
	.dwcfi	undefined, 4
	.dwcfi	undefined, 5
	.dwcfi	undefined, 6
	.dwcfi	undefined, 7
	.dwcfi	undefined, 8
	.dwcfi	undefined, 9
	.dwcfi	same_value, 10
	.dwcfi	same_value, 11
	.dwcfi	same_value, 12
	.dwcfi	same_value, 13
	.dwcfi	same_value, 14
	.dwcfi	same_value, 15
	.dwcfi	undefined, 16
	.dwcfi	undefined, 17
	.dwcfi	undefined, 18
	.dwcfi	undefined, 19
	.dwcfi	undefined, 20
	.dwcfi	undefined, 21
	.dwcfi	undefined, 22
	.dwcfi	undefined, 23
	.dwcfi	undefined, 24
	.dwcfi	undefined, 25
	.dwcfi	same_value, 26
	.dwcfi	same_value, 27
	.dwcfi	same_value, 28
	.dwcfi	same_value, 29
	.dwcfi	same_value, 30
	.dwcfi	same_value, 31
	.dwcfi	same_value, 32
	.dwcfi	undefined, 33
	.dwcfi	undefined, 34
	.dwcfi	undefined, 35
	.dwcfi	undefined, 36
	.dwcfi	undefined, 37
	.dwcfi	undefined, 38
	.dwcfi	undefined, 39
	.dwcfi	undefined, 40
	.dwcfi	undefined, 41
	.dwcfi	undefined, 42
	.dwcfi	undefined, 43
	.dwcfi	undefined, 44
	.dwcfi	undefined, 45
	.dwcfi	undefined, 46
	.dwcfi	undefined, 47
	.dwcfi	undefined, 48
	.dwcfi	undefined, 49
	.dwcfi	undefined, 50
	.dwcfi	undefined, 51
	.dwcfi	undefined, 52
	.dwcfi	undefined, 53
	.dwcfi	undefined, 54
	.dwcfi	undefined, 55
	.dwcfi	undefined, 56
	.dwcfi	undefined, 57
	.dwcfi	undefined, 58
	.dwcfi	undefined, 59
	.dwcfi	undefined, 60
	.dwcfi	undefined, 61
	.dwcfi	undefined, 62
	.dwcfi	undefined, 63
	.dwcfi	undefined, 64
	.dwcfi	undefined, 65
	.dwcfi	undefined, 66
	.dwcfi	undefined, 67
	.dwcfi	undefined, 68
	.dwcfi	undefined, 69
	.dwcfi	undefined, 70
	.dwcfi	undefined, 71
	.dwcfi	undefined, 72
	.dwcfi	undefined, 73
	.dwcfi	undefined, 74
	.dwcfi	undefined, 75
	.dwcfi	undefined, 76
	.dwcfi	undefined, 77
	.dwcfi	undefined, 78
	.dwcfi	undefined, 79
	.dwcfi	undefined, 80
	.dwcfi	undefined, 81
	.dwcfi	undefined, 82
	.dwcfi	undefined, 83
	.dwcfi	undefined, 84
	.dwcfi	undefined, 85
	.dwcfi	undefined, 86
	.dwcfi	undefined, 87
	.dwcfi	undefined, 88
	.dwcfi	undefined, 89
	.dwcfi	undefined, 90
	.dwcfi	undefined, 91
	.dwcfi	undefined, 92
	.dwcfi	undefined, 93
	.dwcfi	undefined, 94
	.dwcfi	undefined, 95
	.dwcfi	undefined, 96
	.dwcfi	undefined, 97
	.dwcfi	undefined, 98
	.dwcfi	undefined, 99
	.dwcfi	undefined, 100
	.dwcfi	undefined, 101
	.dwcfi	undefined, 102
	.dwcfi	undefined, 103
	.dwcfi	undefined, 104
	.dwcfi	undefined, 105
	.dwcfi	undefined, 106
	.dwcfi	undefined, 107
	.dwcfi	undefined, 108
	.dwcfi	undefined, 109
	.dwcfi	undefined, 110
	.dwcfi	undefined, 111
	.dwcfi	undefined, 112
	.dwcfi	undefined, 113
	.dwcfi	undefined, 114
	.dwcfi	undefined, 115
	.dwcfi	undefined, 116
	.dwcfi	undefined, 117
	.dwcfi	undefined, 118
	.dwcfi	undefined, 119
	.dwcfi	undefined, 120
	.dwcfi	undefined, 121
	.dwcfi	undefined, 122
	.dwcfi	undefined, 123
	.dwcfi	undefined, 124
	.dwcfi	undefined, 125
	.dwcfi	undefined, 126
	.dwcfi	undefined, 127
	.dwendentry
	.dwendtag $C$DW$CU

