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
	.dwattr $C$DW$CU, DW_AT_name("../src/nml_loader.c")
	.dwattr $C$DW$CU, DW_AT_producer("TI TMS320C6x C/C++ Codegen Unix v7.4.0 Copyright (c) 1996-2012 Texas Instruments Incorporated")
	.dwattr $C$DW$CU, DW_AT_TI_version(0x01)
	.dwattr $C$DW$CU, DW_AT_comp_dir("/home/gtbldadm/ti/mcsdk_2_01_02_06/tools/boot_loader/mad-utils/mad-loader/nmlLoader/build")

$C$DW$1	.dwtag  DW_TAG_subprogram, DW_AT_name("nml_mem_cpy")
	.dwattr $C$DW$1, DW_AT_TI_symbol_name("nml_mem_cpy")
	.dwattr $C$DW$1, DW_AT_type(*$C$DW$T$10)
	.dwattr $C$DW$1, DW_AT_declaration
	.dwattr $C$DW$1, DW_AT_external
	.dwattr $C$DW$1, DW_AT_decl_file("../src/nml_ar_utils.h")
	.dwattr $C$DW$1, DW_AT_decl_line(0x31)
	.dwattr $C$DW$1, DW_AT_decl_column(0x05)
$C$DW$2	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$2, DW_AT_type(*$C$DW$T$3)
$C$DW$3	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$3, DW_AT_type(*$C$DW$T$3)
$C$DW$4	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$4, DW_AT_type(*$C$DW$T$11)
	.dwendtag $C$DW$1


$C$DW$5	.dwtag  DW_TAG_subprogram, DW_AT_name("nml_mem_set")
	.dwattr $C$DW$5, DW_AT_TI_symbol_name("nml_mem_set")
	.dwattr $C$DW$5, DW_AT_type(*$C$DW$T$10)
	.dwattr $C$DW$5, DW_AT_declaration
	.dwattr $C$DW$5, DW_AT_external
	.dwattr $C$DW$5, DW_AT_decl_file("../src/nml_ar_utils.h")
	.dwattr $C$DW$5, DW_AT_decl_line(0x37)
	.dwattr $C$DW$5, DW_AT_decl_column(0x05)
$C$DW$6	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$6, DW_AT_type(*$C$DW$T$3)
$C$DW$7	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$7, DW_AT_type(*$C$DW$T$11)
$C$DW$8	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$8, DW_AT_type(*$C$DW$T$11)
	.dwendtag $C$DW$5


$C$DW$9	.dwtag  DW_TAG_subprogram, DW_AT_name("nml_mem_map_set")
	.dwattr $C$DW$9, DW_AT_TI_symbol_name("nml_mem_map_set")
	.dwattr $C$DW$9, DW_AT_type(*$C$DW$T$10)
	.dwattr $C$DW$9, DW_AT_declaration
	.dwattr $C$DW$9, DW_AT_external
	.dwattr $C$DW$9, DW_AT_decl_file("../src/nml_ar_utils.h")
	.dwattr $C$DW$9, DW_AT_decl_line(0x3d)
	.dwattr $C$DW$9, DW_AT_decl_column(0x05)
$C$DW$10	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$10, DW_AT_type(*$C$DW$T$11)
$C$DW$11	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$11, DW_AT_type(*$C$DW$T$11)
$C$DW$12	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$12, DW_AT_type(*$C$DW$T$11)
$C$DW$13	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$13, DW_AT_type(*$C$DW$T$11)
	.dwendtag $C$DW$9


$C$DW$14	.dwtag  DW_TAG_subprogram, DW_AT_name("nml_mem_attr_set")
	.dwattr $C$DW$14, DW_AT_TI_symbol_name("nml_mem_attr_set")
	.dwattr $C$DW$14, DW_AT_type(*$C$DW$T$10)
	.dwattr $C$DW$14, DW_AT_declaration
	.dwattr $C$DW$14, DW_AT_external
	.dwattr $C$DW$14, DW_AT_decl_file("../src/nml_ar_utils.h")
	.dwattr $C$DW$14, DW_AT_decl_line(0x44)
	.dwattr $C$DW$14, DW_AT_decl_column(0x05)
$C$DW$15	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$15, DW_AT_type(*$C$DW$T$11)
$C$DW$16	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$16, DW_AT_type(*$C$DW$T$11)
$C$DW$17	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$17, DW_AT_type(*$C$DW$T$11)
	.dwendtag $C$DW$14


$C$DW$18	.dwtag  DW_TAG_subprogram, DW_AT_name("nml_fn_call")
	.dwattr $C$DW$18, DW_AT_TI_symbol_name("nml_fn_call")
	.dwattr $C$DW$18, DW_AT_type(*$C$DW$T$10)
	.dwattr $C$DW$18, DW_AT_declaration
	.dwattr $C$DW$18, DW_AT_external
	.dwattr $C$DW$18, DW_AT_decl_file("../src/nml_ar_utils.h")
	.dwattr $C$DW$18, DW_AT_decl_line(0x4b)
	.dwattr $C$DW$18, DW_AT_decl_column(0x05)
$C$DW$19	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$19, DW_AT_type(*$C$DW$T$22)
$C$DW$20	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$20, DW_AT_type(*$C$DW$T$3)
$C$DW$21	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$21, DW_AT_type(*$C$DW$T$3)
$C$DW$22	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$22, DW_AT_type(*$C$DW$T$3)
	.dwendtag $C$DW$18


$C$DW$23	.dwtag  DW_TAG_subprogram, DW_AT_name("nml_upd_status")
	.dwattr $C$DW$23, DW_AT_TI_symbol_name("nml_upd_status")
	.dwattr $C$DW$23, DW_AT_type(*$C$DW$T$10)
	.dwattr $C$DW$23, DW_AT_declaration
	.dwattr $C$DW$23, DW_AT_external
	.dwattr $C$DW$23, DW_AT_decl_file("../src/nml_ar_utils.h")
	.dwattr $C$DW$23, DW_AT_decl_line(0x51)
	.dwattr $C$DW$23, DW_AT_decl_column(0x05)
$C$DW$24	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$24, DW_AT_type(*$C$DW$T$11)
	.dwendtag $C$DW$23

	.global	nml_stack
nml_stack:	.usect	".far",1024,8
$C$DW$25	.dwtag  DW_TAG_variable, DW_AT_name("nml_stack")
	.dwattr $C$DW$25, DW_AT_TI_symbol_name("nml_stack")
	.dwattr $C$DW$25, DW_AT_location[DW_OP_addr nml_stack]
	.dwattr $C$DW$25, DW_AT_type(*$C$DW$T$24)
	.dwattr $C$DW$25, DW_AT_external
	.dwattr $C$DW$25, DW_AT_decl_file("../src/nml_loader.c")
	.dwattr $C$DW$25, DW_AT_decl_line(0x47)
	.dwattr $C$DW$25, DW_AT_decl_column(0x0f)
	.global	nml_ar_data
nml_ar_data:	.usect	".far",4000,8
$C$DW$26	.dwtag  DW_TAG_variable, DW_AT_name("nml_ar_data")
	.dwattr $C$DW$26, DW_AT_TI_symbol_name("nml_ar_data")
	.dwattr $C$DW$26, DW_AT_location[DW_OP_addr nml_ar_data]
	.dwattr $C$DW$26, DW_AT_type(*$C$DW$T$46)
	.dwattr $C$DW$26, DW_AT_external
	.dwattr $C$DW$26, DW_AT_decl_file("../src/nml_loader.c")
	.dwattr $C$DW$26, DW_AT_decl_line(0x49)
	.dwattr $C$DW$26, DW_AT_decl_column(0x1c)
	.global	nml_boot_status
nml_boot_status:	.usect	".far",8,8
$C$DW$27	.dwtag  DW_TAG_variable, DW_AT_name("nml_boot_status")
	.dwattr $C$DW$27, DW_AT_TI_symbol_name("nml_boot_status")
	.dwattr $C$DW$27, DW_AT_location[DW_OP_addr nml_boot_status]
	.dwattr $C$DW$27, DW_AT_type(*$C$DW$T$44)
	.dwattr $C$DW$27, DW_AT_external
	.dwattr $C$DW$27, DW_AT_decl_file("../src/nml_loader.c")
	.dwattr $C$DW$27, DW_AT_decl_line(0x4b)
	.dwattr $C$DW$27, DW_AT_decl_column(0x0e)
	.global	nml_mpax_seg_idx
nml_mpax_seg_idx:	.usect	".far",2,8
$C$DW$28	.dwtag  DW_TAG_variable, DW_AT_name("nml_mpax_seg_idx")
	.dwattr $C$DW$28, DW_AT_TI_symbol_name("nml_mpax_seg_idx")
	.dwattr $C$DW$28, DW_AT_location[DW_OP_addr nml_mpax_seg_idx]
	.dwattr $C$DW$28, DW_AT_type(*$C$DW$T$25)
	.dwattr $C$DW$28, DW_AT_external
	.dwattr $C$DW$28, DW_AT_decl_file("../src/nml_loader.c")
	.dwattr $C$DW$28, DW_AT_decl_line(0x4f)
	.dwattr $C$DW$28, DW_AT_decl_column(0x0f)
	.global	arFnTbl
	.sect	".const:arFnTbl"
	.clink
	.align	8
	.elfsym	arFnTbl,SYM_SIZE(24)
arFnTbl:
	.field	nml_upd_status,32		; arFnTbl[0] @ 0
	.field	nml_mem_map_set,32		; arFnTbl[1] @ 32
	.field	nml_mem_attr_set,32		; arFnTbl[2] @ 64
	.field	nml_mem_cpy,32		; arFnTbl[3] @ 96
	.field	nml_mem_set,32		; arFnTbl[4] @ 128
	.field	nml_fn_call,32		; arFnTbl[5] @ 160

$C$DW$29	.dwtag  DW_TAG_variable, DW_AT_name("arFnTbl")
	.dwattr $C$DW$29, DW_AT_TI_symbol_name("arFnTbl")
	.dwattr $C$DW$29, DW_AT_location[DW_OP_addr arFnTbl]
	.dwattr $C$DW$29, DW_AT_type(*$C$DW$T$35)
	.dwattr $C$DW$29, DW_AT_external
	.dwattr $C$DW$29, DW_AT_decl_file("../src/nml_loader.c")
	.dwattr $C$DW$29, DW_AT_decl_line(0x54)
	.dwattr $C$DW$29, DW_AT_decl_column(0x0a)
;	acpia6x -@/tmp/25342vyBBQ3 
	.sect	".text"
	.clink
	.global	nml_loader

$C$DW$30	.dwtag  DW_TAG_subprogram, DW_AT_name("nml_loader")
	.dwattr $C$DW$30, DW_AT_low_pc(nml_loader)
	.dwattr $C$DW$30, DW_AT_high_pc(0x00)
	.dwattr $C$DW$30, DW_AT_TI_symbol_name("nml_loader")
	.dwattr $C$DW$30, DW_AT_external
	.dwattr $C$DW$30, DW_AT_TI_begin_file("../src/nml_loader.c")
	.dwattr $C$DW$30, DW_AT_TI_begin_line(0x62)
	.dwattr $C$DW$30, DW_AT_TI_begin_column(0x06)
	.dwattr $C$DW$30, DW_AT_decl_file("../src/nml_loader.c")
	.dwattr $C$DW$30, DW_AT_decl_line(0x62)
	.dwattr $C$DW$30, DW_AT_decl_column(0x06)
	.dwattr $C$DW$30, DW_AT_TI_max_frame_size(0x18)
	.dwpsn	file "../src/nml_loader.c",line 99,column 1,is_stmt,address nml_loader,isa 0

	.dwfde $C$DW$CIE, nml_loader
;----------------------------------------------------------------------
;  98 | void nml_loader()                                                      
;----------------------------------------------------------------------

;******************************************************************************
;* FUNCTION NAME: nml_loader                                                  *
;*                                                                            *
;*   Regs Modified     : A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,B0,B1,B2,B3,B4,*
;*                           B5,B6,B7,B8,B9,SP,A16,A17,A18,A19,A20,A21,A22,   *
;*                           A23,A24,A25,A26,A27,A28,A29,A30,A31,B16,B17,B18, *
;*                           B19,B20,B21,B22,B23,B24,B25,B26,B27,B28,B29,B30, *
;*                           B31                                              *
;*   Regs Used         : A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,B0,B1,B2,B3,B4,*
;*                           B5,B6,B7,B8,B9,DP,SP,A16,A17,A18,A19,A20,A21,A22,*
;*                           A23,A24,A25,A26,A27,A28,A29,A30,A31,B16,B17,B18, *
;*                           B19,B20,B21,B22,B23,B24,B25,B26,B27,B28,B29,B30, *
;*                           B31                                              *
;*   Local Frame Size  : 0 Args + 0 Auto + 24 Save = 24 byte                  *
;******************************************************************************
nml_loader:
;** --------------------------------------------------------------------------*
;----------------------------------------------------------------------
; 100 | register mal_lib_activationRecord_t *arp;                              
; 101 | register fp fptr;                                                      
; 103 | #if ((DEVICE==6670) || (DEVICE==6678) || (DEVICE==6657))               
;----------------------------------------------------------------------
	.dwcfi	cfa_offset, 0
           STW     .D2T2   B3,*SP--(8)       ; |99| 
	.dwcfi	cfa_offset, 8
	.dwcfi	save_reg_to_mem, 19, 0
           STDW    .D2T1   A11:A10,*SP--     ; |99| 
	.dwcfi	cfa_offset, 16
	.dwcfi	save_reg_to_mem, 11, -4
	.dwcfi	save_reg_to_mem, 10, -8
$C$DW$31	.dwtag  DW_TAG_variable, DW_AT_name("arp")
	.dwattr $C$DW$31, DW_AT_TI_symbol_name("arp")
	.dwattr $C$DW$31, DW_AT_type(*$C$DW$T$47)
	.dwattr $C$DW$31, DW_AT_location[DW_OP_reg10]
$C$DW$32	.dwtag  DW_TAG_variable, DW_AT_name("fptr")
	.dwattr $C$DW$32, DW_AT_TI_symbol_name("fptr")
	.dwattr $C$DW$32, DW_AT_type(*$C$DW$T$33)
	.dwattr $C$DW$32, DW_AT_location[DW_OP_reg7]
	.dwpsn	file "../src/nml_loader.c",line 105,column 2,is_stmt,isa 0
;----------------------------------------------------------------------
; 105 | nml_mpax_seg_idx[DNUM] = 2;                                            
; 106 | #endif                                                                 
;----------------------------------------------------------------------
           MVKL    .S2     nml_mpax_seg_idx,B6
           MVKH    .S2     nml_mpax_seg_idx,B6
           MVC     .S2     DNUM,B4           ; |105| 
           MVK     .L2     2,B5              ; |105| 
           STB     .D2T2   B5,*+B4[B6]       ; |105| 
	.dwpsn	file "../src/nml_loader.c",line 111,column 2,is_stmt,isa 0
;----------------------------------------------------------------------
; 111 | arp = nml_ar_data;                                                     
;----------------------------------------------------------------------
           MVKL    .S2     nml_ar_data,B4
           MVKH    .S2     nml_ar_data,B4
           NOP             1
           MV      .L1X    B4,A3             ; |111| 
	.dwpsn	file "../src/nml_loader.c",line 112,column 2,is_stmt,isa 0
;----------------------------------------------------------------------
; 112 | arp += (DNUM * MAL_LIB_MAX_AR);                                        
;----------------------------------------------------------------------
           MVC     .S2     DNUM,B4           ; |112| 
           MVK     .S1     2000,A4           ; |112| 
           MPY32   .M1X    A4,B4,A4          ; |112| 
           MVKL    .S1     arFnTbl,A11
           MVKH    .S1     arFnTbl,A11
           NOP             1
           ADD     .L1     A4,A3,A10         ; |112| 
	.dwpsn	file "../src/nml_loader.c",line 114,column 8,is_stmt,isa 0
;----------------------------------------------------------------------
; 114 | while(1) {                                                             
;----------------------------------------------------------------------
;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Software pipelining disabled
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*      Disqualified loop: Bad loop structure
;*----------------------------------------------------------------------------*
$C$L1:    
$C$DW$L$nml_loader$2$B:
	.dwpsn	file "../src/nml_loader.c",line 115,column 3,is_stmt,isa 0
;----------------------------------------------------------------------
; 115 | fptr = arFnTbl[arp->opcode];                                           
;----------------------------------------------------------------------
           LDW     .D1T1   *A10,A3           ; |115| 
           NOP             4
           LDW     .D1T1   *+A11[A3],A7      ; |115| 
           NOP             4
	.dwpsn	file "../src/nml_loader.c",line 116,column 3,is_stmt,isa 0
;----------------------------------------------------------------------
; 116 | (*fptr)(arp->arg1, arp->arg2, arp->arg3, arp->arg4);                   
;----------------------------------------------------------------------
           LDW     .D1T1   *+A10(12),A6      ; |116| 
           LDW     .D1T2   *+A10(8),B4       ; |116| 
$C$DW$33	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$33, DW_AT_low_pc(0x00)
	.dwattr $C$DW$33, DW_AT_TI_call
	.dwattr $C$DW$33, DW_AT_TI_indirect

           CALL    .S2X    A7                ; |116| 
||         LDW     .D1T2   *+A10(16),B6      ; |116| 

           LDW     .D1T1   *+A10(4),A4       ; |116| 
           ADDKPC  .S2     $C$RL0,B3,3       ; |116| 
$C$RL0:    ; CALL OCCURS {A7} {0}            ; |116| 
	.dwpsn	file "../src/nml_loader.c",line 117,column 3,is_stmt,isa 0
;----------------------------------------------------------------------
; 117 | arp++;                                                                 
;----------------------------------------------------------------------
           ADDK    .S1     20,A10            ; |117| 
	.dwpsn	file "../src/nml_loader.c",line 114,column 8,is_stmt,isa 0
           BNOP    .S1     $C$L1,5           ; |114| 
           ; BRANCH OCCURS {$C$L1}           ; |114| 
$C$DW$L$nml_loader$2$E:
;** --------------------------------------------------------------------------*
	.dwcfi	cfa_offset, 8
	.dwcfi	restore_reg, 11
	.dwcfi	restore_reg, 10
	.dwcfi	cfa_offset, 0
	.dwcfi	restore_reg, 19
	.dwcfi	cfa_offset, 0

$C$DW$34	.dwtag  DW_TAG_TI_loop
	.dwattr $C$DW$34, DW_AT_name("/home/gtbldadm/ti/mcsdk_2_01_02_06/tools/boot_loader/mad-utils/mad-loader/nmlLoader/build/nml_loader.asm:$C$L1:1:1353367587")
	.dwattr $C$DW$34, DW_AT_TI_begin_file("../src/nml_loader.c")
	.dwattr $C$DW$34, DW_AT_TI_begin_line(0x72)
	.dwattr $C$DW$34, DW_AT_TI_end_line(0x76)
$C$DW$35	.dwtag  DW_TAG_TI_loop_range
	.dwattr $C$DW$35, DW_AT_low_pc($C$DW$L$nml_loader$2$B)
	.dwattr $C$DW$35, DW_AT_high_pc($C$DW$L$nml_loader$2$E)
	.dwendtag $C$DW$34

	.dwattr $C$DW$30, DW_AT_TI_end_file("../src/nml_loader.c")
	.dwattr $C$DW$30, DW_AT_TI_end_line(0x77)
	.dwattr $C$DW$30, DW_AT_TI_end_column(0x01)
	.dwendentry
	.dwendtag $C$DW$30

;*****************************************************************************
;* UNDEFINED EXTERNAL REFERENCES                                             *
;*****************************************************************************
	.global	nml_mem_cpy
	.global	nml_mem_set
	.global	nml_mem_map_set
	.global	nml_mem_attr_set
	.global	nml_fn_call
	.global	nml_upd_status

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

$C$DW$T$20	.dwtag  DW_TAG_subroutine_type
	.dwattr $C$DW$T$20, DW_AT_language(DW_LANG_C)
$C$DW$36	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$36, DW_AT_type(*$C$DW$T$3)
$C$DW$37	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$37, DW_AT_type(*$C$DW$T$3)
$C$DW$38	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$38, DW_AT_type(*$C$DW$T$3)
	.dwendtag $C$DW$T$20

$C$DW$T$21	.dwtag  DW_TAG_pointer_type
	.dwattr $C$DW$T$21, DW_AT_type(*$C$DW$T$20)
	.dwattr $C$DW$T$21, DW_AT_address_class(0x20)
$C$DW$T$22	.dwtag  DW_TAG_typedef, DW_AT_name("fptr")
	.dwattr $C$DW$T$22, DW_AT_type(*$C$DW$T$21)
	.dwattr $C$DW$T$22, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$22, DW_AT_decl_file("../src/nml_ar_utils.h")
	.dwattr $C$DW$T$22, DW_AT_decl_line(0x4a)
	.dwattr $C$DW$T$22, DW_AT_decl_column(0x10)
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

$C$DW$T$24	.dwtag  DW_TAG_array_type
	.dwattr $C$DW$T$24, DW_AT_type(*$C$DW$T$6)
	.dwattr $C$DW$T$24, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$24, DW_AT_byte_size(0x400)
$C$DW$39	.dwtag  DW_TAG_subrange_type
	.dwattr $C$DW$39, DW_AT_upper_bound(0x3ff)
	.dwendtag $C$DW$T$24


$C$DW$T$25	.dwtag  DW_TAG_array_type
	.dwattr $C$DW$T$25, DW_AT_type(*$C$DW$T$6)
	.dwattr $C$DW$T$25, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$25, DW_AT_byte_size(0x02)
$C$DW$40	.dwtag  DW_TAG_subrange_type
	.dwattr $C$DW$40, DW_AT_upper_bound(0x01)
	.dwendtag $C$DW$T$25

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

$C$DW$T$31	.dwtag  DW_TAG_subroutine_type
	.dwattr $C$DW$T$31, DW_AT_type(*$C$DW$T$10)
	.dwattr $C$DW$T$31, DW_AT_language(DW_LANG_C)
$C$DW$41	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$41, DW_AT_type(*$C$DW$T$11)
$C$DW$42	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$42, DW_AT_type(*$C$DW$T$11)
$C$DW$43	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$43, DW_AT_type(*$C$DW$T$11)
$C$DW$44	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$44, DW_AT_type(*$C$DW$T$11)
	.dwendtag $C$DW$T$31

$C$DW$T$32	.dwtag  DW_TAG_pointer_type
	.dwattr $C$DW$T$32, DW_AT_type(*$C$DW$T$31)
	.dwattr $C$DW$T$32, DW_AT_address_class(0x20)
$C$DW$T$33	.dwtag  DW_TAG_typedef, DW_AT_name("fp")
	.dwattr $C$DW$T$33, DW_AT_type(*$C$DW$T$32)
	.dwattr $C$DW$T$33, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$33, DW_AT_decl_file("../src/nml_loader.c")
	.dwattr $C$DW$T$33, DW_AT_decl_line(0x43)
	.dwattr $C$DW$T$33, DW_AT_decl_column(0x0f)
$C$DW$T$34	.dwtag  DW_TAG_const_type
	.dwattr $C$DW$T$34, DW_AT_type(*$C$DW$T$33)

$C$DW$T$35	.dwtag  DW_TAG_array_type
	.dwattr $C$DW$T$35, DW_AT_type(*$C$DW$T$34)
	.dwattr $C$DW$T$35, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$35, DW_AT_byte_size(0x18)
$C$DW$45	.dwtag  DW_TAG_subrange_type
	.dwattr $C$DW$45, DW_AT_upper_bound(0x05)
	.dwendtag $C$DW$T$35

$C$DW$T$11	.dwtag  DW_TAG_base_type
	.dwattr $C$DW$T$11, DW_AT_encoding(DW_ATE_unsigned)
	.dwattr $C$DW$T$11, DW_AT_name("unsigned int")
	.dwattr $C$DW$T$11, DW_AT_byte_size(0x04)

$C$DW$T$44	.dwtag  DW_TAG_array_type
	.dwattr $C$DW$T$44, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$T$44, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$44, DW_AT_byte_size(0x08)
$C$DW$46	.dwtag  DW_TAG_subrange_type
	.dwattr $C$DW$46, DW_AT_upper_bound(0x01)
	.dwendtag $C$DW$T$44

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
$C$DW$47	.dwtag  DW_TAG_member
	.dwattr $C$DW$47, DW_AT_type(*$C$DW$T$10)
	.dwattr $C$DW$47, DW_AT_name("opcode")
	.dwattr $C$DW$47, DW_AT_TI_symbol_name("opcode")
	.dwattr $C$DW$47, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$47, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$47, DW_AT_decl_file("../../mal/malLib/include/mal_lib_activation_record.h")
	.dwattr $C$DW$47, DW_AT_decl_line(0x49)
	.dwattr $C$DW$47, DW_AT_decl_column(0x06)
$C$DW$48	.dwtag  DW_TAG_member
	.dwattr $C$DW$48, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$48, DW_AT_name("arg1")
	.dwattr $C$DW$48, DW_AT_TI_symbol_name("arg1")
	.dwattr $C$DW$48, DW_AT_data_member_location[DW_OP_plus_uconst 0x4]
	.dwattr $C$DW$48, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$48, DW_AT_decl_file("../../mal/malLib/include/mal_lib_activation_record.h")
	.dwattr $C$DW$48, DW_AT_decl_line(0x4a)
	.dwattr $C$DW$48, DW_AT_decl_column(0x0f)
$C$DW$49	.dwtag  DW_TAG_member
	.dwattr $C$DW$49, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$49, DW_AT_name("arg2")
	.dwattr $C$DW$49, DW_AT_TI_symbol_name("arg2")
	.dwattr $C$DW$49, DW_AT_data_member_location[DW_OP_plus_uconst 0x8]
	.dwattr $C$DW$49, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$49, DW_AT_decl_file("../../mal/malLib/include/mal_lib_activation_record.h")
	.dwattr $C$DW$49, DW_AT_decl_line(0x4b)
	.dwattr $C$DW$49, DW_AT_decl_column(0x0f)
$C$DW$50	.dwtag  DW_TAG_member
	.dwattr $C$DW$50, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$50, DW_AT_name("arg3")
	.dwattr $C$DW$50, DW_AT_TI_symbol_name("arg3")
	.dwattr $C$DW$50, DW_AT_data_member_location[DW_OP_plus_uconst 0xc]
	.dwattr $C$DW$50, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$50, DW_AT_decl_file("../../mal/malLib/include/mal_lib_activation_record.h")
	.dwattr $C$DW$50, DW_AT_decl_line(0x4c)
	.dwattr $C$DW$50, DW_AT_decl_column(0x0f)
$C$DW$51	.dwtag  DW_TAG_member
	.dwattr $C$DW$51, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$51, DW_AT_name("arg4")
	.dwattr $C$DW$51, DW_AT_TI_symbol_name("arg4")
	.dwattr $C$DW$51, DW_AT_data_member_location[DW_OP_plus_uconst 0x10]
	.dwattr $C$DW$51, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$51, DW_AT_decl_file("../../mal/malLib/include/mal_lib_activation_record.h")
	.dwattr $C$DW$51, DW_AT_decl_line(0x4d)
	.dwattr $C$DW$51, DW_AT_decl_column(0x0f)
	.dwendtag $C$DW$T$19

	.dwattr $C$DW$T$19, DW_AT_decl_file("../../mal/malLib/include/mal_lib_activation_record.h")
	.dwattr $C$DW$T$19, DW_AT_decl_line(0x47)
	.dwattr $C$DW$T$19, DW_AT_decl_column(0x10)
$C$DW$T$45	.dwtag  DW_TAG_typedef, DW_AT_name("mal_lib_activationRecord_t")
	.dwattr $C$DW$T$45, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$T$45, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$45, DW_AT_decl_file("../../mal/malLib/include/mal_lib_activation_record.h")
	.dwattr $C$DW$T$45, DW_AT_decl_line(0x4e)
	.dwattr $C$DW$T$45, DW_AT_decl_column(0x03)

$C$DW$T$46	.dwtag  DW_TAG_array_type
	.dwattr $C$DW$T$46, DW_AT_type(*$C$DW$T$45)
	.dwattr $C$DW$T$46, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$46, DW_AT_byte_size(0xfa0)
$C$DW$52	.dwtag  DW_TAG_subrange_type
	.dwattr $C$DW$52, DW_AT_upper_bound(0xc7)
	.dwendtag $C$DW$T$46

$C$DW$T$47	.dwtag  DW_TAG_pointer_type
	.dwattr $C$DW$T$47, DW_AT_type(*$C$DW$T$45)
	.dwattr $C$DW$T$47, DW_AT_address_class(0x20)
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

