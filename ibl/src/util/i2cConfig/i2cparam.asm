;******************************************************************************
;* TMS320C6x C/C++ Codegen                                          PC v7.3.4 *
;* Date/Time created: Thu Nov 02 23:19:14 2017                                *
;******************************************************************************
	.compiler_opts --abi=coffabi --c64p_l1d_workaround=default --endian=little --hll_source=on --long_precision_bits=40 --mem_model:code=far --mem_model:const=data --mem_model:data=far --object_format=coff --predefine_memory_model_macros --silicon_version=6500 --symdebug:dwarf 

;******************************************************************************
;* GLOBAL FILE PARAMETERS                                                     *
;*                                                                            *
;*   Architecture      : TMS320C64x+                                          *
;*   Optimization      : Enabled at level 2                                   *
;*   Optimizing for    : Speed                                                *
;*                       Based on options: -o2, no -ms                        *
;*   Endian            : Little                                               *
;*   Interrupt Thrshld : 200                                                  *
;*   Data Access Model : Far                                                  *
;*   Pipelining        : Enabled                                              *
;*   Speculate Loads   : Enabled with threshold = 0                           *
;*   Memory Aliases    : Presume are aliases (pessimistic)                    *
;*   Debug Info        : DWARF Debug                                          *
;*                                                                            *
;******************************************************************************

	.asg	A15, FP
	.asg	B14, DP
	.asg	B15, SP
	.global	$bss


$C$DW$CU	.dwtag  DW_TAG_compile_unit
	.dwattr $C$DW$CU, DW_AT_producer("TMS320C6x C/C++ Codegen PC v7.3.4 Copyright (c) 1996-2012 Texas Instruments Incorporated")
	.dwattr $C$DW$CU, DW_AT_TI_version(0x01)
	.dwattr $C$DW$CU, DW_AT_comp_dir("D:\workspace\PR6100B\dsp\IBL\ibl\src\util\i2cConfig")
;*****************************************************************************
;* CINIT RECORDS                                                             *
;*****************************************************************************
	.sect	".cinit"
	.align	8
	.field  	4,32
	.field  	_configBusAddress+0,32
	.field	81,32			; _configBusAddress @ 0

	.sect	".cinit"
	.align	8
	.field  	4,32
	.field  	_configAddress+0,32
	.field	1280,32			; _configAddress @ 0


$C$DW$1	.dwtag  DW_TAG_subprogram, DW_AT_name("hwI2Cinit")
	.dwattr $C$DW$1, DW_AT_TI_symbol_name("_hwI2Cinit")
	.dwattr $C$DW$1, DW_AT_declaration
	.dwattr $C$DW$1, DW_AT_external
$C$DW$2	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$2, DW_AT_type(*$C$DW$T$78)
$C$DW$3	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$3, DW_AT_type(*$C$DW$T$78)
$C$DW$4	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$4, DW_AT_type(*$C$DW$T$78)
$C$DW$5	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$5, DW_AT_type(*$C$DW$T$78)
	.dwendtag $C$DW$1


$C$DW$6	.dwtag  DW_TAG_subprogram, DW_AT_name("hwI2cMasterWrite")
	.dwattr $C$DW$6, DW_AT_TI_symbol_name("_hwI2cMasterWrite")
	.dwattr $C$DW$6, DW_AT_type(*$C$DW$T$81)
	.dwattr $C$DW$6, DW_AT_declaration
	.dwattr $C$DW$6, DW_AT_external
$C$DW$7	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$7, DW_AT_type(*$C$DW$T$122)
$C$DW$8	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$8, DW_AT_type(*$C$DW$T$108)
$C$DW$9	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$9, DW_AT_type(*$C$DW$T$122)
$C$DW$10	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$10, DW_AT_type(*$C$DW$T$122)
$C$DW$11	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$11, DW_AT_type(*$C$DW$T$117)
	.dwendtag $C$DW$6


$C$DW$12	.dwtag  DW_TAG_subprogram, DW_AT_name("hwPllSetPll")
	.dwattr $C$DW$12, DW_AT_TI_symbol_name("_hwPllSetPll")
	.dwattr $C$DW$12, DW_AT_type(*$C$DW$T$32)
	.dwattr $C$DW$12, DW_AT_declaration
	.dwattr $C$DW$12, DW_AT_external
$C$DW$13	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$13, DW_AT_type(*$C$DW$T$26)
$C$DW$14	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$14, DW_AT_type(*$C$DW$T$26)
$C$DW$15	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$15, DW_AT_type(*$C$DW$T$26)
$C$DW$16	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$16, DW_AT_type(*$C$DW$T$26)
	.dwendtag $C$DW$12


$C$DW$17	.dwtag  DW_TAG_subprogram, DW_AT_name("memset")
	.dwattr $C$DW$17, DW_AT_TI_symbol_name("_memset")
	.dwattr $C$DW$17, DW_AT_type(*$C$DW$T$3)
	.dwattr $C$DW$17, DW_AT_declaration
	.dwattr $C$DW$17, DW_AT_external
$C$DW$18	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$18, DW_AT_type(*$C$DW$T$3)
$C$DW$19	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$19, DW_AT_type(*$C$DW$T$10)
$C$DW$20	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$20, DW_AT_type(*$C$DW$T$75)
	.dwendtag $C$DW$17


$C$DW$21	.dwtag  DW_TAG_subprogram, DW_AT_name("printf")
	.dwattr $C$DW$21, DW_AT_TI_symbol_name("_printf")
	.dwattr $C$DW$21, DW_AT_type(*$C$DW$T$10)
	.dwattr $C$DW$21, DW_AT_declaration
	.dwattr $C$DW$21, DW_AT_external
$C$DW$22	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$22, DW_AT_type(*$C$DW$T$145)
$C$DW$23	.dwtag  DW_TAG_unspecified_parameters
	.dwendtag $C$DW$21


$C$DW$24	.dwtag  DW_TAG_subprogram, DW_AT_name("sprintf")
	.dwattr $C$DW$24, DW_AT_TI_symbol_name("_sprintf")
	.dwattr $C$DW$24, DW_AT_type(*$C$DW$T$10)
	.dwattr $C$DW$24, DW_AT_declaration
	.dwattr $C$DW$24, DW_AT_external
$C$DW$25	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$25, DW_AT_type(*$C$DW$T$82)
$C$DW$26	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$26, DW_AT_type(*$C$DW$T$145)
$C$DW$27	.dwtag  DW_TAG_unspecified_parameters
	.dwendtag $C$DW$24


$C$DW$28	.dwtag  DW_TAG_subprogram, DW_AT_name("getchar")
	.dwattr $C$DW$28, DW_AT_TI_symbol_name("_getchar")
	.dwattr $C$DW$28, DW_AT_type(*$C$DW$T$10)
	.dwattr $C$DW$28, DW_AT_declaration
	.dwattr $C$DW$28, DW_AT_external
	.global	_ibl
_ibl:	.usect	".far",748,4
$C$DW$29	.dwtag  DW_TAG_variable, DW_AT_name("ibl")
	.dwattr $C$DW$29, DW_AT_TI_symbol_name("_ibl")
	.dwattr $C$DW$29, DW_AT_location[DW_OP_addr _ibl]
	.dwattr $C$DW$29, DW_AT_type(*$C$DW$T$164)
	.dwattr $C$DW$29, DW_AT_external
	.global	_configBusAddress
_configBusAddress:	.usect	".far",4,4
$C$DW$30	.dwtag  DW_TAG_variable, DW_AT_name("configBusAddress")
	.dwattr $C$DW$30, DW_AT_TI_symbol_name("_configBusAddress")
	.dwattr $C$DW$30, DW_AT_location[DW_OP_addr _configBusAddress]
	.dwattr $C$DW$30, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$30, DW_AT_external
	.global	_configAddress
_configAddress:	.usect	".far",4,4
$C$DW$31	.dwtag  DW_TAG_variable, DW_AT_name("configAddress")
	.dwattr $C$DW$31, DW_AT_TI_symbol_name("_configAddress")
	.dwattr $C$DW$31, DW_AT_location[DW_OP_addr _configAddress]
	.dwattr $C$DW$31, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$31, DW_AT_external
;	D:\App\CCS5.2.1.00018\ccsv5\tools\compiler\c6000_7.3.4\bin\opt6x.exe D:\\Tools\\msys32\\tmp\\0702412 D:\\Tools\\msys32\\tmp\\070244 
	.sect	".text"
	.clink
	.global	_showI2cError

$C$DW$32	.dwtag  DW_TAG_subprogram, DW_AT_name("showI2cError")
	.dwattr $C$DW$32, DW_AT_low_pc(_showI2cError)
	.dwattr $C$DW$32, DW_AT_high_pc(0x00)
	.dwattr $C$DW$32, DW_AT_TI_symbol_name("_showI2cError")
	.dwattr $C$DW$32, DW_AT_external
	.dwattr $C$DW$32, DW_AT_TI_begin_file("i2cparam.c")
	.dwattr $C$DW$32, DW_AT_TI_begin_line(0x67)
	.dwattr $C$DW$32, DW_AT_TI_begin_column(0x06)
	.dwattr $C$DW$32, DW_AT_TI_max_frame_size(0x18)
	.dwpsn	file "i2cparam.c",line 104,column 1,is_stmt,address _showI2cError

	.dwfde $C$DW$CIE, _showI2cError
$C$DW$33	.dwtag  DW_TAG_formal_parameter, DW_AT_name("iret")
	.dwattr $C$DW$33, DW_AT_TI_symbol_name("_iret")
	.dwattr $C$DW$33, DW_AT_type(*$C$DW$T$81)
	.dwattr $C$DW$33, DW_AT_location[DW_OP_reg4]
$C$DW$34	.dwtag  DW_TAG_formal_parameter, DW_AT_name("stage")
	.dwattr $C$DW$34, DW_AT_TI_symbol_name("_stage")
	.dwattr $C$DW$34, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$34, DW_AT_location[DW_OP_reg20]
;----------------------------------------------------------------------
; 103 | void showI2cError (I2C_RET iret, char *stage)                          
;----------------------------------------------------------------------

;******************************************************************************
;* FUNCTION NAME: showI2cError                                                *
;*                                                                            *
;*   Regs Modified     : A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,B0,B1,B2,B3,B4,B5,B6,  *
;*                           B7,B8,B9,SP,A16,A17,A18,A19,A20,A21,A22,A23,A24, *
;*                           A25,A26,A27,A28,A29,A30,A31,B16,B17,B18,B19,B20, *
;*                           B21,B22,B23,B24,B25,B26,B27,B28,B29,B30,B31      *
;*   Regs Used         : A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,B0,B1,B2,B3,B4,B5,B6,  *
;*                           B7,B8,B9,DP,SP,A16,A17,A18,A19,A20,A21,A22,A23,  *
;*                           A24,A25,A26,A27,A28,A29,A30,A31,B16,B17,B18,B19, *
;*                           B20,B21,B22,B23,B24,B25,B26,B27,B28,B29,B30,B31  *
;*   Local Frame Size  : 16 Args + 0 Auto + 4 Save = 20 byte                  *
;******************************************************************************

;******************************************************************************
;*                                                                            *
;* Using -g (debug) with optimization (-o2) may disable key optimizations!    *
;*                                                                            *
;******************************************************************************
_showI2cError:
;** --------------------------------------------------------------------------*
	.dwcfi	cfa_offset, 0
	.dwcfi	save_reg_to_reg, 228, 19
           STW     .D2T2   B3,*SP--(24)      ; |i2cparam.c:104| 
	.dwcfi	cfa_offset, 24
	.dwcfi	save_reg_to_mem, 19, 0
$C$DW$35	.dwtag  DW_TAG_variable, DW_AT_name("ecode")
	.dwattr $C$DW$35, DW_AT_TI_symbol_name("_ecode")
	.dwattr $C$DW$35, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$35, DW_AT_location[DW_OP_reg17]
$C$DW$36	.dwtag  DW_TAG_variable, DW_AT_name("iret")
	.dwattr $C$DW$36, DW_AT_TI_symbol_name("_iret")
	.dwattr $C$DW$36, DW_AT_type(*$C$DW$T$121)
	.dwattr $C$DW$36, DW_AT_location[DW_OP_reg1]
$C$DW$37	.dwtag  DW_TAG_variable, DW_AT_name("stage")
	.dwattr $C$DW$37, DW_AT_TI_symbol_name("_stage")
	.dwattr $C$DW$37, DW_AT_type(*$C$DW$T$161)
	.dwattr $C$DW$37, DW_AT_location[DW_OP_reg16]
;----------------------------------------------------------------------
; 105 | char *ecode;                                                           
;----------------------------------------------------------------------

           MV      .L2     B4,B0             ; |i2cparam.c:104| 
||         MV      .L1     A4,A1             ; |i2cparam.c:104| 

	.dwpsn	file "i2cparam.c",line 107,column 5,is_stmt
;----------------------------------------------------------------------
; 107 | switch (iret)  {                                                       
; 108 |     case I2C_RET_LOST_ARB:        ecode = "I2C master lost an arbitrati
;     | on battle";                                                            
; 109 |                                   break;                               
; 111 |     case I2C_RET_NO_ACK:          ecode = "I2C master detected no ack f
;     | rom slave";                                                            
; 112 |                                   break;                               
; 114 |     case I2C_RET_IDLE_TIMEOUT:    ecode = "I2C timed out";             
; 115 |                                   break;                               
; 117 |     case I2C_RET_BAD_REQUEST:     ecode = "I2C driver detected a bad da
;     | ta request";                                                           
; 118 |                                   break;                               
; 120 |     case I2C_RET_CLOCK_STUCK_LOW: ecode = "I2C driver found the bus stu
;     | ck low";                                                               
; 121 |                                   break;                               
;----------------------------------------------------------------------
           SUB     .L1     A1,1,A0           ; |i2cparam.c:107| 
           CMPGTU  .L1     A0,4,A0           ; |i2cparam.c:107| 
   [!A0]   BNOP    .S1     $C$L1,5           ; |i2cparam.c:107| 
           ; BRANCHCC OCCURS {$C$L1} {-6}    ; |i2cparam.c:107| 
;** --------------------------------------------------------------------------*
           MVK     .S1     99,A0             ; |i2cparam.c:107| 
           CMPEQ   .L1     A1,A0,A0          ; |i2cparam.c:107| 
   [ A0]   BNOP    .S1     $C$L2,5           ; |i2cparam.c:107| 
           ; BRANCHCC OCCURS {$C$L2}         ; |i2cparam.c:107| 
;** --------------------------------------------------------------------------*
           BNOP    .S1     $C$L8,5           ; |i2cparam.c:107| 
           ; BRANCH OCCURS {$C$L8}           ; |i2cparam.c:107| 
;** --------------------------------------------------------------------------*
$C$L1:    
           MVKL    .S2     $C$SW1,B1

           MVKH    .S2     $C$SW1,B1
||         SHL     .S1     A1,2,A0           ; |i2cparam.c:107| 

           SUB     .L1     A0,4,A0           ; |i2cparam.c:107| 
           ADD     .L1X    B1,A0,A4          ; |i2cparam.c:107| 
           LDW     .D1T1   *A4,A0            ; |i2cparam.c:107| 
           NOP             4
           BNOP    .S2X    A0,5              ; |i2cparam.c:107| 
           ; BRANCH OCCURS {A0}              ; |i2cparam.c:107| 
	.sect	".switch:_showI2cError"
	.clink
$C$SW1:	.word	$C$L7	; 1
	.word	$C$L6	; 2
	.word	$C$L5	; 3
	.word	$C$L4	; 4
	.word	$C$L3	; 5
	.sect	".text"
;** --------------------------------------------------------------------------*
$C$L2:    
	.dwpsn	file "i2cparam.c",line 123,column 39,is_stmt
;----------------------------------------------------------------------
; 123 | case I2C_RET_GEN_ERROR:       ecode = "I2C driver reported a general er
;     | ror";                                                                  
;----------------------------------------------------------------------
           MVKL    .S2     $C$SL1+0,B1
           MVKH    .S2     $C$SL1+0,B1
	.dwpsn	file "i2cparam.c",line 124,column 44,is_stmt
;----------------------------------------------------------------------
; 124 | break;                                                                 
;----------------------------------------------------------------------
           BNOP    .S1     $C$L8,5           ; |i2cparam.c:124| 
           ; BRANCH OCCURS {$C$L8}           ; |i2cparam.c:124| 
;** --------------------------------------------------------------------------*
$C$L3:    
	.dwpsn	file "i2cparam.c",line 120,column 39,is_stmt
           MVKL    .S2     $C$SL2+0,B1
           MVKH    .S2     $C$SL2+0,B1
	.dwpsn	file "i2cparam.c",line 121,column 44,is_stmt
           BNOP    .S1     $C$L8,5           ; |i2cparam.c:121| 
           ; BRANCH OCCURS {$C$L8}           ; |i2cparam.c:121| 
;** --------------------------------------------------------------------------*
$C$L4:    
	.dwpsn	file "i2cparam.c",line 117,column 39,is_stmt
           MVKL    .S2     $C$SL3+0,B1
           MVKH    .S2     $C$SL3+0,B1
	.dwpsn	file "i2cparam.c",line 118,column 44,is_stmt
           BNOP    .S1     $C$L8,5           ; |i2cparam.c:118| 
           ; BRANCH OCCURS {$C$L8}           ; |i2cparam.c:118| 
;** --------------------------------------------------------------------------*
$C$L5:    
	.dwpsn	file "i2cparam.c",line 114,column 39,is_stmt
           MVKL    .S2     $C$SL4+0,B1
           MVKH    .S2     $C$SL4+0,B1
	.dwpsn	file "i2cparam.c",line 115,column 44,is_stmt
           BNOP    .S1     $C$L8,5           ; |i2cparam.c:115| 
           ; BRANCH OCCURS {$C$L8}           ; |i2cparam.c:115| 
;** --------------------------------------------------------------------------*
$C$L6:    
	.dwpsn	file "i2cparam.c",line 111,column 39,is_stmt
           MVKL    .S2     $C$SL5+0,B1
           MVKH    .S2     $C$SL5+0,B1
	.dwpsn	file "i2cparam.c",line 112,column 44,is_stmt
           BNOP    .S1     $C$L8,5           ; |i2cparam.c:112| 
           ; BRANCH OCCURS {$C$L8}           ; |i2cparam.c:112| 
;** --------------------------------------------------------------------------*
$C$L7:    
	.dwpsn	file "i2cparam.c",line 108,column 39,is_stmt
           MVKL    .S2     $C$SL6+0,B1
           MVKH    .S2     $C$SL6+0,B1
;** --------------------------------------------------------------------------*
$C$L8:    
	.dwpsn	file "i2cparam.c",line 128,column 5,is_stmt
;----------------------------------------------------------------------
; 128 | printf ("Error: %s, reported at stage: %s\n", ecode, stage);           
;----------------------------------------------------------------------
           MVKL    .S2     _printf,B4
           MVKH    .S2     _printf,B4
$C$DW$38	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$38, DW_AT_low_pc(0x00)
	.dwattr $C$DW$38, DW_AT_name("_printf")
	.dwattr $C$DW$38, DW_AT_TI_call
           CALL    .S2     B4                ; |i2cparam.c:128| 
           MVKL    .S1     $C$SL7+0,A0
           STW     .D2T2   B0,*+SP(12)       ; |i2cparam.c:128| 
           MVKH    .S1     $C$SL7+0,A0
           STW     .D2T2   B1,*+SP(8)        ; |i2cparam.c:128| 

           ADDKPC  .S2     $C$RL0,B3,0       ; |i2cparam.c:128| 
||         STW     .D2T1   A0,*+SP(4)        ; |i2cparam.c:128| 

$C$RL0:    ; CALL OCCURS {_printf} {0}       ; |i2cparam.c:128| 
	.dwpsn	file "i2cparam.c",line 130,column 1,is_stmt
           LDW     .D2T2   *++SP(24),B3      ; |i2cparam.c:130| 
           NOP             4
	.dwcfi	cfa_offset, 0
	.dwcfi	restore_reg, 19
	.dwcfi	cfa_offset, 0
$C$DW$39	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$39, DW_AT_low_pc(0x00)
	.dwattr $C$DW$39, DW_AT_TI_return
           RETNOP  .S2     B3,5              ; |i2cparam.c:130| 
           ; BRANCH OCCURS {B3}              ; |i2cparam.c:130| 
	.dwattr $C$DW$32, DW_AT_TI_end_file("i2cparam.c")
	.dwattr $C$DW$32, DW_AT_TI_end_line(0x82)
	.dwattr $C$DW$32, DW_AT_TI_end_column(0x01)
	.dwendentry
	.dwendtag $C$DW$32

	.sect	".text"
	.clink
	.global	_onesComplementChksum

$C$DW$40	.dwtag  DW_TAG_subprogram, DW_AT_name("onesComplementChksum")
	.dwattr $C$DW$40, DW_AT_low_pc(_onesComplementChksum)
	.dwattr $C$DW$40, DW_AT_high_pc(0x00)
	.dwattr $C$DW$40, DW_AT_TI_symbol_name("_onesComplementChksum")
	.dwattr $C$DW$40, DW_AT_external
	.dwattr $C$DW$40, DW_AT_type(*$C$DW$T$45)
	.dwattr $C$DW$40, DW_AT_TI_begin_file("i2cparam.c")
	.dwattr $C$DW$40, DW_AT_TI_begin_line(0x56)
	.dwattr $C$DW$40, DW_AT_TI_begin_column(0x08)
	.dwattr $C$DW$40, DW_AT_TI_max_frame_size(0x00)
	.dwpsn	file "i2cparam.c",line 87,column 1,is_stmt,address _onesComplementChksum

	.dwfde $C$DW$CIE, _onesComplementChksum
$C$DW$41	.dwtag  DW_TAG_formal_parameter, DW_AT_name("p_data")
	.dwattr $C$DW$41, DW_AT_TI_symbol_name("_p_data")
	.dwattr $C$DW$41, DW_AT_type(*$C$DW$T$130)
	.dwattr $C$DW$41, DW_AT_location[DW_OP_reg4]
$C$DW$42	.dwtag  DW_TAG_formal_parameter, DW_AT_name("len")
	.dwattr $C$DW$42, DW_AT_TI_symbol_name("_len")
	.dwattr $C$DW$42, DW_AT_type(*$C$DW$T$45)
	.dwattr $C$DW$42, DW_AT_location[DW_OP_reg20]
;----------------------------------------------------------------------
;  86 | uint16 onesComplementChksum (uint16 * restrict p_data, uint16 len)     
;----------------------------------------------------------------------

;******************************************************************************
;* FUNCTION NAME: onesComplementChksum                                        *
;*                                                                            *
;*   Regs Modified     : A3,A4,B0,B1,B4                                       *
;*   Regs Used         : A3,A4,B0,B1,B3,B4                                    *
;*   Local Frame Size  : 0 Args + 0 Auto + 0 Save = 0 byte                    *
;******************************************************************************

;******************************************************************************
;*                                                                            *
;* Using -g (debug) with optimization (-o2) may disable key optimizations!    *
;*                                                                            *
;******************************************************************************
_onesComplementChksum:
;** --------------------------------------------------------------------------*
	.dwcfi	cfa_offset, 0
	.dwcfi	save_reg_to_reg, 228, 19
$C$DW$43	.dwtag  DW_TAG_variable, DW_AT_name("chksum")
	.dwattr $C$DW$43, DW_AT_TI_symbol_name("_chksum")
	.dwattr $C$DW$43, DW_AT_type(*$C$DW$T$45)
	.dwattr $C$DW$43, DW_AT_location[DW_OP_reg3]
$C$DW$44	.dwtag  DW_TAG_variable, DW_AT_name("p_data")
	.dwattr $C$DW$44, DW_AT_TI_symbol_name("_p_data")
	.dwattr $C$DW$44, DW_AT_type(*$C$DW$T$130)
	.dwattr $C$DW$44, DW_AT_location[DW_OP_reg4]
$C$DW$45	.dwtag  DW_TAG_variable, DW_AT_name("len")
	.dwattr $C$DW$45, DW_AT_TI_symbol_name("_len")
	.dwattr $C$DW$45, DW_AT_type(*$C$DW$T$137)
	.dwattr $C$DW$45, DW_AT_location[DW_OP_reg16]
           MV      .L2     B4,B0             ; |i2cparam.c:87| 
	.dwpsn	file "i2cparam.c",line 88,column 10,is_stmt
;----------------------------------------------------------------------
;  88 | uint16 chksum = 0;                                                     
;----------------------------------------------------------------------
           ZERO    .L1     A3                ; |i2cparam.c:88| 
	.dwpsn	file "i2cparam.c",line 90,column 10,is_stmt
;----------------------------------------------------------------------
;  90 | while (len > 0)                                                        
;----------------------------------------------------------------------
   [!B0]   BNOP    .S1     $C$L12,5          ; |i2cparam.c:90| 
           ; BRANCHCC OCCURS {$C$L12}        ; |i2cparam.c:90| 
;** --------------------------------------------------------------------------*
	.dwpsn	file "i2cparam.c",line 92,column 5,is_stmt
;----------------------------------------------------------------------
;  92 | chksum = onesComplementAdd(chksum, *p_data);                           
;  93 | p_data++;                                                              
;  94 | len--;                                                                 
;----------------------------------------------------------------------

           MV      .L2X    A3,B1
||         SUB     .S2     B0,1,B0

           MVC     .S2     B0,ILC
||         MV      .L2X    A4,B4

;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*
;*      Loop found in file               : i2cparam.c
;*      Loop source line                 : 90
;*      Loop opening brace source line   : 91
;*      Loop closing brace source line   : 95
;*      Known Minimum Trip Count         : 1                    
;*      Known Maximum Trip Count         : 65535                    
;*      Known Max Trip Count Factor      : 1
;*      Loop Carried Dependency Bound(^) : 6
;*      Unpartitioned Resource Bound     : 2
;*      Partitioned Resource Bound(*)    : 4
;*      Resource Partition:
;*                                A-side   B-side
;*      .L units                     0        0     
;*      .S units                     0        4*    
;*      .D units                     0        1     
;*      .M units                     0        0     
;*      .X cross paths               0        0     
;*      .T address paths             0        1     
;*      Long read paths              0        0     
;*      Long write paths             0        0     
;*      Logical  ops (.LS)           0        3     (.L or .S unit)
;*      Addition ops (.LSD)          0        0     (.L or .S or .D unit)
;*      Bound(.L .S .LS)             0        4*    
;*      Bound(.L .S .D .LS .LSD)     0        3     
;*
;*      Searching for software pipeline schedule at ...
;*         ii = 6  Did not find schedule
;*         ii = 7  Schedule found with 2 iterations in parallel
;*      Done
;*
;*      Loop will be splooped
;*      Collapsed epilog stages       : 0
;*      Collapsed prolog stages       : 0
;*      Minimum required memory pad   : 0 bytes
;*
;*      Minimum safe trip count       : 1
;*----------------------------------------------------------------------------*
$C$L9:    ; PIPED LOOP PROLOG
           SPLOOPD 7       ;14               ; (P) 
;** --------------------------------------------------------------------------*
$C$L10:    ; PIPED LOOP KERNEL
$C$DW$L$_onesComplementChksum$4$B:
           LDHU    .D2T2   *B4++,B0          ; |i2cparam.c:77| (P) <0,0> 
           NOP             4
           ADD     .L2     B0,B1,B0          ; |i2cparam.c:77| (P) <0,5>  ^ 
           SHRU    .S2     B0,16,B1          ; |i2cparam.c:77| (P) <0,6>  ^ 
           EXTU    .S2     B0,16,16,B0       ; |i2cparam.c:77| <0,7>  ^ 
           ADD     .L2     B0,B1,B0          ; |i2cparam.c:77| <0,8>  ^ 
           SHRU    .S2     B0,16,B1          ; |i2cparam.c:77| <0,9>  ^ 
           ADD     .L2     B0,B1,B0          ; |i2cparam.c:77| <0,10>  ^ 

           SPKERNEL 0,5
||         EXTU    .S2     B0,16,16,B1       ; |i2cparam.c:77| <0,11>  ^ 

$C$DW$L$_onesComplementChksum$4$E:
;** --------------------------------------------------------------------------*
$C$L11:    ; PIPED LOOP EPILOG
;** --------------------------------------------------------------------------*
           NOP             1
           MV      .L1X    B1,A3
;** --------------------------------------------------------------------------*
$C$L12:    
	.dwpsn	file "i2cparam.c",line 96,column 3,is_stmt
;----------------------------------------------------------------------
;  96 | return (chksum);                                                       
;----------------------------------------------------------------------
           MV      .L1     A3,A4             ; |i2cparam.c:96| 
	.dwpsn	file "i2cparam.c",line 97,column 1,is_stmt
	.dwcfi	cfa_offset, 0
$C$DW$46	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$46, DW_AT_low_pc(0x00)
	.dwattr $C$DW$46, DW_AT_TI_return
           RETNOP  .S2     B3,5              ; |i2cparam.c:97| 
           ; BRANCH OCCURS {B3}              ; |i2cparam.c:97| 

$C$DW$47	.dwtag  DW_TAG_TI_loop
	.dwattr $C$DW$47, DW_AT_name("D:\workspace\PR6100B\dsp\IBL\ibl\src\util\i2cConfig\i2cparam.asm:$C$L10:1:1509635954")
	.dwattr $C$DW$47, DW_AT_TI_begin_file("i2cparam.c")
	.dwattr $C$DW$47, DW_AT_TI_begin_line(0x5a)
	.dwattr $C$DW$47, DW_AT_TI_end_line(0x5f)
$C$DW$48	.dwtag  DW_TAG_TI_loop_range
	.dwattr $C$DW$48, DW_AT_low_pc($C$DW$L$_onesComplementChksum$4$B)
	.dwattr $C$DW$48, DW_AT_high_pc($C$DW$L$_onesComplementChksum$4$E)
	.dwendtag $C$DW$47

	.dwattr $C$DW$40, DW_AT_TI_end_file("i2cparam.c")
	.dwattr $C$DW$40, DW_AT_TI_end_line(0x61)
	.dwattr $C$DW$40, DW_AT_TI_end_column(0x01)
	.dwendentry
	.dwendtag $C$DW$40

	.sect	".text"
	.clink
	.global	_formBlock

$C$DW$49	.dwtag  DW_TAG_subprogram, DW_AT_name("formBlock")
	.dwattr $C$DW$49, DW_AT_low_pc(_formBlock)
	.dwattr $C$DW$49, DW_AT_high_pc(0x00)
	.dwattr $C$DW$49, DW_AT_TI_symbol_name("_formBlock")
	.dwattr $C$DW$49, DW_AT_external
	.dwattr $C$DW$49, DW_AT_type(*$C$DW$T$138)
	.dwattr $C$DW$49, DW_AT_TI_begin_file("i2cparam.c")
	.dwattr $C$DW$49, DW_AT_TI_begin_line(0x88)
	.dwattr $C$DW$49, DW_AT_TI_begin_column(0x07)
	.dwattr $C$DW$49, DW_AT_TI_max_frame_size(0x00)
	.dwpsn	file "i2cparam.c",line 137,column 1,is_stmt,address _formBlock

	.dwfde $C$DW$CIE, _formBlock
$C$DW$50	.dwtag  DW_TAG_formal_parameter, DW_AT_name("base")
	.dwattr $C$DW$50, DW_AT_TI_symbol_name("_base")
	.dwattr $C$DW$50, DW_AT_type(*$C$DW$T$108)
	.dwattr $C$DW$50, DW_AT_location[DW_OP_reg4]
$C$DW$51	.dwtag  DW_TAG_formal_parameter, DW_AT_name("dataSize")
	.dwattr $C$DW$51, DW_AT_TI_symbol_name("_dataSize")
	.dwattr $C$DW$51, DW_AT_type(*$C$DW$T$138)
	.dwattr $C$DW$51, DW_AT_location[DW_OP_reg20]
$C$DW$52	.dwtag  DW_TAG_formal_parameter, DW_AT_name("offset")
	.dwattr $C$DW$52, DW_AT_TI_symbol_name("_offset")
	.dwattr $C$DW$52, DW_AT_type(*$C$DW$T$141)
	.dwattr $C$DW$52, DW_AT_location[DW_OP_reg6]
$C$DW$53	.dwtag  DW_TAG_formal_parameter, DW_AT_name("data")
	.dwattr $C$DW$53, DW_AT_TI_symbol_name("_data")
	.dwattr $C$DW$53, DW_AT_type(*$C$DW$T$112)
	.dwattr $C$DW$53, DW_AT_location[DW_OP_reg22]
$C$DW$54	.dwtag  DW_TAG_formal_parameter, DW_AT_name("baseI2cDataAddr")
	.dwattr $C$DW$54, DW_AT_TI_symbol_name("_baseI2cDataAddr")
	.dwattr $C$DW$54, DW_AT_type(*$C$DW$T$55)
	.dwattr $C$DW$54, DW_AT_location[DW_OP_reg8]
;----------------------------------------------------------------------
; 136 | Int32 formBlock (UINT8 *base, Int32 dataSize, Int32 *offset, Uint8 *dat
;     | a, Uint32 baseI2cDataAddr)                                             
;----------------------------------------------------------------------

;******************************************************************************
;* FUNCTION NAME: formBlock                                                   *
;*                                                                            *
;*   Regs Modified     : A0,A1,A2,A3,A4,A5,B0,B1,B4                           *
;*   Regs Used         : A0,A1,A2,A3,A4,A5,A6,A8,B0,B1,B3,B4,B6               *
;*   Local Frame Size  : 0 Args + 0 Auto + 0 Save = 0 byte                    *
;******************************************************************************

;******************************************************************************
;*                                                                            *
;* Using -g (debug) with optimization (-o2) may disable key optimizations!    *
;*                                                                            *
;******************************************************************************
_formBlock:
;** --------------------------------------------------------------------------*
	.dwcfi	cfa_offset, 0
	.dwcfi	save_reg_to_reg, 228, 19
$C$DW$55	.dwtag  DW_TAG_variable, DW_AT_name("i")
	.dwattr $C$DW$55, DW_AT_TI_symbol_name("_i")
	.dwattr $C$DW$55, DW_AT_type(*$C$DW$T$138)
	.dwattr $C$DW$55, DW_AT_location[DW_OP_reg0]
$C$DW$56	.dwtag  DW_TAG_variable, DW_AT_name("nbytes")
	.dwattr $C$DW$56, DW_AT_TI_symbol_name("_nbytes")
	.dwattr $C$DW$56, DW_AT_type(*$C$DW$T$138)
	.dwattr $C$DW$56, DW_AT_location[DW_OP_reg2]
$C$DW$57	.dwtag  DW_TAG_variable, DW_AT_name("currentAddress")
	.dwattr $C$DW$57, DW_AT_TI_symbol_name("_currentAddress")
	.dwattr $C$DW$57, DW_AT_type(*$C$DW$T$55)
	.dwattr $C$DW$57, DW_AT_location[DW_OP_reg0]
$C$DW$58	.dwtag  DW_TAG_variable, DW_AT_name("base")
	.dwattr $C$DW$58, DW_AT_TI_symbol_name("_base")
	.dwattr $C$DW$58, DW_AT_type(*$C$DW$T$109)
	.dwattr $C$DW$58, DW_AT_location[DW_OP_reg4]
$C$DW$59	.dwtag  DW_TAG_variable, DW_AT_name("dataSize")
	.dwattr $C$DW$59, DW_AT_TI_symbol_name("_dataSize")
	.dwattr $C$DW$59, DW_AT_type(*$C$DW$T$140)
	.dwattr $C$DW$59, DW_AT_location[DW_OP_reg17]
$C$DW$60	.dwtag  DW_TAG_variable, DW_AT_name("offset")
	.dwattr $C$DW$60, DW_AT_TI_symbol_name("_offset")
	.dwattr $C$DW$60, DW_AT_type(*$C$DW$T$142)
	.dwattr $C$DW$60, DW_AT_location[DW_OP_reg6]
$C$DW$61	.dwtag  DW_TAG_variable, DW_AT_name("data")
	.dwattr $C$DW$61, DW_AT_TI_symbol_name("_data")
	.dwattr $C$DW$61, DW_AT_type(*$C$DW$T$113)
	.dwattr $C$DW$61, DW_AT_location[DW_OP_reg20]
$C$DW$62	.dwtag  DW_TAG_variable, DW_AT_name("baseI2cDataAddr")
	.dwattr $C$DW$62, DW_AT_TI_symbol_name("_baseI2cDataAddr")
	.dwattr $C$DW$62, DW_AT_type(*$C$DW$T$158)
	.dwattr $C$DW$62, DW_AT_location[DW_OP_reg2]
;----------------------------------------------------------------------
; 138 | Uint32 currentAddress;                                                 
; 139 | Int32  nbytes;                                                         
; 140 | Int32  i;                                                              
;----------------------------------------------------------------------

           MV      .L2     B4,B1             ; |i2cparam.c:137| 
||         MV      .S2     B6,B4             ; |i2cparam.c:137| 
||         MV      .L1     A8,A2             ; |i2cparam.c:137| 

	.dwpsn	file "i2cparam.c",line 144,column 5,is_stmt
;----------------------------------------------------------------------
; 144 | currentAddress = baseI2cDataAddr + *offset;                            
;----------------------------------------------------------------------
           LDW     .D1T1   *A6,A1            ; |i2cparam.c:144| 
           NOP             4
           ADD     .L1     A2,A1,A0          ; |i2cparam.c:144| 
	.dwpsn	file "i2cparam.c",line 145,column 5,is_stmt
;----------------------------------------------------------------------
; 145 | nbytes         = 64 - (currentAddress & (64 - 1));                     
;----------------------------------------------------------------------
           EXTU    .S1     A0,26,26,A3
           MVK     .S1     64,A2             ; |i2cparam.c:145| 
           SUB     .L1     A2,A3,A2          ; |i2cparam.c:145| 
	.dwpsn	file "i2cparam.c",line 148,column 5,is_stmt
;----------------------------------------------------------------------
; 148 | if (*offset + nbytes > dataSize)                                       
;----------------------------------------------------------------------
           ADD     .L1     A2,A1,A3          ; |i2cparam.c:148| 
           NOP             1
           CMPGT   .L2X    A3,B1,B0          ; |i2cparam.c:148| 
   [!B0]   BNOP    .S1     $C$L13,5          ; |i2cparam.c:148| 
           ; BRANCHCC OCCURS {$C$L13}        ; |i2cparam.c:148| 
;** --------------------------------------------------------------------------*
	.dwpsn	file "i2cparam.c",line 149,column 9,is_stmt
;----------------------------------------------------------------------
; 149 | nbytes = dataSize - *offset;                                           
;----------------------------------------------------------------------
           SUB     .L1X    B1,A1,A2          ; |i2cparam.c:149| 
;** --------------------------------------------------------------------------*
$C$L13:    
	.dwpsn	file "i2cparam.c",line 151,column 5,is_stmt
;----------------------------------------------------------------------
; 151 | if (nbytes == 0)                                                       
;----------------------------------------------------------------------
   [ A2]   BNOP    .S1     $C$L14,5          ; |i2cparam.c:151| 
           ; BRANCHCC OCCURS {$C$L14}        ; |i2cparam.c:151| 
;** --------------------------------------------------------------------------*
	.dwpsn	file "i2cparam.c",line 152,column 9,is_stmt
;----------------------------------------------------------------------
; 152 | return (0);                                                            
;----------------------------------------------------------------------
           BNOP    .S1     $C$L19,4          ; |i2cparam.c:152| 
           ZERO    .L1     A4                ; |i2cparam.c:152| 
           ; BRANCH OCCURS {$C$L19}          ; |i2cparam.c:152| 
;** --------------------------------------------------------------------------*
$C$L14:    
	.dwpsn	file "i2cparam.c",line 155,column 5,is_stmt
;----------------------------------------------------------------------
; 155 | data[0] = (currentAddress >> 8) & 0xff;                                
;----------------------------------------------------------------------
           SHRU    .S1     A0,8,A1           ; |i2cparam.c:155| 
           STB     .D2T1   A1,*B4            ; |i2cparam.c:155| 
	.dwpsn	file "i2cparam.c",line 156,column 5,is_stmt
;----------------------------------------------------------------------
; 156 | data[1] = (currentAddress >> 0) & 0xff;                                
;----------------------------------------------------------------------
           STB     .D2T1   A0,*+B4(1)        ; |i2cparam.c:156| 
	.dwpsn	file "i2cparam.c",line 159,column 17,is_stmt
;----------------------------------------------------------------------
; 159 | for (i = 0; i < nbytes; i++)                                           
;----------------------------------------------------------------------
           CMPGT   .L1     A2,0,A0           ; |i2cparam.c:159| 
   [!A0]   BNOP    .S1     $C$L18,5          ; |i2cparam.c:159| 
           ; BRANCHCC OCCURS {$C$L18}        ; |i2cparam.c:159| 
;** --------------------------------------------------------------------------*
           ADD     .L2     2,B4,B4
	.dwpsn	file "i2cparam.c",line 160,column 9,is_stmt
;----------------------------------------------------------------------
; 160 | data[i+2] = base[*offset + i];                                         
;----------------------------------------------------------------------
           MV      .L2X    A2,B0             ; |i2cparam.c:160| 
	.dwpsn	file "i2cparam.c",line 159,column 10,is_stmt
           SUB     .L2     B0,1,B0

           MVC     .S2     B0,ILC
||         MV      .L1     A4,A5
||         ZERO    .S1     A0                ; |i2cparam.c:159| 

;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*
;*      Loop found in file               : i2cparam.c
;*      Loop source line                 : 159
;*      Loop opening brace source line   : 160
;*      Loop closing brace source line   : 160
;*      Known Minimum Trip Count         : 1                    
;*      Known Max Trip Count Factor      : 1
;*      Loop Carried Dependency Bound(^) : 12
;*      Unpartitioned Resource Bound     : 2
;*      Partitioned Resource Bound(*)    : 2
;*      Resource Partition:
;*                                A-side   B-side
;*      .L units                     0        0     
;*      .S units                     0        0     
;*      .D units                     2*       1     
;*      .M units                     0        0     
;*      .X cross paths               1        0     
;*      .T address paths             2*       1     
;*      Long read paths              0        0     
;*      Long write paths             0        0     
;*      Logical  ops (.LS)           2        0     (.L or .S unit)
;*      Addition ops (.LSD)          0        0     (.L or .S or .D unit)
;*      Bound(.L .S .LS)             1        0     
;*      Bound(.L .S .D .LS .LSD)     2*       1     
;*
;*      Searching for software pipeline schedule at ...
;*         ii = 12 Schedule found with 2 iterations in parallel
;*      Done
;*
;*      Loop will be splooped
;*      Collapsed epilog stages       : 0
;*      Collapsed prolog stages       : 0
;*      Minimum required memory pad   : 0 bytes
;*
;*      Minimum safe trip count       : 1
;*----------------------------------------------------------------------------*
$C$L15:    ; PIPED LOOP PROLOG
           SPLOOPD 12      ;24               ; (P) 
;** --------------------------------------------------------------------------*
$C$L16:    ; PIPED LOOP KERNEL
$C$DW$L$_formBlock$8$B:
           LDW     .D1T2   *A6,B0            ; |i2cparam.c:160| (P) <0,0>  ^ 
           NOP             4
           ADD     .L1X    A0,B0,A4          ; |i2cparam.c:160| (P) <0,5>  ^ 
           LDBU    .D1T1   *+A4[A5],A1       ; |i2cparam.c:160| (P) <0,6>  ^ 
           NOP             4

           ADD     .L1     1,A0,A0           ; |i2cparam.c:159| (P) <0,11> Define a twin register
||         STB     .D2T1   A1,*B4++          ; |i2cparam.c:160| (P) <0,11>  ^ 

           SPKERNEL 0,1
$C$DW$L$_formBlock$8$E:
;** --------------------------------------------------------------------------*
$C$L17:    ; PIPED LOOP EPILOG
;** --------------------------------------------------------------------------*
$C$L18:    
	.dwpsn	file "i2cparam.c",line 163,column 5,is_stmt
;----------------------------------------------------------------------
; 163 | *offset += nbytes;                                                     
;----------------------------------------------------------------------
           LDW     .D1T1   *A6,A0            ; |i2cparam.c:163| 
           NOP             4
           ADD     .L1     A2,A0,A0          ; |i2cparam.c:163| 
           STW     .D1T1   A0,*A6            ; |i2cparam.c:163| 
	.dwpsn	file "i2cparam.c",line 166,column 5,is_stmt
;----------------------------------------------------------------------
; 166 | return (nbytes + 2);                                                   
;----------------------------------------------------------------------
           ADD     .L1     2,A2,A4           ; |i2cparam.c:166| 
;** --------------------------------------------------------------------------*
$C$L19:    
	.dwpsn	file "i2cparam.c",line 168,column 1,is_stmt
	.dwcfi	cfa_offset, 0
$C$DW$63	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$63, DW_AT_low_pc(0x00)
	.dwattr $C$DW$63, DW_AT_TI_return
           RETNOP  .S2     B3,5              ; |i2cparam.c:168| 
           ; BRANCH OCCURS {B3}              ; |i2cparam.c:168| 

$C$DW$64	.dwtag  DW_TAG_TI_loop
	.dwattr $C$DW$64, DW_AT_name("D:\workspace\PR6100B\dsp\IBL\ibl\src\util\i2cConfig\i2cparam.asm:$C$L16:1:1509635954")
	.dwattr $C$DW$64, DW_AT_TI_begin_file("i2cparam.c")
	.dwattr $C$DW$64, DW_AT_TI_begin_line(0x9f)
	.dwattr $C$DW$64, DW_AT_TI_end_line(0xa0)
$C$DW$65	.dwtag  DW_TAG_TI_loop_range
	.dwattr $C$DW$65, DW_AT_low_pc($C$DW$L$_formBlock$8$B)
	.dwattr $C$DW$65, DW_AT_high_pc($C$DW$L$_formBlock$8$E)
	.dwendtag $C$DW$64

	.dwattr $C$DW$49, DW_AT_TI_end_file("i2cparam.c")
	.dwattr $C$DW$49, DW_AT_TI_end_line(0xa8)
	.dwattr $C$DW$49, DW_AT_TI_end_column(0x01)
	.dwendentry
	.dwendtag $C$DW$49

	.sect	".text"
	.clink
	.global	_main

$C$DW$66	.dwtag  DW_TAG_subprogram, DW_AT_name("main")
	.dwattr $C$DW$66, DW_AT_low_pc(_main)
	.dwattr $C$DW$66, DW_AT_high_pc(0x00)
	.dwattr $C$DW$66, DW_AT_TI_symbol_name("_main")
	.dwattr $C$DW$66, DW_AT_external
	.dwattr $C$DW$66, DW_AT_TI_begin_file("i2cparam.c")
	.dwattr $C$DW$66, DW_AT_TI_begin_line(0xac)
	.dwattr $C$DW$66, DW_AT_TI_begin_column(0x06)
	.dwattr $C$DW$66, DW_AT_TI_max_frame_size(0x108)
	.dwpsn	file "i2cparam.c",line 173,column 1,is_stmt,address _main

	.dwfde $C$DW$CIE, _main
;----------------------------------------------------------------------
; 172 | void main (void)                                                       
;----------------------------------------------------------------------

;******************************************************************************
;* FUNCTION NAME: main                                                        *
;*                                                                            *
;*   Regs Modified     : A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,A12,A13,A14,B0,*
;*                           B1,B2,B3,B4,B5,B6,B7,B8,B9,B10,SP,A16,A17,A18,   *
;*                           A19,A20,A21,A22,A23,A24,A25,A26,A27,A28,A29,A30, *
;*                           A31,B16,B17,B18,B19,B20,B21,B22,B23,B24,B25,B26, *
;*                           B27,B28,B29,B30,B31                              *
;*   Regs Used         : A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,A12,A13,A14,B0,*
;*                           B1,B2,B3,B4,B5,B6,B7,B8,B9,B10,DP,SP,A16,A17,A18,*
;*                           A19,A20,A21,A22,A23,A24,A25,A26,A27,A28,A29,A30, *
;*                           A31,B16,B17,B18,B19,B20,B21,B22,B23,B24,B25,B26, *
;*                           B27,B28,B29,B30,B31                              *
;*   Local Frame Size  : 8 Args + 216 Auto + 40 Save = 264 byte               *
;******************************************************************************

;******************************************************************************
;*                                                                            *
;* Using -g (debug) with optimization (-o2) may disable key optimizations!    *
;*                                                                            *
;******************************************************************************
_main:
;** --------------------------------------------------------------------------*
;----------------------------------------------------------------------
; 174 | I2C_RET  iret;                                                         
; 175 | UINT8    writeBlock[66];                                               
; 176 | char     iline[132];                                                   
; 177 | Int32    n;                                                            
; 178 | Int32    currentOffset;                                                
; 179 | uint16   chk;                                                          
; 181 | volatile Int32 i;                                                      
;----------------------------------------------------------------------
	.dwcfi	cfa_offset, 0
	.dwcfi	save_reg_to_reg, 228, 19
           STW     .D2T2   B10,*SP--(8)      ; |i2cparam.c:173| 
	.dwcfi	cfa_offset, 8
	.dwcfi	save_reg_to_mem, 26, 0
           STW     .D2T2   B3,*SP--(8)       ; |i2cparam.c:173| 
	.dwcfi	cfa_offset, 16
	.dwcfi	save_reg_to_mem, 19, -8
           STW     .D2T1   A14,*SP--(8)      ; |i2cparam.c:173| 
	.dwcfi	cfa_offset, 24
	.dwcfi	save_reg_to_mem, 14, -16
           STDW    .D2T1   A13:A12,*SP--     ; |i2cparam.c:173| 
	.dwcfi	cfa_offset, 32
	.dwcfi	save_reg_to_mem, 13, -20
	.dwcfi	save_reg_to_mem, 12, -24
           STDW    .D2T1   A11:A10,*SP--     ; |i2cparam.c:173| 
	.dwcfi	cfa_offset, 40
	.dwcfi	save_reg_to_mem, 11, -28
	.dwcfi	save_reg_to_mem, 10, -32
           ADDK    .S2     -224,SP           ; |i2cparam.c:173| 
	.dwcfi	cfa_offset, 264
$C$DW$67	.dwtag  DW_TAG_variable, DW_AT_name("chk")
	.dwattr $C$DW$67, DW_AT_TI_symbol_name("_chk")
	.dwattr $C$DW$67, DW_AT_type(*$C$DW$T$45)
	.dwattr $C$DW$67, DW_AT_location[DW_OP_reg4]
$C$DW$68	.dwtag  DW_TAG_variable, DW_AT_name("currentOffset")
	.dwattr $C$DW$68, DW_AT_TI_symbol_name("_currentOffset")
	.dwattr $C$DW$68, DW_AT_type(*$C$DW$T$138)
	.dwattr $C$DW$68, DW_AT_location[DW_OP_breg31 12]
$C$DW$69	.dwtag  DW_TAG_variable, DW_AT_name("n")
	.dwattr $C$DW$69, DW_AT_TI_symbol_name("_n")
	.dwattr $C$DW$69, DW_AT_type(*$C$DW$T$138)
	.dwattr $C$DW$69, DW_AT_location[DW_OP_reg10]
$C$DW$70	.dwtag  DW_TAG_variable, DW_AT_name("iret")
	.dwattr $C$DW$70, DW_AT_TI_symbol_name("_iret")
	.dwattr $C$DW$70, DW_AT_type(*$C$DW$T$81)
	.dwattr $C$DW$70, DW_AT_location[DW_OP_reg11]
$C$DW$71	.dwtag  DW_TAG_variable, DW_AT_name("writeBlock")
	.dwattr $C$DW$71, DW_AT_TI_symbol_name("_writeBlock")
	.dwattr $C$DW$71, DW_AT_type(*$C$DW$T$110)
	.dwattr $C$DW$71, DW_AT_location[DW_OP_breg31 16]
$C$DW$72	.dwtag  DW_TAG_variable, DW_AT_name("iline")
	.dwattr $C$DW$72, DW_AT_TI_symbol_name("_iline")
	.dwattr $C$DW$72, DW_AT_type(*$C$DW$T$162)
	.dwattr $C$DW$72, DW_AT_location[DW_OP_breg31 88]
$C$DW$73	.dwtag  DW_TAG_variable, DW_AT_name("i")
	.dwattr $C$DW$73, DW_AT_TI_symbol_name("_i")
	.dwattr $C$DW$73, DW_AT_type(*$C$DW$T$139)
	.dwattr $C$DW$73, DW_AT_location[DW_OP_breg31 224]
	.dwpsn	file "i2cparam.c",line 183,column 5,is_stmt
;----------------------------------------------------------------------
; 183 | if (configAddress == 0)  {                                             
; 184 |   printf ("Error: The global variable config address must be setup prio
;     | r to running this program\n");                                         
; 185 |   printf ("       This is the address in the I2C eeprom where the param
;     | eters live. On configurations\n");                                     
; 186 |   printf ("       which support both big and little endian it is possib
;     | le to configure the IBL to\n");                                        
; 187 |   printf ("       usage a different configuration table for each endian
;     | , so this program must be run\n");                                     
; 188 |   printf ("       twice. The value 0 is invalid for configAddress\n"); 
; 189 |   return;                                                              
;----------------------------------------------------------------------
           MVKL    .S1     _configAddress,A14
           MVKH    .S1     _configAddress,A14
           MV      .L1     A14,A4
           LDW     .D1T1   *A4,A0            ; |i2cparam.c:183| 
           NOP             4
   [!A0]   BNOP    .S1     $C$L27,5          ; |i2cparam.c:183| 
           ; BRANCHCC OCCURS {$C$L27}        ; |i2cparam.c:183| 
;** --------------------------------------------------------------------------*
	.dwpsn	file "i2cparam.c",line 192,column 5,is_stmt
;----------------------------------------------------------------------
; 192 | memset(&ibl, 0, sizeof(ibl_t));                                        
;----------------------------------------------------------------------
           MVKL    .S2     _memset,B5
           MVKH    .S2     _memset,B5
$C$DW$74	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$74, DW_AT_low_pc(0x00)
	.dwattr $C$DW$74, DW_AT_name("_memset")
	.dwattr $C$DW$74, DW_AT_TI_call
           CALL    .S2     B5                ; |i2cparam.c:192| 
           MVKL    .S1     _ibl,A10
           MVK     .S1     0xec,A6
           MVKH    .S1     _ibl,A10
           ADDKPC  .S2     $C$RL1,B3,0       ; |i2cparam.c:192| 

           MV      .L1     A10,A4            ; |i2cparam.c:192| 
||         SET     .S1     A6,0x9,0x9,A6
||         ZERO    .L2     B4                ; |i2cparam.c:192| 

$C$RL1:    ; CALL OCCURS {_memset} {0}       ; |i2cparam.c:192| 
           MV      .L1     A10,A12           ; |i2cparam.c:192| 
	.dwpsn	file "i2cparam.c",line 194,column 5,is_stmt
;----------------------------------------------------------------------
; 194 | printf ("Run the GEL for for the device to be configured, press return
;     | to program the I2C\n");                                                
;----------------------------------------------------------------------
           MVKL    .S1     _printf,A13
           MVKH    .S1     _printf,A13
           MVKL    .S1     $C$SL8+0,A0
$C$DW$75	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$75, DW_AT_low_pc(0x00)
	.dwattr $C$DW$75, DW_AT_name("_printf")
	.dwattr $C$DW$75, DW_AT_TI_call
           CALL    .S2X    A13               ; |i2cparam.c:194| 
           MVKH    .S1     $C$SL8+0,A0
           ADDKPC  .S2     $C$RL2,B3,2       ; |i2cparam.c:194| 
           STW     .D2T1   A0,*+SP(4)        ; |i2cparam.c:194| 
$C$RL2:    ; CALL OCCURS {_printf} {0}       ; |i2cparam.c:194| 
	.dwpsn	file "i2cparam.c",line 195,column 5,is_stmt
;----------------------------------------------------------------------
; 195 | getchar ();                                                            
;----------------------------------------------------------------------
           MVKL    .S1     _getchar,A3
           MVKH    .S1     _getchar,A3
           NOP             1
$C$DW$76	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$76, DW_AT_low_pc(0x00)
	.dwattr $C$DW$76, DW_AT_name("_getchar")
	.dwattr $C$DW$76, DW_AT_TI_call
           CALL    .S2X    A3                ; |i2cparam.c:195| 
           ADDKPC  .S2     $C$RL3,B3,4       ; |i2cparam.c:195| 
$C$RL3:    ; CALL OCCURS {_getchar} {0}      ; |i2cparam.c:195| 
	.dwpsn	file "i2cparam.c",line 198,column 5,is_stmt
;----------------------------------------------------------------------
; 198 | hwPllSetPll (MAIN_PLL,                                                 
; 199 |              ibl.pllConfig[ibl_MAIN_PLL].prediv,         /* Pre-divider
;     |   */                                                                   
; 200 |              ibl.pllConfig[ibl_MAIN_PLL].mult,           /* Multiplier
;     |   */                                                                   
; 201 |              ibl.pllConfig[ibl_MAIN_PLL].postdiv);       /* Post-divide
;     | r */                                                                   
;----------------------------------------------------------------------
           MVKL    .S1     _hwPllSetPll,A3

           MVKH    .S1     _hwPllSetPll,A3
||         MV      .L1     A12,A4

           LDW     .D1T2   *+A4(16),B6       ; |i2cparam.c:198| 
$C$DW$77	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$77, DW_AT_low_pc(0x00)
	.dwattr $C$DW$77, DW_AT_name("_hwPllSetPll")
	.dwattr $C$DW$77, DW_AT_TI_call

           CALL    .S2X    A3                ; |i2cparam.c:198| 
||         LDW     .D1T1   *+A4(12),A6       ; |i2cparam.c:198| 

           LDW     .D1T2   *+A4(8),B4        ; |i2cparam.c:198| 
           ADDKPC  .S2     $C$RL4,B3,2       ; |i2cparam.c:198| 
           ZERO    .L1     A4                ; |i2cparam.c:198| 
$C$RL4:    ; CALL OCCURS {_hwPllSetPll} {0}  ; |i2cparam.c:198| 
	.dwpsn	file "i2cparam.c",line 204,column 5,is_stmt
;----------------------------------------------------------------------
; 204 | hwI2Cinit (ibl.pllConfig[ibl_MAIN_PLL].pllOutFreqMhz,  /* The CPU frequ
;     | ency during I2C data load */                                           
; 205 |            DEVICE_I2C_MODULE_DIVISOR,                  /* The divide do
;     | wn of CPU that drives the i2c */                                       
; 206 |            IBL_CFG_I2C_CLK_FREQ_KHZ/8,                 /* The I2C data
;     | rate used during table load. Slowed for writes */                      
; 207 |            IBL_CFG_I2C_OWN_ADDR);                      /* The address u
;     | sed by this device on the i2c bus */                                   
;----------------------------------------------------------------------
           MVKL    .S1     _hwI2Cinit,A3
           MVKH    .S1     _hwI2Cinit,A3
           MV      .L1     A12,A4
$C$DW$78	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$78, DW_AT_low_pc(0x00)
	.dwattr $C$DW$78, DW_AT_name("_hwI2Cinit")
	.dwattr $C$DW$78, DW_AT_TI_call
           CALL    .S2X    A3                ; |i2cparam.c:204| 
           LDHU    .D1T1   *+A4(20),A4       ; |i2cparam.c:204| 
           MVK     .L2     0x6,B4            ; |i2cparam.c:204| 
           ADDKPC  .S2     $C$RL5,B3,1       ; |i2cparam.c:204| 

           MVK     .S1     0x32,A6           ; |i2cparam.c:204| 
||         MVK     .L2     0xa,B6            ; |i2cparam.c:204| 

$C$RL5:    ; CALL OCCURS {_hwI2Cinit} {0}    ; |i2cparam.c:204| 
	.dwpsn	file "i2cparam.c",line 211,column 5,is_stmt
;----------------------------------------------------------------------
; 211 | ibl.chkSum = 0;                                                        
;----------------------------------------------------------------------
           MVKL    .S2     _ibl+746,B5

           MVKH    .S2     _ibl+746,B5
||         ZERO    .L2     B0                ; |i2cparam.c:211| 

           STH     .D2T2   B0,*B5            ; |i2cparam.c:211| 
	.dwpsn	file "i2cparam.c",line 212,column 5,is_stmt
;----------------------------------------------------------------------
; 212 | chk = onesComplementChksum ((uint16 *)&ibl, sizeof(ibl_t)/sizeof(uint16
;     | ));                                                                    
;----------------------------------------------------------------------
           MVKL    .S1     _onesComplementChksum,A3
           MVKH    .S1     _onesComplementChksum,A3
           MVK     .S2     0x76,B4
$C$DW$79	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$79, DW_AT_low_pc(0x00)
	.dwattr $C$DW$79, DW_AT_name("_onesComplementChksum")
	.dwattr $C$DW$79, DW_AT_TI_call
           CALL    .S2X    A3                ; |i2cparam.c:212| 
           SET     .S2     B4,0x8,0x8,B4
           ADDKPC  .S2     $C$RL6,B3,2       ; |i2cparam.c:212| 
           MV      .L1     A12,A4            ; |i2cparam.c:212| 
$C$RL6:    ; CALL OCCURS {_onesComplementChksum} {0}  ; |i2cparam.c:212| 
	.dwpsn	file "i2cparam.c",line 213,column 5,is_stmt
;----------------------------------------------------------------------
; 213 | if (ibl.chkSum != 0xffff)                                              
;----------------------------------------------------------------------
           MV      .L2     B5,B4             ; |i2cparam.c:213| 
           LDHU    .D2T2   *B4,B0            ; |i2cparam.c:213| 
           ZERO    .L2     B1
           SET     .S2     B1,0x0,0xf,B1
           NOP             2
           CMPEQ   .L2     B0,B1,B0          ; |i2cparam.c:213| 
   [ B0]   BNOP    .S1     $C$L20,5          ; |i2cparam.c:213| 
           ; BRANCHCC OCCURS {$C$L20}        ; |i2cparam.c:213| 
;** --------------------------------------------------------------------------*
	.dwpsn	file "i2cparam.c",line 214,column 7,is_stmt
;----------------------------------------------------------------------
; 214 | ibl.chkSum = ~chk;                                                     
;----------------------------------------------------------------------
           NOT     .L1     A4,A0             ; |i2cparam.c:214| 
           STH     .D2T1   A0,*B4            ; |i2cparam.c:214| 
;** --------------------------------------------------------------------------*
$C$L20:    
	.dwpsn	file "i2cparam.c",line 220,column 5,is_stmt
;----------------------------------------------------------------------
; 220 | currentOffset = 0;                                                     
; 221 | do  {                                                                  
;----------------------------------------------------------------------
           ZERO    .L2     B0                ; |i2cparam.c:220| 
           STW     .D2T2   B0,*+SP(12)       ; |i2cparam.c:220| 
	.dwpsn	file "i2cparam.c",line 198,column 5,is_stmt
	.dwpsn	file "i2cparam.c",line 192,column 5,is_stmt
           MVK     .S2     0x2ec,B10         ; |i2cparam.c:192| 
;** --------------------------------------------------------------------------*
;**   BEGIN LOOP $C$L21
;** --------------------------------------------------------------------------*
$C$L21:    
$C$DW$L$_main$5$B:
	.dwpsn	file "i2cparam.c",line 223,column 9,is_stmt
;----------------------------------------------------------------------
; 223 | n = formBlock ((UINT8 *)&ibl, sizeof(ibl_t), &currentOffset, writeBlock
;     | , configAddress);                                                      
; 225 | if (n > 0)  {                                                          
;----------------------------------------------------------------------
           MVKL    .S1     _formBlock,A3
           MVKH    .S1     _formBlock,A3
           MV      .L1     A14,A4
$C$DW$80	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$80, DW_AT_low_pc(0x00)
	.dwattr $C$DW$80, DW_AT_name("_formBlock")
	.dwattr $C$DW$80, DW_AT_TI_call
           CALL    .S2X    A3                ; |i2cparam.c:223| 
           LDW     .D1T1   *A4,A8            ; |i2cparam.c:223| 
           ADDKPC  .S2     $C$RL7,B3,2       ; |i2cparam.c:223| 

           MV      .L1     A12,A4            ; |i2cparam.c:223| 
||         MV      .L2     B10,B4            ; |i2cparam.c:223| 
||         ADD     .S1X    12,SP,A6          ; |i2cparam.c:223| 
||         ADDAW   .D2     SP,4,B6           ; |i2cparam.c:223| 

$C$RL7:    ; CALL OCCURS {_formBlock} {0}    ; |i2cparam.c:223| 
           CMPGT   .L1     A4,0,A0           ; |i2cparam.c:223| 
   [!A0]   BNOP    .S1     $C$L25,4          ; |i2cparam.c:223| 
           MV      .L1     A4,A10            ; |i2cparam.c:223| 
           ; BRANCHCC OCCURS {$C$L25}        ; |i2cparam.c:223| 
$C$DW$L$_main$5$E:
;** --------------------------------------------------------------------------*
$C$DW$L$_main$6$B:
	.dwpsn	file "i2cparam.c",line 227,column 13,is_stmt
;----------------------------------------------------------------------
; 227 | iret = hwI2cMasterWrite (configBusAddress,   /* The I2C bus address of
;     | the eeprom */                                                          
; 228 |                          writeBlock,         /* The data to write */   
; 229 |                          n,                  /* The number of bytes to
;     | write */                                                               
; 230 |                          I2C_RELEASE_BUS,    /* Release the bus when th
;     | e write is done */                                                     
; 231 |                          FALSE );            /* Bus is not owned at sta
;     | rt of operation */                                                     
;----------------------------------------------------------------------
           MVKL    .S2     _hwI2cMasterWrite,B5

           MVKH    .S2     _hwI2cMasterWrite,B5
||         MVKL    .S1     _configBusAddress,A4

$C$DW$81	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$81, DW_AT_low_pc(0x00)
	.dwattr $C$DW$81, DW_AT_name("_hwI2cMasterWrite")
	.dwattr $C$DW$81, DW_AT_TI_call

           CALL    .S2     B5                ; |i2cparam.c:227| 
||         MVKH    .S1     _configBusAddress,A4

           LDW     .D1T1   *A4,A4            ; |i2cparam.c:227| 
           ADDKPC  .S2     $C$RL8,B3,2       ; |i2cparam.c:227| 

           ADDAW   .D2     SP,4,B4           ; |i2cparam.c:227| 
||         MV      .L1     A10,A6            ; |i2cparam.c:227| 
||         ZERO    .L2     B6                ; |i2cparam.c:227| 
||         ZERO    .S1     A8                ; |i2cparam.c:227| 

$C$RL8:    ; CALL OCCURS {_hwI2cMasterWrite} {0}  ; |i2cparam.c:227| 
           MV      .L1     A4,A11            ; |i2cparam.c:227| 
	.dwpsn	file "i2cparam.c",line 233,column 13,is_stmt
;----------------------------------------------------------------------
; 233 | if (iret != I2C_RET_OK)  {                                             
; 234 |     sprintf (iline, "Block at offset %d\n", currentOffset);            
; 235 |     showI2cError (iret, iline);                                        
; 236 |     return;                                                            
;----------------------------------------------------------------------
           MV      .L1     A11,A0            ; |i2cparam.c:233| 
   [ A0]   BNOP    .S1     $C$L26,4          ; |i2cparam.c:233| 
           LDW     .D2T2   *+SP(12),B0       ; |i2cparam.c:233| 
           ; BRANCHCC OCCURS {$C$L26}        ; |i2cparam.c:233| 
$C$DW$L$_main$6$E:
;** --------------------------------------------------------------------------*
$C$DW$L$_main$7$B:
           NOP             4
	.dwpsn	file "i2cparam.c",line 240,column 18,is_stmt
;----------------------------------------------------------------------
; 240 | for (i = 0; i < 600000; i++);                                          
;----------------------------------------------------------------------
           ZERO    .L2     B0                ; |i2cparam.c:240| 
           STW     .D2T2   B0,*+SP(224)      ; |i2cparam.c:240| 
	.dwpsn	file "i2cparam.c",line 240,column 25,is_stmt
           LDW     .D2T2   *+SP(224),B0      ; |i2cparam.c:240| 
           MVKL    .S2     0x927c0,B1
           MVKH    .S2     0x927c0,B1
           NOP             2
           CMPLT   .L2     B0,B1,B0          ; |i2cparam.c:240| 
   [!B0]   BNOP    .S1     $C$L25,5          ; |i2cparam.c:240| 
           ; BRANCHCC OCCURS {$C$L25}        ; |i2cparam.c:240| 
$C$DW$L$_main$7$E:
;** --------------------------------------------------------------------------*
$C$DW$L$_main$8$B:

           MVK     .L2     0x1,B2
||         MV      .S2     B1,B4

$C$DW$L$_main$8$E:
;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*
;*      Loop found in file               : i2cparam.c
;*      Loop source line                 : 240
;*      Loop closing brace source line   : 240
;*      Known Minimum Trip Count         : 1                    
;*      Known Max Trip Count Factor      : 1
;*      Loop Carried Dependency Bound(^) : 8
;*      Unpartitioned Resource Bound     : 2
;*      Partitioned Resource Bound(*)    : 3
;*      Resource Partition:
;*                                A-side   B-side
;*      .L units                     0        1     
;*      .S units                     0        0     
;*      .D units                     0        3*    
;*      .M units                     0        0     
;*      .X cross paths               0        0     
;*      .T address paths             2        1     
;*      Long read paths              0        0     
;*      Long write paths             0        0     
;*      Logical  ops (.LS)           1        0     (.L or .S unit)
;*      Addition ops (.LSD)          0        1     (.L or .S or .D unit)
;*      Bound(.L .S .LS)             1        1     
;*      Bound(.L .S .D .LS .LSD)     1        2     
;*
;*      Searching for software pipeline schedule at ...
;*         ii = 8  Unsafe schedule for irregular loop
;*         ii = 8  Unsafe schedule for irregular loop
;*         ii = 8  Unsafe schedule for irregular loop
;*         ii = 8  Did not find schedule
;*         ii = 9  Unsafe schedule for irregular loop
;*         ii = 9  Unsafe schedule for irregular loop
;*         ii = 9  Unsafe schedule for irregular loop
;*         ii = 9  Did not find schedule
;*         ii = 10 Unsafe schedule for irregular loop
;*         ii = 10 Unsafe schedule for irregular loop
;*         ii = 10 Unsafe schedule for irregular loop
;*         ii = 10 Did not find schedule
;*         ii = 11 Unsafe schedule for irregular loop
;*         ii = 11 Unsafe schedule for irregular loop
;*         ii = 11 Unsafe schedule for irregular loop
;*         ii = 11 Did not find schedule
;*         ii = 12 Unsafe schedule for irregular loop
;*         ii = 12 Unsafe schedule for irregular loop
;*         ii = 12 Unsafe schedule for irregular loop
;*         ii = 12 Did not find schedule
;*         ii = 13 Unsafe schedule for irregular loop
;*         ii = 13 Unsafe schedule for irregular loop
;*         ii = 13 Unsafe schedule for irregular loop
;*         ii = 13 Did not find schedule
;*         ii = 14 Schedule found with 2 iterations in parallel
;*      Done
;*
;*      Loop will be splooped
;*      Collapsed epilog stages       : 1
;*      Collapsed prolog stages       : 0
;*      Minimum required memory pad   : 0 bytes
;*
;*      Minimum safe trip count       : 1
;*----------------------------------------------------------------------------*
$C$L22:    ; PIPED LOOP PROLOG
   [ B2]   SPLOOPW 14      ;28               ; (P) 
;** --------------------------------------------------------------------------*
$C$L23:    ; PIPED LOOP KERNEL
$C$DW$L$_main$10$B:
           NOP             9
           NOP             1
   [ B2]   LDW     .D2T1   *+SP(224),A0      ; |i2cparam.c:240| (P) <0,10>  ^ 
           NOP             4
           ADD     .L1     1,A0,A1           ; |i2cparam.c:240| <0,15>  ^ 
           STW     .D2T1   A1,*+SP(224)      ; |i2cparam.c:240| <0,16>  ^ 
           LDW     .D2T2   *+SP(224),B3      ; |i2cparam.c:240| <0,17>  ^ 
           NOP             4
           CMPLT   .L2     B3,B4,B1          ; |i2cparam.c:240| <0,22> 
           MV      .L2     B1,B2             ; |i2cparam.c:240| <0,23> 
           NOP             2
           NOP             1
           SPKERNEL 0,0
$C$DW$L$_main$10$E:
;** --------------------------------------------------------------------------*
$C$L24:    ; PIPED LOOP EPILOG
;** --------------------------------------------------------------------------*
$C$L25:    
$C$DW$L$_main$12$B:
           NOP             1
	.dwpsn	file "i2cparam.c",line 244,column 14,is_stmt
;----------------------------------------------------------------------
; 244 | } while (n > 0);                                                       
;----------------------------------------------------------------------
           MV      .L1     A10,A0
           CMPGT   .L1     A0,0,A0           ; |i2cparam.c:244| 
   [ A0]   BNOP    .S1     $C$L21,5          ; |i2cparam.c:244| 
           ; BRANCHCC OCCURS {$C$L21}        ; |i2cparam.c:244| 
$C$DW$L$_main$12$E:
;** --------------------------------------------------------------------------*
	.dwpsn	file "i2cparam.c",line 248,column 5,is_stmt
;----------------------------------------------------------------------
; 248 | printf ("I2c table write complete\n");                                 
;----------------------------------------------------------------------
$C$DW$82	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$82, DW_AT_low_pc(0x00)
	.dwattr $C$DW$82, DW_AT_name("_printf")
	.dwattr $C$DW$82, DW_AT_TI_call
           CALL    .S2X    A13               ; |i2cparam.c:248| 
           MVKL    .S2     $C$SL9+0,B0
           MVKH    .S2     $C$SL9+0,B0
           STW     .D2T2   B0,*+SP(4)        ; |i2cparam.c:248| 
           ADDKPC  .S2     $C$RL9,B3,1       ; |i2cparam.c:248| 
$C$RL9:    ; CALL OCCURS {_printf} {0}       ; |i2cparam.c:248| 
	.dwpsn	file "i2cparam.c",line 250,column 1,is_stmt
           BNOP    .S1     $C$L28,5          ; |i2cparam.c:250| 
           ; BRANCH OCCURS {$C$L28}          ; |i2cparam.c:250| 
;** --------------------------------------------------------------------------*
$C$L26:    
	.dwpsn	file "i2cparam.c",line 234,column 17,is_stmt
           MVKL    .S1     _sprintf,A3
           MVKH    .S1     _sprintf,A3
           MVKL    .S1     $C$SL10+0,A0
$C$DW$83	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$83, DW_AT_low_pc(0x00)
	.dwattr $C$DW$83, DW_AT_name("_sprintf")
	.dwattr $C$DW$83, DW_AT_TI_call
           CALL    .S2X    A3                ; |i2cparam.c:234| 
           MVKH    .S1     $C$SL10+0,A0
           STW     .D2T2   B0,*+SP(8)        ; |i2cparam.c:234| 
           ADDKPC  .S2     $C$RL10,B3,1      ; |i2cparam.c:234| 

           STW     .D2T1   A0,*+SP(4)        ; |i2cparam.c:234| 
||         ADDAW   .D1X    SP,22,A4          ; |i2cparam.c:234| 

$C$RL10:   ; CALL OCCURS {_sprintf} {0}      ; |i2cparam.c:234| 
	.dwpsn	file "i2cparam.c",line 235,column 17,is_stmt
           MVKL    .S2     _showI2cError,B5
           MVKH    .S2     _showI2cError,B5
$C$DW$84	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$84, DW_AT_low_pc(0x00)
	.dwattr $C$DW$84, DW_AT_name("_showI2cError")
	.dwattr $C$DW$84, DW_AT_TI_call
           CALL    .S2     B5                ; |i2cparam.c:235| 
           ADDKPC  .S2     $C$RL11,B3,3      ; |i2cparam.c:235| 

           ADDAW   .D2     SP,22,B4          ; |i2cparam.c:235| 
||         MV      .L1     A11,A4            ; |i2cparam.c:235| 

$C$RL11:   ; CALL OCCURS {_showI2cError} {0}  ; |i2cparam.c:235| 
	.dwpsn	file "i2cparam.c",line 236,column 17,is_stmt
           BNOP    .S1     $C$L28,5          ; |i2cparam.c:236| 
           ; BRANCH OCCURS {$C$L28}          ; |i2cparam.c:236| 
;** --------------------------------------------------------------------------*
$C$L27:    
	.dwpsn	file "i2cparam.c",line 184,column 7,is_stmt
           MVKL    .S1     _printf,A10
           MVKH    .S1     _printf,A10
           MVKL    .S2     $C$SL11+0,B0
$C$DW$85	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$85, DW_AT_low_pc(0x00)
	.dwattr $C$DW$85, DW_AT_name("_printf")
	.dwattr $C$DW$85, DW_AT_TI_call
           CALL    .S2X    A10               ; |i2cparam.c:184| 
           MVKH    .S2     $C$SL11+0,B0
           ADDKPC  .S2     $C$RL12,B3,2      ; |i2cparam.c:184| 
           STW     .D2T2   B0,*+SP(4)        ; |i2cparam.c:184| 
$C$RL12:   ; CALL OCCURS {_printf} {0}       ; |i2cparam.c:184| 
	.dwpsn	file "i2cparam.c",line 185,column 7,is_stmt
$C$DW$86	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$86, DW_AT_low_pc(0x00)
	.dwattr $C$DW$86, DW_AT_name("_printf")
	.dwattr $C$DW$86, DW_AT_TI_call
           CALL    .S2X    A10               ; |i2cparam.c:185| 
           MVKL    .S1     $C$SL12+0,A0
           MVKH    .S1     $C$SL12+0,A0
           STW     .D2T1   A0,*+SP(4)        ; |i2cparam.c:185| 
           ADDKPC  .S2     $C$RL13,B3,1      ; |i2cparam.c:185| 
$C$RL13:   ; CALL OCCURS {_printf} {0}       ; |i2cparam.c:185| 
	.dwpsn	file "i2cparam.c",line 186,column 7,is_stmt
$C$DW$87	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$87, DW_AT_low_pc(0x00)
	.dwattr $C$DW$87, DW_AT_name("_printf")
	.dwattr $C$DW$87, DW_AT_TI_call
           CALL    .S2X    A10               ; |i2cparam.c:186| 
           MVKL    .S1     $C$SL13+0,A0
           MVKH    .S1     $C$SL13+0,A0
           STW     .D2T1   A0,*+SP(4)        ; |i2cparam.c:186| 
           ADDKPC  .S2     $C$RL14,B3,1      ; |i2cparam.c:186| 
$C$RL14:   ; CALL OCCURS {_printf} {0}       ; |i2cparam.c:186| 
	.dwpsn	file "i2cparam.c",line 187,column 7,is_stmt
$C$DW$88	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$88, DW_AT_low_pc(0x00)
	.dwattr $C$DW$88, DW_AT_name("_printf")
	.dwattr $C$DW$88, DW_AT_TI_call
           CALL    .S2X    A10               ; |i2cparam.c:187| 
           MVKL    .S1     $C$SL14+0,A0
           MVKH    .S1     $C$SL14+0,A0
           STW     .D2T1   A0,*+SP(4)        ; |i2cparam.c:187| 
           ADDKPC  .S2     $C$RL15,B3,1      ; |i2cparam.c:187| 
$C$RL15:   ; CALL OCCURS {_printf} {0}       ; |i2cparam.c:187| 
	.dwpsn	file "i2cparam.c",line 188,column 7,is_stmt
$C$DW$89	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$89, DW_AT_low_pc(0x00)
	.dwattr $C$DW$89, DW_AT_name("_printf")
	.dwattr $C$DW$89, DW_AT_TI_call
           CALL    .S2X    A10               ; |i2cparam.c:188| 
           MVKL    .S2     $C$SL15+0,B0
           MVKH    .S2     $C$SL15+0,B0
           STW     .D2T2   B0,*+SP(4)        ; |i2cparam.c:188| 
           ADDKPC  .S2     $C$RL16,B3,1      ; |i2cparam.c:188| 
$C$RL16:   ; CALL OCCURS {_printf} {0}       ; |i2cparam.c:188| 
;** --------------------------------------------------------------------------*
$C$L28:    
	.dwpsn	file "i2cparam.c",line 250,column 1,is_stmt
           ADDK    .S2     224,SP            ; |i2cparam.c:250| 
	.dwcfi	cfa_offset, 40
           LDDW    .D2T1   *++SP,A11:A10
	.dwcfi	cfa_offset, 32
	.dwcfi	restore_reg, 11
	.dwcfi	restore_reg, 10
           LDDW    .D2T1   *++SP,A13:A12
	.dwcfi	cfa_offset, 24
	.dwcfi	restore_reg, 13
	.dwcfi	restore_reg, 12
           LDW     .D2T1   *++SP(8),A14
	.dwcfi	cfa_offset, 16
	.dwcfi	restore_reg, 14
           LDW     .D2T2   *++SP(8),B3
           NOP             3
	.dwcfi	cfa_offset, 8
	.dwcfi	restore_reg, 19
           LDW     .D2T2   *++SP(8),B10      ; |i2cparam.c:250| 
	.dwcfi	cfa_offset, 0
	.dwcfi	restore_reg, 26
	.dwcfi	cfa_offset, 0
$C$DW$90	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$90, DW_AT_low_pc(0x00)
	.dwattr $C$DW$90, DW_AT_TI_return
           RETNOP  .S2     B3,5
           ; BRANCH OCCURS {B3}  

$C$DW$91	.dwtag  DW_TAG_TI_loop
	.dwattr $C$DW$91, DW_AT_name("D:\workspace\PR6100B\dsp\IBL\ibl\src\util\i2cConfig\i2cparam.asm:$C$L21:1:1509635954")
	.dwattr $C$DW$91, DW_AT_TI_begin_file("i2cparam.c")
	.dwattr $C$DW$91, DW_AT_TI_begin_line(0xdd)
	.dwattr $C$DW$91, DW_AT_TI_end_line(0xf4)
$C$DW$92	.dwtag  DW_TAG_TI_loop_range
	.dwattr $C$DW$92, DW_AT_low_pc($C$DW$L$_main$5$B)
	.dwattr $C$DW$92, DW_AT_high_pc($C$DW$L$_main$5$E)
$C$DW$93	.dwtag  DW_TAG_TI_loop_range
	.dwattr $C$DW$93, DW_AT_low_pc($C$DW$L$_main$8$B)
	.dwattr $C$DW$93, DW_AT_high_pc($C$DW$L$_main$8$E)
$C$DW$94	.dwtag  DW_TAG_TI_loop_range
	.dwattr $C$DW$94, DW_AT_low_pc($C$DW$L$_main$6$B)
	.dwattr $C$DW$94, DW_AT_high_pc($C$DW$L$_main$6$E)
$C$DW$95	.dwtag  DW_TAG_TI_loop_range
	.dwattr $C$DW$95, DW_AT_low_pc($C$DW$L$_main$7$B)
	.dwattr $C$DW$95, DW_AT_high_pc($C$DW$L$_main$7$E)
$C$DW$96	.dwtag  DW_TAG_TI_loop_range
	.dwattr $C$DW$96, DW_AT_low_pc($C$DW$L$_main$12$B)
	.dwattr $C$DW$96, DW_AT_high_pc($C$DW$L$_main$12$E)

$C$DW$97	.dwtag  DW_TAG_TI_loop
	.dwattr $C$DW$97, DW_AT_name("D:\workspace\PR6100B\dsp\IBL\ibl\src\util\i2cConfig\i2cparam.asm:$C$L23:2:1509635954")
	.dwattr $C$DW$97, DW_AT_TI_begin_file("i2cparam.c")
	.dwattr $C$DW$97, DW_AT_TI_begin_line(0xf0)
	.dwattr $C$DW$97, DW_AT_TI_end_line(0xf0)
$C$DW$98	.dwtag  DW_TAG_TI_loop_range
	.dwattr $C$DW$98, DW_AT_low_pc($C$DW$L$_main$10$B)
	.dwattr $C$DW$98, DW_AT_high_pc($C$DW$L$_main$10$E)
	.dwendtag $C$DW$97

	.dwendtag $C$DW$91

	.dwattr $C$DW$66, DW_AT_TI_end_file("i2cparam.c")
	.dwattr $C$DW$66, DW_AT_TI_end_line(0xfa)
	.dwattr $C$DW$66, DW_AT_TI_end_column(0x01)
	.dwendentry
	.dwendtag $C$DW$66

;******************************************************************************
;* STRINGS                                                                    *
;******************************************************************************
	.sect	".const:.string"
$C$SL1:	.string	"I2C driver reported a general error",0
$C$SL2:	.string	"I2C driver found the bus stuck low",0
$C$SL3:	.string	"I2C driver detected a bad data request",0
$C$SL4:	.string	"I2C timed out",0
$C$SL5:	.string	"I2C master detected no ack from slave",0
$C$SL6:	.string	"I2C master lost an arbitration battle",0
$C$SL7:	.string	"Error: %s, reported at stage: %s",10,0
$C$SL8:	.string	"Run the GEL for for the device to be configured, press retu"
	.string	"rn to program the I2C",10,0
$C$SL9:	.string	"I2c table write complete",10,0
$C$SL10:	.string	"Block at offset %d",10,0
$C$SL11:	.string	"Error: The global variable config address must be setup pri"
	.string	"or to running this program",10,0
$C$SL12:	.string	"       This is the address in the I2C eeprom where the para"
	.string	"meters live. On configurations",10,0
$C$SL13:	.string	"       which support both big and little endian it is possi"
	.string	"ble to configure the IBL to",10,0
$C$SL14:	.string	"       usage a different configuration table for each endia"
	.string	"n, so this program must be run",10,0
$C$SL15:	.string	"       twice. The value 0 is invalid for configAddress",10,0
;*****************************************************************************
;* UNDEFINED EXTERNAL REFERENCES                                             *
;*****************************************************************************
	.global	_hwI2Cinit
	.global	_hwI2cMasterWrite
	.global	_hwPllSetPll
	.global	_memset
	.global	_printf
	.global	_sprintf
	.global	_getchar

;******************************************************************************
;* BUILD ATTRIBUTES                                                           *
;******************************************************************************
	.battr "TI", Tag_File, 1, Tag_ABI_stack_align_needed(0)
	.battr "TI", Tag_File, 1, Tag_ABI_stack_align_preserved(0)
	.battr "TI", Tag_File, 1, Tag_Tramps_Use_SOC(1)

;******************************************************************************
;* TYPE INFORMATION                                                           *
;******************************************************************************

$C$DW$T$21	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$21, DW_AT_byte_size(0x64)
$C$DW$99	.dwtag  DW_TAG_member
	.dwattr $C$DW$99, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$99, DW_AT_name("emif3p1")
	.dwattr $C$DW$99, DW_AT_TI_symbol_name("_emif3p1")
	.dwattr $C$DW$99, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$99, DW_AT_accessibility(DW_ACCESS_public)
$C$DW$100	.dwtag  DW_TAG_member
	.dwattr $C$DW$100, DW_AT_type(*$C$DW$T$20)
	.dwattr $C$DW$100, DW_AT_name("emif4p0")
	.dwattr $C$DW$100, DW_AT_TI_symbol_name("_emif4p0")
	.dwattr $C$DW$100, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$100, DW_AT_accessibility(DW_ACCESS_public)
	.dwendtag $C$DW$T$21


$C$DW$T$25	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$25, DW_AT_byte_size(0x84)
$C$DW$101	.dwtag  DW_TAG_member
	.dwattr $C$DW$101, DW_AT_type(*$C$DW$T$22)
	.dwattr $C$DW$101, DW_AT_name("ethBoot")
	.dwattr $C$DW$101, DW_AT_TI_symbol_name("_ethBoot")
	.dwattr $C$DW$101, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$101, DW_AT_accessibility(DW_ACCESS_public)
$C$DW$102	.dwtag  DW_TAG_member
	.dwattr $C$DW$102, DW_AT_type(*$C$DW$T$23)
	.dwattr $C$DW$102, DW_AT_name("nandBoot")
	.dwattr $C$DW$102, DW_AT_TI_symbol_name("_nandBoot")
	.dwattr $C$DW$102, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$102, DW_AT_accessibility(DW_ACCESS_public)
$C$DW$103	.dwtag  DW_TAG_member
	.dwattr $C$DW$103, DW_AT_type(*$C$DW$T$24)
	.dwattr $C$DW$103, DW_AT_name("norBoot")
	.dwattr $C$DW$103, DW_AT_TI_symbol_name("_norBoot")
	.dwattr $C$DW$103, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$103, DW_AT_accessibility(DW_ACCESS_public)
	.dwendtag $C$DW$T$25

$C$DW$T$3	.dwtag  DW_TAG_pointer_type
	.dwattr $C$DW$T$3, DW_AT_address_class(0x20)
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
$C$DW$T$107	.dwtag  DW_TAG_typedef, DW_AT_name("UINT8")
	.dwattr $C$DW$T$107, DW_AT_type(*$C$DW$T$6)
	.dwattr $C$DW$T$107, DW_AT_language(DW_LANG_C)
$C$DW$T$108	.dwtag  DW_TAG_pointer_type
	.dwattr $C$DW$T$108, DW_AT_type(*$C$DW$T$107)
	.dwattr $C$DW$T$108, DW_AT_address_class(0x20)
$C$DW$T$109	.dwtag  DW_TAG_const_type
	.dwattr $C$DW$T$109, DW_AT_type(*$C$DW$T$108)

$C$DW$T$110	.dwtag  DW_TAG_array_type
	.dwattr $C$DW$T$110, DW_AT_type(*$C$DW$T$107)
	.dwattr $C$DW$T$110, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$110, DW_AT_byte_size(0x42)
$C$DW$104	.dwtag  DW_TAG_subrange_type
	.dwattr $C$DW$104, DW_AT_upper_bound(0x41)
	.dwendtag $C$DW$T$110

$C$DW$T$111	.dwtag  DW_TAG_typedef, DW_AT_name("Uint8")
	.dwattr $C$DW$T$111, DW_AT_type(*$C$DW$T$6)
	.dwattr $C$DW$T$111, DW_AT_language(DW_LANG_C)
$C$DW$T$112	.dwtag  DW_TAG_pointer_type
	.dwattr $C$DW$T$112, DW_AT_type(*$C$DW$T$111)
	.dwattr $C$DW$T$112, DW_AT_address_class(0x20)
$C$DW$T$113	.dwtag  DW_TAG_const_type
	.dwattr $C$DW$T$113, DW_AT_type(*$C$DW$T$112)
$C$DW$T$35	.dwtag  DW_TAG_typedef, DW_AT_name("uint8")
	.dwattr $C$DW$T$35, DW_AT_type(*$C$DW$T$6)
	.dwattr $C$DW$T$35, DW_AT_language(DW_LANG_C)

$C$DW$T$36	.dwtag  DW_TAG_array_type
	.dwattr $C$DW$T$36, DW_AT_type(*$C$DW$T$35)
	.dwattr $C$DW$T$36, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$36, DW_AT_byte_size(0x04)
$C$DW$105	.dwtag  DW_TAG_subrange_type
	.dwattr $C$DW$105, DW_AT_upper_bound(0x03)
	.dwendtag $C$DW$T$36


$C$DW$T$37	.dwtag  DW_TAG_array_type
	.dwattr $C$DW$T$37, DW_AT_type(*$C$DW$T$35)
	.dwattr $C$DW$T$37, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$37, DW_AT_byte_size(0x06)
$C$DW$106	.dwtag  DW_TAG_subrange_type
	.dwattr $C$DW$106, DW_AT_upper_bound(0x05)
	.dwendtag $C$DW$T$37


$C$DW$T$72	.dwtag  DW_TAG_array_type
	.dwattr $C$DW$T$72, DW_AT_type(*$C$DW$T$35)
	.dwattr $C$DW$T$72, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$72, DW_AT_byte_size(0x0a)
$C$DW$107	.dwtag  DW_TAG_subrange_type
	.dwattr $C$DW$107, DW_AT_upper_bound(0x09)
	.dwendtag $C$DW$T$72


$C$DW$T$73	.dwtag  DW_TAG_array_type
	.dwattr $C$DW$T$73, DW_AT_type(*$C$DW$T$35)
	.dwattr $C$DW$T$73, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$73, DW_AT_byte_size(0x02)
$C$DW$108	.dwtag  DW_TAG_subrange_type
	.dwattr $C$DW$108, DW_AT_upper_bound(0x01)
	.dwendtag $C$DW$T$73

$C$DW$T$7	.dwtag  DW_TAG_base_type
	.dwattr $C$DW$T$7, DW_AT_encoding(DW_ATE_signed_char)
	.dwattr $C$DW$T$7, DW_AT_name("wchar_t")
	.dwattr $C$DW$T$7, DW_AT_byte_size(0x02)
$C$DW$T$8	.dwtag  DW_TAG_base_type
	.dwattr $C$DW$T$8, DW_AT_encoding(DW_ATE_signed)
	.dwattr $C$DW$T$8, DW_AT_name("short")
	.dwattr $C$DW$T$8, DW_AT_byte_size(0x02)
$C$DW$T$117	.dwtag  DW_TAG_typedef, DW_AT_name("BOOL")
	.dwattr $C$DW$T$117, DW_AT_type(*$C$DW$T$8)
	.dwattr $C$DW$T$117, DW_AT_language(DW_LANG_C)
$C$DW$T$33	.dwtag  DW_TAG_typedef, DW_AT_name("bool")
	.dwattr $C$DW$T$33, DW_AT_type(*$C$DW$T$8)
	.dwattr $C$DW$T$33, DW_AT_language(DW_LANG_C)
$C$DW$T$32	.dwtag  DW_TAG_typedef, DW_AT_name("int16")
	.dwattr $C$DW$T$32, DW_AT_type(*$C$DW$T$8)
	.dwattr $C$DW$T$32, DW_AT_language(DW_LANG_C)
$C$DW$T$9	.dwtag  DW_TAG_base_type
	.dwattr $C$DW$T$9, DW_AT_encoding(DW_ATE_unsigned)
	.dwattr $C$DW$T$9, DW_AT_name("unsigned short")
	.dwattr $C$DW$T$9, DW_AT_byte_size(0x02)
$C$DW$T$78	.dwtag  DW_TAG_typedef, DW_AT_name("UINT16")
	.dwattr $C$DW$T$78, DW_AT_type(*$C$DW$T$9)
	.dwattr $C$DW$T$78, DW_AT_language(DW_LANG_C)
$C$DW$T$81	.dwtag  DW_TAG_typedef, DW_AT_name("I2C_RET")
	.dwattr $C$DW$T$81, DW_AT_type(*$C$DW$T$78)
	.dwattr $C$DW$T$81, DW_AT_language(DW_LANG_C)
$C$DW$T$121	.dwtag  DW_TAG_const_type
	.dwattr $C$DW$T$121, DW_AT_type(*$C$DW$T$81)
$C$DW$T$45	.dwtag  DW_TAG_typedef, DW_AT_name("uint16")
	.dwattr $C$DW$T$45, DW_AT_type(*$C$DW$T$9)
	.dwattr $C$DW$T$45, DW_AT_language(DW_LANG_C)
$C$DW$T$129	.dwtag  DW_TAG_pointer_type
	.dwattr $C$DW$T$129, DW_AT_type(*$C$DW$T$45)
	.dwattr $C$DW$T$129, DW_AT_address_class(0x20)
$C$DW$T$130	.dwtag  DW_TAG_TI_restrict_type
	.dwattr $C$DW$T$130, DW_AT_type(*$C$DW$T$129)
$C$DW$T$137	.dwtag  DW_TAG_const_type
	.dwattr $C$DW$T$137, DW_AT_type(*$C$DW$T$45)
$C$DW$T$10	.dwtag  DW_TAG_base_type
	.dwattr $C$DW$T$10, DW_AT_encoding(DW_ATE_signed)
	.dwattr $C$DW$T$10, DW_AT_name("int")
	.dwattr $C$DW$T$10, DW_AT_byte_size(0x04)
$C$DW$T$138	.dwtag  DW_TAG_typedef, DW_AT_name("Int32")
	.dwattr $C$DW$T$138, DW_AT_type(*$C$DW$T$10)
	.dwattr $C$DW$T$138, DW_AT_language(DW_LANG_C)
$C$DW$T$139	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$139, DW_AT_type(*$C$DW$T$138)
$C$DW$T$140	.dwtag  DW_TAG_const_type
	.dwattr $C$DW$T$140, DW_AT_type(*$C$DW$T$138)
$C$DW$T$141	.dwtag  DW_TAG_pointer_type
	.dwattr $C$DW$T$141, DW_AT_type(*$C$DW$T$138)
	.dwattr $C$DW$T$141, DW_AT_address_class(0x20)
$C$DW$T$142	.dwtag  DW_TAG_const_type
	.dwattr $C$DW$T$142, DW_AT_type(*$C$DW$T$141)
$C$DW$T$28	.dwtag  DW_TAG_typedef, DW_AT_name("int32")
	.dwattr $C$DW$T$28, DW_AT_type(*$C$DW$T$10)
	.dwattr $C$DW$T$28, DW_AT_language(DW_LANG_C)
$C$DW$T$11	.dwtag  DW_TAG_base_type
	.dwattr $C$DW$T$11, DW_AT_encoding(DW_ATE_unsigned)
	.dwattr $C$DW$T$11, DW_AT_name("unsigned int")
	.dwattr $C$DW$T$11, DW_AT_byte_size(0x04)
$C$DW$T$122	.dwtag  DW_TAG_typedef, DW_AT_name("UINT32")
	.dwattr $C$DW$T$122, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$T$122, DW_AT_language(DW_LANG_C)
$C$DW$T$55	.dwtag  DW_TAG_typedef, DW_AT_name("Uint32")
	.dwattr $C$DW$T$55, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$T$55, DW_AT_language(DW_LANG_C)
$C$DW$T$158	.dwtag  DW_TAG_const_type
	.dwattr $C$DW$T$158, DW_AT_type(*$C$DW$T$55)
$C$DW$T$75	.dwtag  DW_TAG_typedef, DW_AT_name("size_t")
	.dwattr $C$DW$T$75, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$T$75, DW_AT_language(DW_LANG_C)
$C$DW$T$26	.dwtag  DW_TAG_typedef, DW_AT_name("uint32")
	.dwattr $C$DW$T$26, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$T$26, DW_AT_language(DW_LANG_C)

$C$DW$T$46	.dwtag  DW_TAG_array_type
	.dwattr $C$DW$T$46, DW_AT_type(*$C$DW$T$26)
	.dwattr $C$DW$T$46, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$46, DW_AT_byte_size(0x40)
$C$DW$109	.dwtag  DW_TAG_subrange_type
	.dwattr $C$DW$109, DW_AT_upper_bound(0x0f)
	.dwendtag $C$DW$T$46


$C$DW$T$48	.dwtag  DW_TAG_array_type
	.dwattr $C$DW$T$48, DW_AT_type(*$C$DW$T$26)
	.dwattr $C$DW$T$48, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$48, DW_AT_byte_size(0x08)
$C$DW$110	.dwtag  DW_TAG_subrange_type
	.dwattr $C$DW$110, DW_AT_upper_bound(0x01)
	.dwendtag $C$DW$T$48


$C$DW$T$49	.dwtag  DW_TAG_array_type
	.dwattr $C$DW$T$49, DW_AT_type(*$C$DW$T$26)
	.dwattr $C$DW$T$49, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$49, DW_AT_byte_size(0x10)
$C$DW$111	.dwtag  DW_TAG_subrange_type
	.dwattr $C$DW$111, DW_AT_upper_bound(0x01)
$C$DW$112	.dwtag  DW_TAG_subrange_type
	.dwattr $C$DW$112, DW_AT_upper_bound(0x01)
	.dwendtag $C$DW$T$49

$C$DW$T$12	.dwtag  DW_TAG_base_type
	.dwattr $C$DW$T$12, DW_AT_encoding(DW_ATE_signed)
	.dwattr $C$DW$T$12, DW_AT_name("long")
	.dwattr $C$DW$T$12, DW_AT_byte_size(0x08)
	.dwattr $C$DW$T$12, DW_AT_bit_size(0x28)
	.dwattr $C$DW$T$12, DW_AT_bit_offset(0x18)
$C$DW$T$13	.dwtag  DW_TAG_base_type
	.dwattr $C$DW$T$13, DW_AT_encoding(DW_ATE_unsigned)
	.dwattr $C$DW$T$13, DW_AT_name("unsigned long")
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
$C$DW$T$38	.dwtag  DW_TAG_base_type
	.dwattr $C$DW$T$38, DW_AT_encoding(DW_ATE_signed_char)
	.dwattr $C$DW$T$38, DW_AT_name("signed char")
	.dwattr $C$DW$T$38, DW_AT_byte_size(0x01)
$C$DW$T$82	.dwtag  DW_TAG_pointer_type
	.dwattr $C$DW$T$82, DW_AT_type(*$C$DW$T$38)
	.dwattr $C$DW$T$82, DW_AT_address_class(0x20)
$C$DW$T$161	.dwtag  DW_TAG_const_type
	.dwattr $C$DW$T$161, DW_AT_type(*$C$DW$T$82)
$C$DW$T$144	.dwtag  DW_TAG_const_type
	.dwattr $C$DW$T$144, DW_AT_type(*$C$DW$T$38)
$C$DW$T$145	.dwtag  DW_TAG_pointer_type
	.dwattr $C$DW$T$145, DW_AT_type(*$C$DW$T$144)
	.dwattr $C$DW$T$145, DW_AT_address_class(0x20)

$C$DW$T$162	.dwtag  DW_TAG_array_type
	.dwattr $C$DW$T$162, DW_AT_type(*$C$DW$T$38)
	.dwattr $C$DW$T$162, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$162, DW_AT_byte_size(0x84)
$C$DW$113	.dwtag  DW_TAG_subrange_type
	.dwattr $C$DW$113, DW_AT_upper_bound(0x83)
	.dwendtag $C$DW$T$162

$C$DW$T$39	.dwtag  DW_TAG_typedef, DW_AT_name("char8")
	.dwattr $C$DW$T$39, DW_AT_type(*$C$DW$T$38)
	.dwattr $C$DW$T$39, DW_AT_language(DW_LANG_C)

$C$DW$T$40	.dwtag  DW_TAG_array_type
	.dwattr $C$DW$T$40, DW_AT_type(*$C$DW$T$39)
	.dwattr $C$DW$T$40, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$40, DW_AT_byte_size(0x40)
$C$DW$114	.dwtag  DW_TAG_subrange_type
	.dwattr $C$DW$114, DW_AT_upper_bound(0x3f)
	.dwendtag $C$DW$T$40


$C$DW$T$27	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$27, DW_AT_name("iblBinBlob_s")
	.dwattr $C$DW$T$27, DW_AT_byte_size(0x0c)
$C$DW$115	.dwtag  DW_TAG_member
	.dwattr $C$DW$115, DW_AT_type(*$C$DW$T$26)
	.dwattr $C$DW$115, DW_AT_name("startAddress")
	.dwattr $C$DW$115, DW_AT_TI_symbol_name("_startAddress")
	.dwattr $C$DW$115, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$115, DW_AT_accessibility(DW_ACCESS_public)
$C$DW$116	.dwtag  DW_TAG_member
	.dwattr $C$DW$116, DW_AT_type(*$C$DW$T$26)
	.dwattr $C$DW$116, DW_AT_name("sizeBytes")
	.dwattr $C$DW$116, DW_AT_TI_symbol_name("_sizeBytes")
	.dwattr $C$DW$116, DW_AT_data_member_location[DW_OP_plus_uconst 0x4]
	.dwattr $C$DW$116, DW_AT_accessibility(DW_ACCESS_public)
$C$DW$117	.dwtag  DW_TAG_member
	.dwattr $C$DW$117, DW_AT_type(*$C$DW$T$26)
	.dwattr $C$DW$117, DW_AT_name("branchAddress")
	.dwattr $C$DW$117, DW_AT_TI_symbol_name("_branchAddress")
	.dwattr $C$DW$117, DW_AT_data_member_location[DW_OP_plus_uconst 0x8]
	.dwattr $C$DW$117, DW_AT_accessibility(DW_ACCESS_public)
	.dwendtag $C$DW$T$27

$C$DW$T$42	.dwtag  DW_TAG_typedef, DW_AT_name("iblBinBlob_t")
	.dwattr $C$DW$T$42, DW_AT_type(*$C$DW$T$27)
	.dwattr $C$DW$T$42, DW_AT_language(DW_LANG_C)

$C$DW$T$50	.dwtag  DW_TAG_array_type
	.dwattr $C$DW$T$50, DW_AT_type(*$C$DW$T$42)
	.dwattr $C$DW$T$50, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$50, DW_AT_byte_size(0x18)
$C$DW$118	.dwtag  DW_TAG_subrange_type
	.dwattr $C$DW$118, DW_AT_upper_bound(0x01)
	.dwendtag $C$DW$T$50


$C$DW$T$51	.dwtag  DW_TAG_array_type
	.dwattr $C$DW$T$51, DW_AT_type(*$C$DW$T$42)
	.dwattr $C$DW$T$51, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$51, DW_AT_byte_size(0x30)
$C$DW$119	.dwtag  DW_TAG_subrange_type
	.dwattr $C$DW$119, DW_AT_upper_bound(0x01)
$C$DW$120	.dwtag  DW_TAG_subrange_type
	.dwattr $C$DW$120, DW_AT_upper_bound(0x01)
	.dwendtag $C$DW$T$51


$C$DW$T$29	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$29, DW_AT_name("iblBoot_s")
	.dwattr $C$DW$T$29, DW_AT_byte_size(0x90)
$C$DW$121	.dwtag  DW_TAG_member
	.dwattr $C$DW$121, DW_AT_type(*$C$DW$T$28)
	.dwattr $C$DW$121, DW_AT_name("bootMode")
	.dwattr $C$DW$121, DW_AT_TI_symbol_name("_bootMode")
	.dwattr $C$DW$121, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$121, DW_AT_accessibility(DW_ACCESS_public)
$C$DW$122	.dwtag  DW_TAG_member
	.dwattr $C$DW$122, DW_AT_type(*$C$DW$T$26)
	.dwattr $C$DW$122, DW_AT_name("priority")
	.dwattr $C$DW$122, DW_AT_TI_symbol_name("_priority")
	.dwattr $C$DW$122, DW_AT_data_member_location[DW_OP_plus_uconst 0x4]
	.dwattr $C$DW$122, DW_AT_accessibility(DW_ACCESS_public)
$C$DW$123	.dwtag  DW_TAG_member
	.dwattr $C$DW$123, DW_AT_type(*$C$DW$T$28)
	.dwattr $C$DW$123, DW_AT_name("port")
	.dwattr $C$DW$123, DW_AT_TI_symbol_name("_port")
	.dwattr $C$DW$123, DW_AT_data_member_location[DW_OP_plus_uconst 0x8]
	.dwattr $C$DW$123, DW_AT_accessibility(DW_ACCESS_public)
$C$DW$124	.dwtag  DW_TAG_member
	.dwattr $C$DW$124, DW_AT_type(*$C$DW$T$25)
	.dwattr $C$DW$124, DW_AT_name("u")
	.dwattr $C$DW$124, DW_AT_TI_symbol_name("_u")
	.dwattr $C$DW$124, DW_AT_data_member_location[DW_OP_plus_uconst 0xc]
	.dwattr $C$DW$124, DW_AT_accessibility(DW_ACCESS_public)
	.dwendtag $C$DW$T$29

$C$DW$T$68	.dwtag  DW_TAG_typedef, DW_AT_name("iblBoot_t")
	.dwattr $C$DW$T$68, DW_AT_type(*$C$DW$T$29)
	.dwattr $C$DW$T$68, DW_AT_language(DW_LANG_C)

$C$DW$T$69	.dwtag  DW_TAG_array_type
	.dwattr $C$DW$T$69, DW_AT_type(*$C$DW$T$68)
	.dwattr $C$DW$T$69, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$69, DW_AT_byte_size(0x1b0)
$C$DW$125	.dwtag  DW_TAG_subrange_type
	.dwattr $C$DW$125, DW_AT_upper_bound(0x02)
	.dwendtag $C$DW$T$69


$C$DW$T$30	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$30, DW_AT_name("iblEmif3p1_s")
	.dwattr $C$DW$T$30, DW_AT_byte_size(0x14)
$C$DW$126	.dwtag  DW_TAG_member
	.dwattr $C$DW$126, DW_AT_type(*$C$DW$T$26)
	.dwattr $C$DW$126, DW_AT_name("sdcfg")
	.dwattr $C$DW$126, DW_AT_TI_symbol_name("_sdcfg")
	.dwattr $C$DW$126, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$126, DW_AT_accessibility(DW_ACCESS_public)
$C$DW$127	.dwtag  DW_TAG_member
	.dwattr $C$DW$127, DW_AT_type(*$C$DW$T$26)
	.dwattr $C$DW$127, DW_AT_name("sdrfc")
	.dwattr $C$DW$127, DW_AT_TI_symbol_name("_sdrfc")
	.dwattr $C$DW$127, DW_AT_data_member_location[DW_OP_plus_uconst 0x4]
	.dwattr $C$DW$127, DW_AT_accessibility(DW_ACCESS_public)
$C$DW$128	.dwtag  DW_TAG_member
	.dwattr $C$DW$128, DW_AT_type(*$C$DW$T$26)
	.dwattr $C$DW$128, DW_AT_name("sdtim1")
	.dwattr $C$DW$128, DW_AT_TI_symbol_name("_sdtim1")
	.dwattr $C$DW$128, DW_AT_data_member_location[DW_OP_plus_uconst 0x8]
	.dwattr $C$DW$128, DW_AT_accessibility(DW_ACCESS_public)
$C$DW$129	.dwtag  DW_TAG_member
	.dwattr $C$DW$129, DW_AT_type(*$C$DW$T$26)
	.dwattr $C$DW$129, DW_AT_name("sdtim2")
	.dwattr $C$DW$129, DW_AT_TI_symbol_name("_sdtim2")
	.dwattr $C$DW$129, DW_AT_data_member_location[DW_OP_plus_uconst 0xc]
	.dwattr $C$DW$129, DW_AT_accessibility(DW_ACCESS_public)
$C$DW$130	.dwtag  DW_TAG_member
	.dwattr $C$DW$130, DW_AT_type(*$C$DW$T$26)
	.dwattr $C$DW$130, DW_AT_name("dmcctl")
	.dwattr $C$DW$130, DW_AT_TI_symbol_name("_dmcctl")
	.dwattr $C$DW$130, DW_AT_data_member_location[DW_OP_plus_uconst 0x10]
	.dwattr $C$DW$130, DW_AT_accessibility(DW_ACCESS_public)
	.dwendtag $C$DW$T$30

$C$DW$T$19	.dwtag  DW_TAG_typedef, DW_AT_name("iblEmif3p1_t")
	.dwattr $C$DW$T$19, DW_AT_type(*$C$DW$T$30)
	.dwattr $C$DW$T$19, DW_AT_language(DW_LANG_C)

$C$DW$T$31	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$31, DW_AT_name("iblEmif4p0_s")
	.dwattr $C$DW$T$31, DW_AT_byte_size(0x64)
$C$DW$131	.dwtag  DW_TAG_member
	.dwattr $C$DW$131, DW_AT_type(*$C$DW$T$26)
	.dwattr $C$DW$131, DW_AT_name("registerMask")
	.dwattr $C$DW$131, DW_AT_TI_symbol_name("_registerMask")
	.dwattr $C$DW$131, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$131, DW_AT_accessibility(DW_ACCESS_public)
$C$DW$132	.dwtag  DW_TAG_member
	.dwattr $C$DW$132, DW_AT_type(*$C$DW$T$26)
	.dwattr $C$DW$132, DW_AT_name("sdRamConfig")
	.dwattr $C$DW$132, DW_AT_TI_symbol_name("_sdRamConfig")
	.dwattr $C$DW$132, DW_AT_data_member_location[DW_OP_plus_uconst 0x4]
	.dwattr $C$DW$132, DW_AT_accessibility(DW_ACCESS_public)
$C$DW$133	.dwtag  DW_TAG_member
	.dwattr $C$DW$133, DW_AT_type(*$C$DW$T$26)
	.dwattr $C$DW$133, DW_AT_name("sdRamConfig2")
	.dwattr $C$DW$133, DW_AT_TI_symbol_name("_sdRamConfig2")
	.dwattr $C$DW$133, DW_AT_data_member_location[DW_OP_plus_uconst 0x8]
	.dwattr $C$DW$133, DW_AT_accessibility(DW_ACCESS_public)
$C$DW$134	.dwtag  DW_TAG_member
	.dwattr $C$DW$134, DW_AT_type(*$C$DW$T$26)
	.dwattr $C$DW$134, DW_AT_name("sdRamRefreshCtl")
	.dwattr $C$DW$134, DW_AT_TI_symbol_name("_sdRamRefreshCtl")
	.dwattr $C$DW$134, DW_AT_data_member_location[DW_OP_plus_uconst 0xc]
	.dwattr $C$DW$134, DW_AT_accessibility(DW_ACCESS_public)
$C$DW$135	.dwtag  DW_TAG_member
	.dwattr $C$DW$135, DW_AT_type(*$C$DW$T$26)
	.dwattr $C$DW$135, DW_AT_name("sdRamTiming1")
	.dwattr $C$DW$135, DW_AT_TI_symbol_name("_sdRamTiming1")
	.dwattr $C$DW$135, DW_AT_data_member_location[DW_OP_plus_uconst 0x10]
	.dwattr $C$DW$135, DW_AT_accessibility(DW_ACCESS_public)
$C$DW$136	.dwtag  DW_TAG_member
	.dwattr $C$DW$136, DW_AT_type(*$C$DW$T$26)
	.dwattr $C$DW$136, DW_AT_name("sdRamTiming2")
	.dwattr $C$DW$136, DW_AT_TI_symbol_name("_sdRamTiming2")
	.dwattr $C$DW$136, DW_AT_data_member_location[DW_OP_plus_uconst 0x14]
	.dwattr $C$DW$136, DW_AT_accessibility(DW_ACCESS_public)
$C$DW$137	.dwtag  DW_TAG_member
	.dwattr $C$DW$137, DW_AT_type(*$C$DW$T$26)
	.dwattr $C$DW$137, DW_AT_name("sdRamTiming3")
	.dwattr $C$DW$137, DW_AT_TI_symbol_name("_sdRamTiming3")
	.dwattr $C$DW$137, DW_AT_data_member_location[DW_OP_plus_uconst 0x18]
	.dwattr $C$DW$137, DW_AT_accessibility(DW_ACCESS_public)
$C$DW$138	.dwtag  DW_TAG_member
	.dwattr $C$DW$138, DW_AT_type(*$C$DW$T$26)
	.dwattr $C$DW$138, DW_AT_name("lpDdrNvmTiming")
	.dwattr $C$DW$138, DW_AT_TI_symbol_name("_lpDdrNvmTiming")
	.dwattr $C$DW$138, DW_AT_data_member_location[DW_OP_plus_uconst 0x1c]
	.dwattr $C$DW$138, DW_AT_accessibility(DW_ACCESS_public)
$C$DW$139	.dwtag  DW_TAG_member
	.dwattr $C$DW$139, DW_AT_type(*$C$DW$T$26)
	.dwattr $C$DW$139, DW_AT_name("powerManageCtl")
	.dwattr $C$DW$139, DW_AT_TI_symbol_name("_powerManageCtl")
	.dwattr $C$DW$139, DW_AT_data_member_location[DW_OP_plus_uconst 0x20]
	.dwattr $C$DW$139, DW_AT_accessibility(DW_ACCESS_public)
$C$DW$140	.dwtag  DW_TAG_member
	.dwattr $C$DW$140, DW_AT_type(*$C$DW$T$26)
	.dwattr $C$DW$140, DW_AT_name("iODFTTestLogic")
	.dwattr $C$DW$140, DW_AT_TI_symbol_name("_iODFTTestLogic")
	.dwattr $C$DW$140, DW_AT_data_member_location[DW_OP_plus_uconst 0x24]
	.dwattr $C$DW$140, DW_AT_accessibility(DW_ACCESS_public)
$C$DW$141	.dwtag  DW_TAG_member
	.dwattr $C$DW$141, DW_AT_type(*$C$DW$T$26)
	.dwattr $C$DW$141, DW_AT_name("performCountCfg")
	.dwattr $C$DW$141, DW_AT_TI_symbol_name("_performCountCfg")
	.dwattr $C$DW$141, DW_AT_data_member_location[DW_OP_plus_uconst 0x28]
	.dwattr $C$DW$141, DW_AT_accessibility(DW_ACCESS_public)
$C$DW$142	.dwtag  DW_TAG_member
	.dwattr $C$DW$142, DW_AT_type(*$C$DW$T$26)
	.dwattr $C$DW$142, DW_AT_name("performCountMstRegSel")
	.dwattr $C$DW$142, DW_AT_TI_symbol_name("_performCountMstRegSel")
	.dwattr $C$DW$142, DW_AT_data_member_location[DW_OP_plus_uconst 0x2c]
	.dwattr $C$DW$142, DW_AT_accessibility(DW_ACCESS_public)
$C$DW$143	.dwtag  DW_TAG_member
	.dwattr $C$DW$143, DW_AT_type(*$C$DW$T$26)
	.dwattr $C$DW$143, DW_AT_name("readIdleCtl")
	.dwattr $C$DW$143, DW_AT_TI_symbol_name("_readIdleCtl")
	.dwattr $C$DW$143, DW_AT_data_member_location[DW_OP_plus_uconst 0x30]
	.dwattr $C$DW$143, DW_AT_accessibility(DW_ACCESS_public)
$C$DW$144	.dwtag  DW_TAG_member
	.dwattr $C$DW$144, DW_AT_type(*$C$DW$T$26)
	.dwattr $C$DW$144, DW_AT_name("sysVbusmIntEnSet")
	.dwattr $C$DW$144, DW_AT_TI_symbol_name("_sysVbusmIntEnSet")
	.dwattr $C$DW$144, DW_AT_data_member_location[DW_OP_plus_uconst 0x34]
	.dwattr $C$DW$144, DW_AT_accessibility(DW_ACCESS_public)
$C$DW$145	.dwtag  DW_TAG_member
	.dwattr $C$DW$145, DW_AT_type(*$C$DW$T$26)
	.dwattr $C$DW$145, DW_AT_name("sdRamOutImpdedCalCfg")
	.dwattr $C$DW$145, DW_AT_TI_symbol_name("_sdRamOutImpdedCalCfg")
	.dwattr $C$DW$145, DW_AT_data_member_location[DW_OP_plus_uconst 0x38]
	.dwattr $C$DW$145, DW_AT_accessibility(DW_ACCESS_public)
$C$DW$146	.dwtag  DW_TAG_member
	.dwattr $C$DW$146, DW_AT_type(*$C$DW$T$26)
	.dwattr $C$DW$146, DW_AT_name("tempAlterCfg")
	.dwattr $C$DW$146, DW_AT_TI_symbol_name("_tempAlterCfg")
	.dwattr $C$DW$146, DW_AT_data_member_location[DW_OP_plus_uconst 0x3c]
	.dwattr $C$DW$146, DW_AT_accessibility(DW_ACCESS_public)
$C$DW$147	.dwtag  DW_TAG_member
	.dwattr $C$DW$147, DW_AT_type(*$C$DW$T$26)
	.dwattr $C$DW$147, DW_AT_name("ddrPhyCtl1")
	.dwattr $C$DW$147, DW_AT_TI_symbol_name("_ddrPhyCtl1")
	.dwattr $C$DW$147, DW_AT_data_member_location[DW_OP_plus_uconst 0x40]
	.dwattr $C$DW$147, DW_AT_accessibility(DW_ACCESS_public)
$C$DW$148	.dwtag  DW_TAG_member
	.dwattr $C$DW$148, DW_AT_type(*$C$DW$T$26)
	.dwattr $C$DW$148, DW_AT_name("ddrPhyCtl2")
	.dwattr $C$DW$148, DW_AT_TI_symbol_name("_ddrPhyCtl2")
	.dwattr $C$DW$148, DW_AT_data_member_location[DW_OP_plus_uconst 0x44]
	.dwattr $C$DW$148, DW_AT_accessibility(DW_ACCESS_public)
$C$DW$149	.dwtag  DW_TAG_member
	.dwattr $C$DW$149, DW_AT_type(*$C$DW$T$26)
	.dwattr $C$DW$149, DW_AT_name("priClassSvceMap")
	.dwattr $C$DW$149, DW_AT_TI_symbol_name("_priClassSvceMap")
	.dwattr $C$DW$149, DW_AT_data_member_location[DW_OP_plus_uconst 0x48]
	.dwattr $C$DW$149, DW_AT_accessibility(DW_ACCESS_public)
$C$DW$150	.dwtag  DW_TAG_member
	.dwattr $C$DW$150, DW_AT_type(*$C$DW$T$26)
	.dwattr $C$DW$150, DW_AT_name("mstId2ClsSvce1Map")
	.dwattr $C$DW$150, DW_AT_TI_symbol_name("_mstId2ClsSvce1Map")
	.dwattr $C$DW$150, DW_AT_data_member_location[DW_OP_plus_uconst 0x4c]
	.dwattr $C$DW$150, DW_AT_accessibility(DW_ACCESS_public)
$C$DW$151	.dwtag  DW_TAG_member
	.dwattr $C$DW$151, DW_AT_type(*$C$DW$T$26)
	.dwattr $C$DW$151, DW_AT_name("mstId2ClsSvce2Map")
	.dwattr $C$DW$151, DW_AT_TI_symbol_name("_mstId2ClsSvce2Map")
	.dwattr $C$DW$151, DW_AT_data_member_location[DW_OP_plus_uconst 0x50]
	.dwattr $C$DW$151, DW_AT_accessibility(DW_ACCESS_public)
$C$DW$152	.dwtag  DW_TAG_member
	.dwattr $C$DW$152, DW_AT_type(*$C$DW$T$26)
	.dwattr $C$DW$152, DW_AT_name("eccCtl")
	.dwattr $C$DW$152, DW_AT_TI_symbol_name("_eccCtl")
	.dwattr $C$DW$152, DW_AT_data_member_location[DW_OP_plus_uconst 0x54]
	.dwattr $C$DW$152, DW_AT_accessibility(DW_ACCESS_public)
$C$DW$153	.dwtag  DW_TAG_member
	.dwattr $C$DW$153, DW_AT_type(*$C$DW$T$26)
	.dwattr $C$DW$153, DW_AT_name("eccRange1")
	.dwattr $C$DW$153, DW_AT_TI_symbol_name("_eccRange1")
	.dwattr $C$DW$153, DW_AT_data_member_location[DW_OP_plus_uconst 0x58]
	.dwattr $C$DW$153, DW_AT_accessibility(DW_ACCESS_public)
$C$DW$154	.dwtag  DW_TAG_member
	.dwattr $C$DW$154, DW_AT_type(*$C$DW$T$26)
	.dwattr $C$DW$154, DW_AT_name("eccRange2")
	.dwattr $C$DW$154, DW_AT_TI_symbol_name("_eccRange2")
	.dwattr $C$DW$154, DW_AT_data_member_location[DW_OP_plus_uconst 0x5c]
	.dwattr $C$DW$154, DW_AT_accessibility(DW_ACCESS_public)
$C$DW$155	.dwtag  DW_TAG_member
	.dwattr $C$DW$155, DW_AT_type(*$C$DW$T$26)
	.dwattr $C$DW$155, DW_AT_name("rdWrtExcThresh")
	.dwattr $C$DW$155, DW_AT_TI_symbol_name("_rdWrtExcThresh")
	.dwattr $C$DW$155, DW_AT_data_member_location[DW_OP_plus_uconst 0x60]
	.dwattr $C$DW$155, DW_AT_accessibility(DW_ACCESS_public)
	.dwendtag $C$DW$T$31

$C$DW$T$20	.dwtag  DW_TAG_typedef, DW_AT_name("iblEmif4p0_t")
	.dwattr $C$DW$T$20, DW_AT_type(*$C$DW$T$31)
	.dwattr $C$DW$T$20, DW_AT_language(DW_LANG_C)

$C$DW$T$34	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$34, DW_AT_name("iblEmif_s")
	.dwattr $C$DW$T$34, DW_AT_byte_size(0x06)
$C$DW$156	.dwtag  DW_TAG_member
	.dwattr $C$DW$156, DW_AT_type(*$C$DW$T$32)
	.dwattr $C$DW$156, DW_AT_name("csSpace")
	.dwattr $C$DW$156, DW_AT_TI_symbol_name("_csSpace")
	.dwattr $C$DW$156, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$156, DW_AT_accessibility(DW_ACCESS_public)
$C$DW$157	.dwtag  DW_TAG_member
	.dwattr $C$DW$157, DW_AT_type(*$C$DW$T$32)
	.dwattr $C$DW$157, DW_AT_name("busWidth")
	.dwattr $C$DW$157, DW_AT_TI_symbol_name("_busWidth")
	.dwattr $C$DW$157, DW_AT_data_member_location[DW_OP_plus_uconst 0x2]
	.dwattr $C$DW$157, DW_AT_accessibility(DW_ACCESS_public)
$C$DW$158	.dwtag  DW_TAG_member
	.dwattr $C$DW$158, DW_AT_type(*$C$DW$T$33)
	.dwattr $C$DW$158, DW_AT_name("waitEnable")
	.dwattr $C$DW$158, DW_AT_TI_symbol_name("_waitEnable")
	.dwattr $C$DW$158, DW_AT_data_member_location[DW_OP_plus_uconst 0x4]
	.dwattr $C$DW$158, DW_AT_accessibility(DW_ACCESS_public)
	.dwendtag $C$DW$T$34

$C$DW$T$66	.dwtag  DW_TAG_typedef, DW_AT_name("iblEmif_t")
	.dwattr $C$DW$T$66, DW_AT_type(*$C$DW$T$34)
	.dwattr $C$DW$T$66, DW_AT_language(DW_LANG_C)

$C$DW$T$67	.dwtag  DW_TAG_array_type
	.dwattr $C$DW$T$67, DW_AT_type(*$C$DW$T$66)
	.dwattr $C$DW$T$67, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$67, DW_AT_byte_size(0x0c)
$C$DW$159	.dwtag  DW_TAG_subrange_type
	.dwattr $C$DW$159, DW_AT_upper_bound(0x01)
	.dwendtag $C$DW$T$67


$C$DW$T$41	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$41, DW_AT_name("iblEthBootInfo_s")
	.dwattr $C$DW$T$41, DW_AT_byte_size(0x56)
$C$DW$160	.dwtag  DW_TAG_member
	.dwattr $C$DW$160, DW_AT_type(*$C$DW$T$36)
	.dwattr $C$DW$160, DW_AT_name("ipAddr")
	.dwattr $C$DW$160, DW_AT_TI_symbol_name("_ipAddr")
	.dwattr $C$DW$160, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$160, DW_AT_accessibility(DW_ACCESS_public)
$C$DW$161	.dwtag  DW_TAG_member
	.dwattr $C$DW$161, DW_AT_type(*$C$DW$T$36)
	.dwattr $C$DW$161, DW_AT_name("serverIp")
	.dwattr $C$DW$161, DW_AT_TI_symbol_name("_serverIp")
	.dwattr $C$DW$161, DW_AT_data_member_location[DW_OP_plus_uconst 0x4]
	.dwattr $C$DW$161, DW_AT_accessibility(DW_ACCESS_public)
$C$DW$162	.dwtag  DW_TAG_member
	.dwattr $C$DW$162, DW_AT_type(*$C$DW$T$36)
	.dwattr $C$DW$162, DW_AT_name("gatewayIp")
	.dwattr $C$DW$162, DW_AT_TI_symbol_name("_gatewayIp")
	.dwattr $C$DW$162, DW_AT_data_member_location[DW_OP_plus_uconst 0x8]
	.dwattr $C$DW$162, DW_AT_accessibility(DW_ACCESS_public)
$C$DW$163	.dwtag  DW_TAG_member
	.dwattr $C$DW$163, DW_AT_type(*$C$DW$T$36)
	.dwattr $C$DW$163, DW_AT_name("netmask")
	.dwattr $C$DW$163, DW_AT_TI_symbol_name("_netmask")
	.dwattr $C$DW$163, DW_AT_data_member_location[DW_OP_plus_uconst 0xc]
	.dwattr $C$DW$163, DW_AT_accessibility(DW_ACCESS_public)
$C$DW$164	.dwtag  DW_TAG_member
	.dwattr $C$DW$164, DW_AT_type(*$C$DW$T$37)
	.dwattr $C$DW$164, DW_AT_name("hwAddress")
	.dwattr $C$DW$164, DW_AT_TI_symbol_name("_hwAddress")
	.dwattr $C$DW$164, DW_AT_data_member_location[DW_OP_plus_uconst 0x10]
	.dwattr $C$DW$164, DW_AT_accessibility(DW_ACCESS_public)
$C$DW$165	.dwtag  DW_TAG_member
	.dwattr $C$DW$165, DW_AT_type(*$C$DW$T$40)
	.dwattr $C$DW$165, DW_AT_name("fileName")
	.dwattr $C$DW$165, DW_AT_TI_symbol_name("_fileName")
	.dwattr $C$DW$165, DW_AT_data_member_location[DW_OP_plus_uconst 0x16]
	.dwattr $C$DW$165, DW_AT_accessibility(DW_ACCESS_public)
	.dwendtag $C$DW$T$41

$C$DW$T$43	.dwtag  DW_TAG_typedef, DW_AT_name("iblEthBootInfo_t")
	.dwattr $C$DW$T$43, DW_AT_type(*$C$DW$T$41)
	.dwattr $C$DW$T$43, DW_AT_language(DW_LANG_C)

$C$DW$T$44	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$44, DW_AT_name("iblEth_s")
	.dwattr $C$DW$T$44, DW_AT_byte_size(0x70)
$C$DW$166	.dwtag  DW_TAG_member
	.dwattr $C$DW$166, DW_AT_type(*$C$DW$T$33)
	.dwattr $C$DW$166, DW_AT_name("doBootp")
	.dwattr $C$DW$166, DW_AT_TI_symbol_name("_doBootp")
	.dwattr $C$DW$166, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$166, DW_AT_accessibility(DW_ACCESS_public)
$C$DW$167	.dwtag  DW_TAG_member
	.dwattr $C$DW$167, DW_AT_type(*$C$DW$T$33)
	.dwattr $C$DW$167, DW_AT_name("useBootpServerIp")
	.dwattr $C$DW$167, DW_AT_TI_symbol_name("_useBootpServerIp")
	.dwattr $C$DW$167, DW_AT_data_member_location[DW_OP_plus_uconst 0x2]
	.dwattr $C$DW$167, DW_AT_accessibility(DW_ACCESS_public)
$C$DW$168	.dwtag  DW_TAG_member
	.dwattr $C$DW$168, DW_AT_type(*$C$DW$T$33)
	.dwattr $C$DW$168, DW_AT_name("useBootpFileName")
	.dwattr $C$DW$168, DW_AT_TI_symbol_name("_useBootpFileName")
	.dwattr $C$DW$168, DW_AT_data_member_location[DW_OP_plus_uconst 0x4]
	.dwattr $C$DW$168, DW_AT_accessibility(DW_ACCESS_public)
$C$DW$169	.dwtag  DW_TAG_member
	.dwattr $C$DW$169, DW_AT_type(*$C$DW$T$28)
	.dwattr $C$DW$169, DW_AT_name("bootFormat")
	.dwattr $C$DW$169, DW_AT_TI_symbol_name("_bootFormat")
	.dwattr $C$DW$169, DW_AT_data_member_location[DW_OP_plus_uconst 0x8]
	.dwattr $C$DW$169, DW_AT_accessibility(DW_ACCESS_public)
$C$DW$170	.dwtag  DW_TAG_member
	.dwattr $C$DW$170, DW_AT_type(*$C$DW$T$42)
	.dwattr $C$DW$170, DW_AT_name("blob")
	.dwattr $C$DW$170, DW_AT_TI_symbol_name("_blob")
	.dwattr $C$DW$170, DW_AT_data_member_location[DW_OP_plus_uconst 0xc]
	.dwattr $C$DW$170, DW_AT_accessibility(DW_ACCESS_public)
$C$DW$171	.dwtag  DW_TAG_member
	.dwattr $C$DW$171, DW_AT_type(*$C$DW$T$43)
	.dwattr $C$DW$171, DW_AT_name("ethInfo")
	.dwattr $C$DW$171, DW_AT_TI_symbol_name("_ethInfo")
	.dwattr $C$DW$171, DW_AT_data_member_location[DW_OP_plus_uconst 0x18]
	.dwattr $C$DW$171, DW_AT_accessibility(DW_ACCESS_public)
	.dwendtag $C$DW$T$44

$C$DW$T$22	.dwtag  DW_TAG_typedef, DW_AT_name("iblEth_t")
	.dwattr $C$DW$T$22, DW_AT_type(*$C$DW$T$44)
	.dwattr $C$DW$T$22, DW_AT_language(DW_LANG_C)

$C$DW$T$47	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$47, DW_AT_name("iblMdio_s")
	.dwattr $C$DW$T$47, DW_AT_byte_size(0x48)
$C$DW$172	.dwtag  DW_TAG_member
	.dwattr $C$DW$172, DW_AT_type(*$C$DW$T$32)
	.dwattr $C$DW$172, DW_AT_name("nMdioOps")
	.dwattr $C$DW$172, DW_AT_TI_symbol_name("_nMdioOps")
	.dwattr $C$DW$172, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$172, DW_AT_accessibility(DW_ACCESS_public)
$C$DW$173	.dwtag  DW_TAG_member
	.dwattr $C$DW$173, DW_AT_type(*$C$DW$T$45)
	.dwattr $C$DW$173, DW_AT_name("mdioClkDiv")
	.dwattr $C$DW$173, DW_AT_TI_symbol_name("_mdioClkDiv")
	.dwattr $C$DW$173, DW_AT_data_member_location[DW_OP_plus_uconst 0x2]
	.dwattr $C$DW$173, DW_AT_accessibility(DW_ACCESS_public)
$C$DW$174	.dwtag  DW_TAG_member
	.dwattr $C$DW$174, DW_AT_type(*$C$DW$T$26)
	.dwattr $C$DW$174, DW_AT_name("interDelay")
	.dwattr $C$DW$174, DW_AT_TI_symbol_name("_interDelay")
	.dwattr $C$DW$174, DW_AT_data_member_location[DW_OP_plus_uconst 0x4]
	.dwattr $C$DW$174, DW_AT_accessibility(DW_ACCESS_public)
$C$DW$175	.dwtag  DW_TAG_member
	.dwattr $C$DW$175, DW_AT_type(*$C$DW$T$46)
	.dwattr $C$DW$175, DW_AT_name("mdio")
	.dwattr $C$DW$175, DW_AT_TI_symbol_name("_mdio")
	.dwattr $C$DW$175, DW_AT_data_member_location[DW_OP_plus_uconst 0x8]
	.dwattr $C$DW$175, DW_AT_accessibility(DW_ACCESS_public)
	.dwendtag $C$DW$T$47

$C$DW$T$64	.dwtag  DW_TAG_typedef, DW_AT_name("iblMdio_t")
	.dwattr $C$DW$T$64, DW_AT_type(*$C$DW$T$47)
	.dwattr $C$DW$T$64, DW_AT_language(DW_LANG_C)

$C$DW$T$53	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$53, DW_AT_name("iblNand_s")
	.dwattr $C$DW$T$53, DW_AT_byte_size(0x84)
$C$DW$176	.dwtag  DW_TAG_member
	.dwattr $C$DW$176, DW_AT_type(*$C$DW$T$28)
	.dwattr $C$DW$176, DW_AT_name("bootFormat")
	.dwattr $C$DW$176, DW_AT_TI_symbol_name("_bootFormat")
	.dwattr $C$DW$176, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$176, DW_AT_accessibility(DW_ACCESS_public)
$C$DW$177	.dwtag  DW_TAG_member
	.dwattr $C$DW$177, DW_AT_type(*$C$DW$T$49)
	.dwattr $C$DW$177, DW_AT_name("bootAddress")
	.dwattr $C$DW$177, DW_AT_TI_symbol_name("_bootAddress")
	.dwattr $C$DW$177, DW_AT_data_member_location[DW_OP_plus_uconst 0x4]
	.dwattr $C$DW$177, DW_AT_accessibility(DW_ACCESS_public)
$C$DW$178	.dwtag  DW_TAG_member
	.dwattr $C$DW$178, DW_AT_type(*$C$DW$T$28)
	.dwattr $C$DW$178, DW_AT_name("interface")
	.dwattr $C$DW$178, DW_AT_TI_symbol_name("_interface")
	.dwattr $C$DW$178, DW_AT_data_member_location[DW_OP_plus_uconst 0x14]
	.dwattr $C$DW$178, DW_AT_accessibility(DW_ACCESS_public)
$C$DW$179	.dwtag  DW_TAG_member
	.dwattr $C$DW$179, DW_AT_type(*$C$DW$T$51)
	.dwattr $C$DW$179, DW_AT_name("blob")
	.dwattr $C$DW$179, DW_AT_TI_symbol_name("_blob")
	.dwattr $C$DW$179, DW_AT_data_member_location[DW_OP_plus_uconst 0x18]
	.dwattr $C$DW$179, DW_AT_accessibility(DW_ACCESS_public)
$C$DW$180	.dwtag  DW_TAG_member
	.dwattr $C$DW$180, DW_AT_type(*$C$DW$T$52)
	.dwattr $C$DW$180, DW_AT_name("nandInfo")
	.dwattr $C$DW$180, DW_AT_TI_symbol_name("_nandInfo")
	.dwattr $C$DW$180, DW_AT_data_member_location[DW_OP_plus_uconst 0x48]
	.dwattr $C$DW$180, DW_AT_accessibility(DW_ACCESS_public)
	.dwendtag $C$DW$T$53

$C$DW$T$23	.dwtag  DW_TAG_typedef, DW_AT_name("iblNand_t")
	.dwattr $C$DW$T$23, DW_AT_type(*$C$DW$T$53)
	.dwattr $C$DW$T$23, DW_AT_language(DW_LANG_C)

$C$DW$T$54	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$54, DW_AT_name("iblNor_s")
	.dwattr $C$DW$T$54, DW_AT_byte_size(0x48)
$C$DW$181	.dwtag  DW_TAG_member
	.dwattr $C$DW$181, DW_AT_type(*$C$DW$T$28)
	.dwattr $C$DW$181, DW_AT_name("bootFormat")
	.dwattr $C$DW$181, DW_AT_TI_symbol_name("_bootFormat")
	.dwattr $C$DW$181, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$181, DW_AT_accessibility(DW_ACCESS_public)
$C$DW$182	.dwtag  DW_TAG_member
	.dwattr $C$DW$182, DW_AT_type(*$C$DW$T$49)
	.dwattr $C$DW$182, DW_AT_name("bootAddress")
	.dwattr $C$DW$182, DW_AT_TI_symbol_name("_bootAddress")
	.dwattr $C$DW$182, DW_AT_data_member_location[DW_OP_plus_uconst 0x4]
	.dwattr $C$DW$182, DW_AT_accessibility(DW_ACCESS_public)
$C$DW$183	.dwtag  DW_TAG_member
	.dwattr $C$DW$183, DW_AT_type(*$C$DW$T$28)
	.dwattr $C$DW$183, DW_AT_name("interface")
	.dwattr $C$DW$183, DW_AT_TI_symbol_name("_interface")
	.dwattr $C$DW$183, DW_AT_data_member_location[DW_OP_plus_uconst 0x14]
	.dwattr $C$DW$183, DW_AT_accessibility(DW_ACCESS_public)
$C$DW$184	.dwtag  DW_TAG_member
	.dwattr $C$DW$184, DW_AT_type(*$C$DW$T$51)
	.dwattr $C$DW$184, DW_AT_name("blob")
	.dwattr $C$DW$184, DW_AT_TI_symbol_name("_blob")
	.dwattr $C$DW$184, DW_AT_data_member_location[DW_OP_plus_uconst 0x18]
	.dwattr $C$DW$184, DW_AT_accessibility(DW_ACCESS_public)
	.dwendtag $C$DW$T$54

$C$DW$T$24	.dwtag  DW_TAG_typedef, DW_AT_name("iblNor_t")
	.dwattr $C$DW$T$24, DW_AT_type(*$C$DW$T$54)
	.dwattr $C$DW$T$24, DW_AT_language(DW_LANG_C)

$C$DW$T$56	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$56, DW_AT_name("iblPll_s")
	.dwattr $C$DW$T$56, DW_AT_byte_size(0x14)
$C$DW$185	.dwtag  DW_TAG_member
	.dwattr $C$DW$185, DW_AT_type(*$C$DW$T$33)
	.dwattr $C$DW$185, DW_AT_name("doEnable")
	.dwattr $C$DW$185, DW_AT_TI_symbol_name("_doEnable")
	.dwattr $C$DW$185, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$185, DW_AT_accessibility(DW_ACCESS_public)
$C$DW$186	.dwtag  DW_TAG_member
	.dwattr $C$DW$186, DW_AT_type(*$C$DW$T$55)
	.dwattr $C$DW$186, DW_AT_name("prediv")
	.dwattr $C$DW$186, DW_AT_TI_symbol_name("_prediv")
	.dwattr $C$DW$186, DW_AT_data_member_location[DW_OP_plus_uconst 0x4]
	.dwattr $C$DW$186, DW_AT_accessibility(DW_ACCESS_public)
$C$DW$187	.dwtag  DW_TAG_member
	.dwattr $C$DW$187, DW_AT_type(*$C$DW$T$55)
	.dwattr $C$DW$187, DW_AT_name("mult")
	.dwattr $C$DW$187, DW_AT_TI_symbol_name("_mult")
	.dwattr $C$DW$187, DW_AT_data_member_location[DW_OP_plus_uconst 0x8]
	.dwattr $C$DW$187, DW_AT_accessibility(DW_ACCESS_public)
$C$DW$188	.dwtag  DW_TAG_member
	.dwattr $C$DW$188, DW_AT_type(*$C$DW$T$55)
	.dwattr $C$DW$188, DW_AT_name("postdiv")
	.dwattr $C$DW$188, DW_AT_TI_symbol_name("_postdiv")
	.dwattr $C$DW$188, DW_AT_data_member_location[DW_OP_plus_uconst 0xc]
	.dwattr $C$DW$188, DW_AT_accessibility(DW_ACCESS_public)
$C$DW$189	.dwtag  DW_TAG_member
	.dwattr $C$DW$189, DW_AT_type(*$C$DW$T$55)
	.dwattr $C$DW$189, DW_AT_name("pllOutFreqMhz")
	.dwattr $C$DW$189, DW_AT_TI_symbol_name("_pllOutFreqMhz")
	.dwattr $C$DW$189, DW_AT_data_member_location[DW_OP_plus_uconst 0x10]
	.dwattr $C$DW$189, DW_AT_accessibility(DW_ACCESS_public)
	.dwendtag $C$DW$T$56

$C$DW$T$59	.dwtag  DW_TAG_typedef, DW_AT_name("iblPll_t")
	.dwattr $C$DW$T$59, DW_AT_type(*$C$DW$T$56)
	.dwattr $C$DW$T$59, DW_AT_language(DW_LANG_C)

$C$DW$T$60	.dwtag  DW_TAG_array_type
	.dwattr $C$DW$T$60, DW_AT_type(*$C$DW$T$59)
	.dwattr $C$DW$T$60, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$60, DW_AT_byte_size(0x3c)
$C$DW$190	.dwtag  DW_TAG_subrange_type
	.dwattr $C$DW$190, DW_AT_upper_bound(0x02)
	.dwendtag $C$DW$T$60


$C$DW$T$57	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$57, DW_AT_name("iblSgmii_s")
	.dwattr $C$DW$T$57, DW_AT_byte_size(0x18)
$C$DW$191	.dwtag  DW_TAG_member
	.dwattr $C$DW$191, DW_AT_type(*$C$DW$T$33)
	.dwattr $C$DW$191, DW_AT_name("configure")
	.dwattr $C$DW$191, DW_AT_TI_symbol_name("_configure")
	.dwattr $C$DW$191, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$191, DW_AT_accessibility(DW_ACCESS_public)
$C$DW$192	.dwtag  DW_TAG_member
	.dwattr $C$DW$192, DW_AT_type(*$C$DW$T$26)
	.dwattr $C$DW$192, DW_AT_name("adviseAbility")
	.dwattr $C$DW$192, DW_AT_TI_symbol_name("_adviseAbility")
	.dwattr $C$DW$192, DW_AT_data_member_location[DW_OP_plus_uconst 0x4]
	.dwattr $C$DW$192, DW_AT_accessibility(DW_ACCESS_public)
$C$DW$193	.dwtag  DW_TAG_member
	.dwattr $C$DW$193, DW_AT_type(*$C$DW$T$26)
	.dwattr $C$DW$193, DW_AT_name("control")
	.dwattr $C$DW$193, DW_AT_TI_symbol_name("_control")
	.dwattr $C$DW$193, DW_AT_data_member_location[DW_OP_plus_uconst 0x8]
	.dwattr $C$DW$193, DW_AT_accessibility(DW_ACCESS_public)
$C$DW$194	.dwtag  DW_TAG_member
	.dwattr $C$DW$194, DW_AT_type(*$C$DW$T$26)
	.dwattr $C$DW$194, DW_AT_name("txConfig")
	.dwattr $C$DW$194, DW_AT_TI_symbol_name("_txConfig")
	.dwattr $C$DW$194, DW_AT_data_member_location[DW_OP_plus_uconst 0xc]
	.dwattr $C$DW$194, DW_AT_accessibility(DW_ACCESS_public)
$C$DW$195	.dwtag  DW_TAG_member
	.dwattr $C$DW$195, DW_AT_type(*$C$DW$T$26)
	.dwattr $C$DW$195, DW_AT_name("rxConfig")
	.dwattr $C$DW$195, DW_AT_TI_symbol_name("_rxConfig")
	.dwattr $C$DW$195, DW_AT_data_member_location[DW_OP_plus_uconst 0x10]
	.dwattr $C$DW$195, DW_AT_accessibility(DW_ACCESS_public)
$C$DW$196	.dwtag  DW_TAG_member
	.dwattr $C$DW$196, DW_AT_type(*$C$DW$T$26)
	.dwattr $C$DW$196, DW_AT_name("auxConfig")
	.dwattr $C$DW$196, DW_AT_TI_symbol_name("_auxConfig")
	.dwattr $C$DW$196, DW_AT_data_member_location[DW_OP_plus_uconst 0x14]
	.dwattr $C$DW$196, DW_AT_accessibility(DW_ACCESS_public)
	.dwendtag $C$DW$T$57

$C$DW$T$62	.dwtag  DW_TAG_typedef, DW_AT_name("iblSgmii_t")
	.dwattr $C$DW$T$62, DW_AT_type(*$C$DW$T$57)
	.dwattr $C$DW$T$62, DW_AT_language(DW_LANG_C)

$C$DW$T$63	.dwtag  DW_TAG_array_type
	.dwattr $C$DW$T$63, DW_AT_type(*$C$DW$T$62)
	.dwattr $C$DW$T$63, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$63, DW_AT_byte_size(0x30)
$C$DW$197	.dwtag  DW_TAG_subrange_type
	.dwattr $C$DW$197, DW_AT_upper_bound(0x01)
	.dwendtag $C$DW$T$63


$C$DW$T$58	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$58, DW_AT_name("iblSpi_s")
	.dwattr $C$DW$T$58, DW_AT_byte_size(0x0c)
$C$DW$198	.dwtag  DW_TAG_member
	.dwattr $C$DW$198, DW_AT_type(*$C$DW$T$32)
	.dwattr $C$DW$198, DW_AT_name("addrWidth")
	.dwattr $C$DW$198, DW_AT_TI_symbol_name("_addrWidth")
	.dwattr $C$DW$198, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$198, DW_AT_accessibility(DW_ACCESS_public)
$C$DW$199	.dwtag  DW_TAG_member
	.dwattr $C$DW$199, DW_AT_type(*$C$DW$T$32)
	.dwattr $C$DW$199, DW_AT_name("nPins")
	.dwattr $C$DW$199, DW_AT_TI_symbol_name("_nPins")
	.dwattr $C$DW$199, DW_AT_data_member_location[DW_OP_plus_uconst 0x2]
	.dwattr $C$DW$199, DW_AT_accessibility(DW_ACCESS_public)
$C$DW$200	.dwtag  DW_TAG_member
	.dwattr $C$DW$200, DW_AT_type(*$C$DW$T$32)
	.dwattr $C$DW$200, DW_AT_name("mode")
	.dwattr $C$DW$200, DW_AT_TI_symbol_name("_mode")
	.dwattr $C$DW$200, DW_AT_data_member_location[DW_OP_plus_uconst 0x4]
	.dwattr $C$DW$200, DW_AT_accessibility(DW_ACCESS_public)
$C$DW$201	.dwtag  DW_TAG_member
	.dwattr $C$DW$201, DW_AT_type(*$C$DW$T$32)
	.dwattr $C$DW$201, DW_AT_name("csel")
	.dwattr $C$DW$201, DW_AT_TI_symbol_name("_csel")
	.dwattr $C$DW$201, DW_AT_data_member_location[DW_OP_plus_uconst 0x6]
	.dwattr $C$DW$201, DW_AT_accessibility(DW_ACCESS_public)
$C$DW$202	.dwtag  DW_TAG_member
	.dwattr $C$DW$202, DW_AT_type(*$C$DW$T$45)
	.dwattr $C$DW$202, DW_AT_name("c2tdelay")
	.dwattr $C$DW$202, DW_AT_TI_symbol_name("_c2tdelay")
	.dwattr $C$DW$202, DW_AT_data_member_location[DW_OP_plus_uconst 0x8]
	.dwattr $C$DW$202, DW_AT_accessibility(DW_ACCESS_public)
$C$DW$203	.dwtag  DW_TAG_member
	.dwattr $C$DW$203, DW_AT_type(*$C$DW$T$45)
	.dwattr $C$DW$203, DW_AT_name("busFreqMHz")
	.dwattr $C$DW$203, DW_AT_TI_symbol_name("_busFreqMHz")
	.dwattr $C$DW$203, DW_AT_data_member_location[DW_OP_plus_uconst 0xa]
	.dwattr $C$DW$203, DW_AT_accessibility(DW_ACCESS_public)
	.dwendtag $C$DW$T$58

$C$DW$T$65	.dwtag  DW_TAG_typedef, DW_AT_name("iblSpi_t")
	.dwattr $C$DW$T$65, DW_AT_type(*$C$DW$T$58)
	.dwattr $C$DW$T$65, DW_AT_language(DW_LANG_C)

$C$DW$T$70	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$70, DW_AT_name("ibl_s")
	.dwattr $C$DW$T$70, DW_AT_byte_size(0x2ec)
$C$DW$204	.dwtag  DW_TAG_member
	.dwattr $C$DW$204, DW_AT_type(*$C$DW$T$26)
	.dwattr $C$DW$204, DW_AT_name("iblMagic")
	.dwattr $C$DW$204, DW_AT_TI_symbol_name("_iblMagic")
	.dwattr $C$DW$204, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$204, DW_AT_accessibility(DW_ACCESS_public)
$C$DW$205	.dwtag  DW_TAG_member
	.dwattr $C$DW$205, DW_AT_type(*$C$DW$T$60)
	.dwattr $C$DW$205, DW_AT_name("pllConfig")
	.dwattr $C$DW$205, DW_AT_TI_symbol_name("_pllConfig")
	.dwattr $C$DW$205, DW_AT_data_member_location[DW_OP_plus_uconst 0x4]
	.dwattr $C$DW$205, DW_AT_accessibility(DW_ACCESS_public)
$C$DW$206	.dwtag  DW_TAG_member
	.dwattr $C$DW$206, DW_AT_type(*$C$DW$T$61)
	.dwattr $C$DW$206, DW_AT_name("ddrConfig")
	.dwattr $C$DW$206, DW_AT_TI_symbol_name("_ddrConfig")
	.dwattr $C$DW$206, DW_AT_data_member_location[DW_OP_plus_uconst 0x40]
	.dwattr $C$DW$206, DW_AT_accessibility(DW_ACCESS_public)
$C$DW$207	.dwtag  DW_TAG_member
	.dwattr $C$DW$207, DW_AT_type(*$C$DW$T$63)
	.dwattr $C$DW$207, DW_AT_name("sgmiiConfig")
	.dwattr $C$DW$207, DW_AT_TI_symbol_name("_sgmiiConfig")
	.dwattr $C$DW$207, DW_AT_data_member_location[DW_OP_plus_uconst 0xa8]
	.dwattr $C$DW$207, DW_AT_accessibility(DW_ACCESS_public)
$C$DW$208	.dwtag  DW_TAG_member
	.dwattr $C$DW$208, DW_AT_type(*$C$DW$T$64)
	.dwattr $C$DW$208, DW_AT_name("mdioConfig")
	.dwattr $C$DW$208, DW_AT_TI_symbol_name("_mdioConfig")
	.dwattr $C$DW$208, DW_AT_data_member_location[DW_OP_plus_uconst 0xd8]
	.dwattr $C$DW$208, DW_AT_accessibility(DW_ACCESS_public)
$C$DW$209	.dwtag  DW_TAG_member
	.dwattr $C$DW$209, DW_AT_type(*$C$DW$T$65)
	.dwattr $C$DW$209, DW_AT_name("spiConfig")
	.dwattr $C$DW$209, DW_AT_TI_symbol_name("_spiConfig")
	.dwattr $C$DW$209, DW_AT_data_member_location[DW_OP_plus_uconst 0x120]
	.dwattr $C$DW$209, DW_AT_accessibility(DW_ACCESS_public)
$C$DW$210	.dwtag  DW_TAG_member
	.dwattr $C$DW$210, DW_AT_type(*$C$DW$T$67)
	.dwattr $C$DW$210, DW_AT_name("emifConfig")
	.dwattr $C$DW$210, DW_AT_TI_symbol_name("_emifConfig")
	.dwattr $C$DW$210, DW_AT_data_member_location[DW_OP_plus_uconst 0x12c]
	.dwattr $C$DW$210, DW_AT_accessibility(DW_ACCESS_public)
$C$DW$211	.dwtag  DW_TAG_member
	.dwattr $C$DW$211, DW_AT_type(*$C$DW$T$69)
	.dwattr $C$DW$211, DW_AT_name("bootModes")
	.dwattr $C$DW$211, DW_AT_TI_symbol_name("_bootModes")
	.dwattr $C$DW$211, DW_AT_data_member_location[DW_OP_plus_uconst 0x138]
	.dwattr $C$DW$211, DW_AT_accessibility(DW_ACCESS_public)
$C$DW$212	.dwtag  DW_TAG_member
	.dwattr $C$DW$212, DW_AT_type(*$C$DW$T$45)
	.dwattr $C$DW$212, DW_AT_name("iblEvmType")
	.dwattr $C$DW$212, DW_AT_TI_symbol_name("_iblEvmType")
	.dwattr $C$DW$212, DW_AT_data_member_location[DW_OP_plus_uconst 0x2e8]
	.dwattr $C$DW$212, DW_AT_accessibility(DW_ACCESS_public)
$C$DW$213	.dwtag  DW_TAG_member
	.dwattr $C$DW$213, DW_AT_type(*$C$DW$T$45)
	.dwattr $C$DW$213, DW_AT_name("chkSum")
	.dwattr $C$DW$213, DW_AT_TI_symbol_name("_chkSum")
	.dwattr $C$DW$213, DW_AT_data_member_location[DW_OP_plus_uconst 0x2ea]
	.dwattr $C$DW$213, DW_AT_accessibility(DW_ACCESS_public)
	.dwendtag $C$DW$T$70

$C$DW$T$164	.dwtag  DW_TAG_typedef, DW_AT_name("ibl_t")
	.dwattr $C$DW$T$164, DW_AT_type(*$C$DW$T$70)
	.dwattr $C$DW$T$164, DW_AT_language(DW_LANG_C)

$C$DW$T$71	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$71, DW_AT_name("idblDdr_s")
	.dwattr $C$DW$T$71, DW_AT_byte_size(0x68)
$C$DW$214	.dwtag  DW_TAG_member
	.dwattr $C$DW$214, DW_AT_type(*$C$DW$T$33)
	.dwattr $C$DW$214, DW_AT_name("configDdr")
	.dwattr $C$DW$214, DW_AT_TI_symbol_name("_configDdr")
	.dwattr $C$DW$214, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$214, DW_AT_accessibility(DW_ACCESS_public)
$C$DW$215	.dwtag  DW_TAG_member
	.dwattr $C$DW$215, DW_AT_type(*$C$DW$T$21)
	.dwattr $C$DW$215, DW_AT_name("uEmif")
	.dwattr $C$DW$215, DW_AT_TI_symbol_name("_uEmif")
	.dwattr $C$DW$215, DW_AT_data_member_location[DW_OP_plus_uconst 0x4]
	.dwattr $C$DW$215, DW_AT_accessibility(DW_ACCESS_public)
	.dwendtag $C$DW$T$71

$C$DW$T$61	.dwtag  DW_TAG_typedef, DW_AT_name("iblDdr_t")
	.dwattr $C$DW$T$61, DW_AT_type(*$C$DW$T$71)
	.dwattr $C$DW$T$61, DW_AT_language(DW_LANG_C)

$C$DW$T$74	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$74, DW_AT_name("nandDevInfo_s")
	.dwattr $C$DW$T$74, DW_AT_byte_size(0x3c)
$C$DW$216	.dwtag  DW_TAG_member
	.dwattr $C$DW$216, DW_AT_type(*$C$DW$T$26)
	.dwattr $C$DW$216, DW_AT_name("busWidthBits")
	.dwattr $C$DW$216, DW_AT_TI_symbol_name("_busWidthBits")
	.dwattr $C$DW$216, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$216, DW_AT_accessibility(DW_ACCESS_public)
$C$DW$217	.dwtag  DW_TAG_member
	.dwattr $C$DW$217, DW_AT_type(*$C$DW$T$26)
	.dwattr $C$DW$217, DW_AT_name("pageSizeBytes")
	.dwattr $C$DW$217, DW_AT_TI_symbol_name("_pageSizeBytes")
	.dwattr $C$DW$217, DW_AT_data_member_location[DW_OP_plus_uconst 0x4]
	.dwattr $C$DW$217, DW_AT_accessibility(DW_ACCESS_public)
$C$DW$218	.dwtag  DW_TAG_member
	.dwattr $C$DW$218, DW_AT_type(*$C$DW$T$26)
	.dwattr $C$DW$218, DW_AT_name("pageEccBytes")
	.dwattr $C$DW$218, DW_AT_TI_symbol_name("_pageEccBytes")
	.dwattr $C$DW$218, DW_AT_data_member_location[DW_OP_plus_uconst 0x8]
	.dwattr $C$DW$218, DW_AT_accessibility(DW_ACCESS_public)
$C$DW$219	.dwtag  DW_TAG_member
	.dwattr $C$DW$219, DW_AT_type(*$C$DW$T$26)
	.dwattr $C$DW$219, DW_AT_name("pagesPerBlock")
	.dwattr $C$DW$219, DW_AT_TI_symbol_name("_pagesPerBlock")
	.dwattr $C$DW$219, DW_AT_data_member_location[DW_OP_plus_uconst 0xc]
	.dwattr $C$DW$219, DW_AT_accessibility(DW_ACCESS_public)
$C$DW$220	.dwtag  DW_TAG_member
	.dwattr $C$DW$220, DW_AT_type(*$C$DW$T$26)
	.dwattr $C$DW$220, DW_AT_name("totalBlocks")
	.dwattr $C$DW$220, DW_AT_TI_symbol_name("_totalBlocks")
	.dwattr $C$DW$220, DW_AT_data_member_location[DW_OP_plus_uconst 0x10]
	.dwattr $C$DW$220, DW_AT_accessibility(DW_ACCESS_public)
$C$DW$221	.dwtag  DW_TAG_member
	.dwattr $C$DW$221, DW_AT_type(*$C$DW$T$26)
	.dwattr $C$DW$221, DW_AT_name("addressBytes")
	.dwattr $C$DW$221, DW_AT_TI_symbol_name("_addressBytes")
	.dwattr $C$DW$221, DW_AT_data_member_location[DW_OP_plus_uconst 0x14]
	.dwattr $C$DW$221, DW_AT_accessibility(DW_ACCESS_public)
$C$DW$222	.dwtag  DW_TAG_member
	.dwattr $C$DW$222, DW_AT_type(*$C$DW$T$33)
	.dwattr $C$DW$222, DW_AT_name("lsbFirst")
	.dwattr $C$DW$222, DW_AT_TI_symbol_name("_lsbFirst")
	.dwattr $C$DW$222, DW_AT_data_member_location[DW_OP_plus_uconst 0x18]
	.dwattr $C$DW$222, DW_AT_accessibility(DW_ACCESS_public)
$C$DW$223	.dwtag  DW_TAG_member
	.dwattr $C$DW$223, DW_AT_type(*$C$DW$T$26)
	.dwattr $C$DW$223, DW_AT_name("blockOffset")
	.dwattr $C$DW$223, DW_AT_TI_symbol_name("_blockOffset")
	.dwattr $C$DW$223, DW_AT_data_member_location[DW_OP_plus_uconst 0x1c]
	.dwattr $C$DW$223, DW_AT_accessibility(DW_ACCESS_public)
$C$DW$224	.dwtag  DW_TAG_member
	.dwattr $C$DW$224, DW_AT_type(*$C$DW$T$26)
	.dwattr $C$DW$224, DW_AT_name("pageOffset")
	.dwattr $C$DW$224, DW_AT_TI_symbol_name("_pageOffset")
	.dwattr $C$DW$224, DW_AT_data_member_location[DW_OP_plus_uconst 0x20]
	.dwattr $C$DW$224, DW_AT_accessibility(DW_ACCESS_public)
$C$DW$225	.dwtag  DW_TAG_member
	.dwattr $C$DW$225, DW_AT_type(*$C$DW$T$26)
	.dwattr $C$DW$225, DW_AT_name("columnOffset")
	.dwattr $C$DW$225, DW_AT_TI_symbol_name("_columnOffset")
	.dwattr $C$DW$225, DW_AT_data_member_location[DW_OP_plus_uconst 0x24]
	.dwattr $C$DW$225, DW_AT_accessibility(DW_ACCESS_public)
$C$DW$226	.dwtag  DW_TAG_member
	.dwattr $C$DW$226, DW_AT_type(*$C$DW$T$72)
	.dwattr $C$DW$226, DW_AT_name("eccBytesIdx")
	.dwattr $C$DW$226, DW_AT_TI_symbol_name("_eccBytesIdx")
	.dwattr $C$DW$226, DW_AT_data_member_location[DW_OP_plus_uconst 0x28]
	.dwattr $C$DW$226, DW_AT_accessibility(DW_ACCESS_public)
$C$DW$227	.dwtag  DW_TAG_member
	.dwattr $C$DW$227, DW_AT_type(*$C$DW$T$73)
	.dwattr $C$DW$227, DW_AT_name("badBlkMarkIdx")
	.dwattr $C$DW$227, DW_AT_TI_symbol_name("_badBlkMarkIdx")
	.dwattr $C$DW$227, DW_AT_data_member_location[DW_OP_plus_uconst 0x32]
	.dwattr $C$DW$227, DW_AT_accessibility(DW_ACCESS_public)
$C$DW$228	.dwtag  DW_TAG_member
	.dwattr $C$DW$228, DW_AT_type(*$C$DW$T$35)
	.dwattr $C$DW$228, DW_AT_name("resetCommand")
	.dwattr $C$DW$228, DW_AT_TI_symbol_name("_resetCommand")
	.dwattr $C$DW$228, DW_AT_data_member_location[DW_OP_plus_uconst 0x34]
	.dwattr $C$DW$228, DW_AT_accessibility(DW_ACCESS_public)
$C$DW$229	.dwtag  DW_TAG_member
	.dwattr $C$DW$229, DW_AT_type(*$C$DW$T$35)
	.dwattr $C$DW$229, DW_AT_name("readCommandPre")
	.dwattr $C$DW$229, DW_AT_TI_symbol_name("_readCommandPre")
	.dwattr $C$DW$229, DW_AT_data_member_location[DW_OP_plus_uconst 0x35]
	.dwattr $C$DW$229, DW_AT_accessibility(DW_ACCESS_public)
$C$DW$230	.dwtag  DW_TAG_member
	.dwattr $C$DW$230, DW_AT_type(*$C$DW$T$35)
	.dwattr $C$DW$230, DW_AT_name("readCommandPost")
	.dwattr $C$DW$230, DW_AT_TI_symbol_name("_readCommandPost")
	.dwattr $C$DW$230, DW_AT_data_member_location[DW_OP_plus_uconst 0x36]
	.dwattr $C$DW$230, DW_AT_accessibility(DW_ACCESS_public)
$C$DW$231	.dwtag  DW_TAG_member
	.dwattr $C$DW$231, DW_AT_type(*$C$DW$T$33)
	.dwattr $C$DW$231, DW_AT_name("postCommand")
	.dwattr $C$DW$231, DW_AT_TI_symbol_name("_postCommand")
	.dwattr $C$DW$231, DW_AT_data_member_location[DW_OP_plus_uconst 0x38]
	.dwattr $C$DW$231, DW_AT_accessibility(DW_ACCESS_public)
	.dwendtag $C$DW$T$74

$C$DW$T$52	.dwtag  DW_TAG_typedef, DW_AT_name("nandDevInfo_t")
	.dwattr $C$DW$T$52, DW_AT_type(*$C$DW$T$74)
	.dwattr $C$DW$T$52, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$CU, DW_AT_language(DW_LANG_C)

;***************************************************************
;* DWARF CIE ENTRIES                                           *
;***************************************************************

$C$DW$CIE	.dwcie 228
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
	.dwcfi	undefined, 128
	.dwcfi	undefined, 129
	.dwcfi	undefined, 130
	.dwcfi	undefined, 131
	.dwcfi	undefined, 132
	.dwcfi	undefined, 133
	.dwcfi	undefined, 134
	.dwcfi	undefined, 135
	.dwcfi	undefined, 136
	.dwcfi	undefined, 137
	.dwcfi	undefined, 138
	.dwcfi	undefined, 139
	.dwcfi	undefined, 140
	.dwcfi	undefined, 141
	.dwcfi	undefined, 142
	.dwcfi	undefined, 143
	.dwcfi	undefined, 144
	.dwcfi	undefined, 145
	.dwcfi	undefined, 146
	.dwcfi	undefined, 147
	.dwcfi	undefined, 148
	.dwcfi	undefined, 149
	.dwcfi	undefined, 150
	.dwcfi	undefined, 151
	.dwcfi	undefined, 152
	.dwcfi	undefined, 153
	.dwcfi	undefined, 154
	.dwcfi	undefined, 155
	.dwcfi	undefined, 156
	.dwcfi	undefined, 157
	.dwcfi	undefined, 158
	.dwcfi	undefined, 159
	.dwcfi	undefined, 160
	.dwcfi	undefined, 161
	.dwcfi	undefined, 162
	.dwcfi	undefined, 163
	.dwcfi	undefined, 164
	.dwcfi	undefined, 165
	.dwcfi	undefined, 166
	.dwcfi	undefined, 167
	.dwcfi	undefined, 168
	.dwcfi	undefined, 169
	.dwcfi	undefined, 170
	.dwcfi	undefined, 171
	.dwcfi	undefined, 172
	.dwcfi	undefined, 173
	.dwcfi	undefined, 174
	.dwcfi	undefined, 175
	.dwcfi	undefined, 176
	.dwcfi	undefined, 177
	.dwcfi	undefined, 178
	.dwcfi	undefined, 179
	.dwcfi	undefined, 180
	.dwcfi	undefined, 181
	.dwcfi	undefined, 182
	.dwcfi	undefined, 183
	.dwcfi	undefined, 184
	.dwcfi	undefined, 185
	.dwcfi	undefined, 186
	.dwcfi	undefined, 187
	.dwcfi	undefined, 188
	.dwcfi	undefined, 189
	.dwcfi	undefined, 190
	.dwcfi	undefined, 191
	.dwcfi	undefined, 192
	.dwcfi	undefined, 193
	.dwcfi	undefined, 194
	.dwcfi	undefined, 195
	.dwcfi	undefined, 196
	.dwcfi	undefined, 197
	.dwcfi	undefined, 198
	.dwcfi	undefined, 199
	.dwcfi	undefined, 200
	.dwcfi	undefined, 201
	.dwcfi	undefined, 202
	.dwcfi	undefined, 203
	.dwcfi	undefined, 204
	.dwcfi	undefined, 205
	.dwcfi	undefined, 206
	.dwcfi	undefined, 207
	.dwcfi	undefined, 208
	.dwcfi	undefined, 209
	.dwcfi	undefined, 210
	.dwcfi	undefined, 211
	.dwcfi	undefined, 212
	.dwcfi	undefined, 213
	.dwcfi	undefined, 214
	.dwcfi	undefined, 215
	.dwcfi	undefined, 216
	.dwcfi	undefined, 217
	.dwcfi	undefined, 218
	.dwcfi	undefined, 219
	.dwcfi	undefined, 220
	.dwcfi	undefined, 221
	.dwcfi	undefined, 222
	.dwcfi	undefined, 223
	.dwcfi	undefined, 224
	.dwcfi	undefined, 225
	.dwcfi	undefined, 226
	.dwcfi	undefined, 227
	.dwcfi	undefined, 228
	.dwendentry

;***************************************************************
;* DWARF REGISTER MAP                                          *
;***************************************************************

$C$DW$232	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("A0")
	.dwattr $C$DW$232, DW_AT_location[DW_OP_reg0]
$C$DW$233	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("A1")
	.dwattr $C$DW$233, DW_AT_location[DW_OP_reg1]
$C$DW$234	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("A2")
	.dwattr $C$DW$234, DW_AT_location[DW_OP_reg2]
$C$DW$235	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("A3")
	.dwattr $C$DW$235, DW_AT_location[DW_OP_reg3]
$C$DW$236	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("A4")
	.dwattr $C$DW$236, DW_AT_location[DW_OP_reg4]
$C$DW$237	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("A5")
	.dwattr $C$DW$237, DW_AT_location[DW_OP_reg5]
$C$DW$238	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("A6")
	.dwattr $C$DW$238, DW_AT_location[DW_OP_reg6]
$C$DW$239	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("A7")
	.dwattr $C$DW$239, DW_AT_location[DW_OP_reg7]
$C$DW$240	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("A8")
	.dwattr $C$DW$240, DW_AT_location[DW_OP_reg8]
$C$DW$241	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("A9")
	.dwattr $C$DW$241, DW_AT_location[DW_OP_reg9]
$C$DW$242	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("A10")
	.dwattr $C$DW$242, DW_AT_location[DW_OP_reg10]
$C$DW$243	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("A11")
	.dwattr $C$DW$243, DW_AT_location[DW_OP_reg11]
$C$DW$244	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("A12")
	.dwattr $C$DW$244, DW_AT_location[DW_OP_reg12]
$C$DW$245	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("A13")
	.dwattr $C$DW$245, DW_AT_location[DW_OP_reg13]
$C$DW$246	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("A14")
	.dwattr $C$DW$246, DW_AT_location[DW_OP_reg14]
$C$DW$247	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("A15")
	.dwattr $C$DW$247, DW_AT_location[DW_OP_reg15]
$C$DW$248	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("B0")
	.dwattr $C$DW$248, DW_AT_location[DW_OP_reg16]
$C$DW$249	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("B1")
	.dwattr $C$DW$249, DW_AT_location[DW_OP_reg17]
$C$DW$250	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("B2")
	.dwattr $C$DW$250, DW_AT_location[DW_OP_reg18]
$C$DW$251	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("B3")
	.dwattr $C$DW$251, DW_AT_location[DW_OP_reg19]
$C$DW$252	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("B4")
	.dwattr $C$DW$252, DW_AT_location[DW_OP_reg20]
$C$DW$253	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("B5")
	.dwattr $C$DW$253, DW_AT_location[DW_OP_reg21]
$C$DW$254	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("B6")
	.dwattr $C$DW$254, DW_AT_location[DW_OP_reg22]
$C$DW$255	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("B7")
	.dwattr $C$DW$255, DW_AT_location[DW_OP_reg23]
$C$DW$256	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("B8")
	.dwattr $C$DW$256, DW_AT_location[DW_OP_reg24]
$C$DW$257	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("B9")
	.dwattr $C$DW$257, DW_AT_location[DW_OP_reg25]
$C$DW$258	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("B10")
	.dwattr $C$DW$258, DW_AT_location[DW_OP_reg26]
$C$DW$259	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("B11")
	.dwattr $C$DW$259, DW_AT_location[DW_OP_reg27]
$C$DW$260	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("B12")
	.dwattr $C$DW$260, DW_AT_location[DW_OP_reg28]
$C$DW$261	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("B13")
	.dwattr $C$DW$261, DW_AT_location[DW_OP_reg29]
$C$DW$262	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("DP")
	.dwattr $C$DW$262, DW_AT_location[DW_OP_reg30]
$C$DW$263	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("SP")
	.dwattr $C$DW$263, DW_AT_location[DW_OP_reg31]
$C$DW$264	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("FP")
	.dwattr $C$DW$264, DW_AT_location[DW_OP_regx 0x20]
$C$DW$265	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("PC")
	.dwattr $C$DW$265, DW_AT_location[DW_OP_regx 0x21]
$C$DW$266	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("IRP")
	.dwattr $C$DW$266, DW_AT_location[DW_OP_regx 0x22]
$C$DW$267	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("IFR")
	.dwattr $C$DW$267, DW_AT_location[DW_OP_regx 0x23]
$C$DW$268	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("NRP")
	.dwattr $C$DW$268, DW_AT_location[DW_OP_regx 0x24]
$C$DW$269	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("A16")
	.dwattr $C$DW$269, DW_AT_location[DW_OP_regx 0x25]
$C$DW$270	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("A17")
	.dwattr $C$DW$270, DW_AT_location[DW_OP_regx 0x26]
$C$DW$271	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("A18")
	.dwattr $C$DW$271, DW_AT_location[DW_OP_regx 0x27]
$C$DW$272	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("A19")
	.dwattr $C$DW$272, DW_AT_location[DW_OP_regx 0x28]
$C$DW$273	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("A20")
	.dwattr $C$DW$273, DW_AT_location[DW_OP_regx 0x29]
$C$DW$274	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("A21")
	.dwattr $C$DW$274, DW_AT_location[DW_OP_regx 0x2a]
$C$DW$275	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("A22")
	.dwattr $C$DW$275, DW_AT_location[DW_OP_regx 0x2b]
$C$DW$276	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("A23")
	.dwattr $C$DW$276, DW_AT_location[DW_OP_regx 0x2c]
$C$DW$277	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("A24")
	.dwattr $C$DW$277, DW_AT_location[DW_OP_regx 0x2d]
$C$DW$278	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("A25")
	.dwattr $C$DW$278, DW_AT_location[DW_OP_regx 0x2e]
$C$DW$279	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("A26")
	.dwattr $C$DW$279, DW_AT_location[DW_OP_regx 0x2f]
$C$DW$280	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("A27")
	.dwattr $C$DW$280, DW_AT_location[DW_OP_regx 0x30]
$C$DW$281	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("A28")
	.dwattr $C$DW$281, DW_AT_location[DW_OP_regx 0x31]
$C$DW$282	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("A29")
	.dwattr $C$DW$282, DW_AT_location[DW_OP_regx 0x32]
$C$DW$283	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("A30")
	.dwattr $C$DW$283, DW_AT_location[DW_OP_regx 0x33]
$C$DW$284	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("A31")
	.dwattr $C$DW$284, DW_AT_location[DW_OP_regx 0x34]
$C$DW$285	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("B16")
	.dwattr $C$DW$285, DW_AT_location[DW_OP_regx 0x35]
$C$DW$286	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("B17")
	.dwattr $C$DW$286, DW_AT_location[DW_OP_regx 0x36]
$C$DW$287	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("B18")
	.dwattr $C$DW$287, DW_AT_location[DW_OP_regx 0x37]
$C$DW$288	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("B19")
	.dwattr $C$DW$288, DW_AT_location[DW_OP_regx 0x38]
$C$DW$289	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("B20")
	.dwattr $C$DW$289, DW_AT_location[DW_OP_regx 0x39]
$C$DW$290	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("B21")
	.dwattr $C$DW$290, DW_AT_location[DW_OP_regx 0x3a]
$C$DW$291	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("B22")
	.dwattr $C$DW$291, DW_AT_location[DW_OP_regx 0x3b]
$C$DW$292	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("B23")
	.dwattr $C$DW$292, DW_AT_location[DW_OP_regx 0x3c]
$C$DW$293	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("B24")
	.dwattr $C$DW$293, DW_AT_location[DW_OP_regx 0x3d]
$C$DW$294	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("B25")
	.dwattr $C$DW$294, DW_AT_location[DW_OP_regx 0x3e]
$C$DW$295	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("B26")
	.dwattr $C$DW$295, DW_AT_location[DW_OP_regx 0x3f]
$C$DW$296	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("B27")
	.dwattr $C$DW$296, DW_AT_location[DW_OP_regx 0x40]
$C$DW$297	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("B28")
	.dwattr $C$DW$297, DW_AT_location[DW_OP_regx 0x41]
$C$DW$298	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("B29")
	.dwattr $C$DW$298, DW_AT_location[DW_OP_regx 0x42]
$C$DW$299	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("B30")
	.dwattr $C$DW$299, DW_AT_location[DW_OP_regx 0x43]
$C$DW$300	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("B31")
	.dwattr $C$DW$300, DW_AT_location[DW_OP_regx 0x44]
$C$DW$301	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("AMR")
	.dwattr $C$DW$301, DW_AT_location[DW_OP_regx 0x45]
$C$DW$302	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("CSR")
	.dwattr $C$DW$302, DW_AT_location[DW_OP_regx 0x46]
$C$DW$303	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("ISR")
	.dwattr $C$DW$303, DW_AT_location[DW_OP_regx 0x47]
$C$DW$304	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("ICR")
	.dwattr $C$DW$304, DW_AT_location[DW_OP_regx 0x48]
$C$DW$305	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("IER")
	.dwattr $C$DW$305, DW_AT_location[DW_OP_regx 0x49]
$C$DW$306	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("ISTP")
	.dwattr $C$DW$306, DW_AT_location[DW_OP_regx 0x4a]
$C$DW$307	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("IN")
	.dwattr $C$DW$307, DW_AT_location[DW_OP_regx 0x4b]
$C$DW$308	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("OUT")
	.dwattr $C$DW$308, DW_AT_location[DW_OP_regx 0x4c]
$C$DW$309	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("ACR")
	.dwattr $C$DW$309, DW_AT_location[DW_OP_regx 0x4d]
$C$DW$310	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("ADR")
	.dwattr $C$DW$310, DW_AT_location[DW_OP_regx 0x4e]
$C$DW$311	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("FADCR")
	.dwattr $C$DW$311, DW_AT_location[DW_OP_regx 0x4f]
$C$DW$312	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("FAUCR")
	.dwattr $C$DW$312, DW_AT_location[DW_OP_regx 0x50]
$C$DW$313	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("FMCR")
	.dwattr $C$DW$313, DW_AT_location[DW_OP_regx 0x51]
$C$DW$314	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("GFPGFR")
	.dwattr $C$DW$314, DW_AT_location[DW_OP_regx 0x52]
$C$DW$315	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("DIER")
	.dwattr $C$DW$315, DW_AT_location[DW_OP_regx 0x53]
$C$DW$316	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("REP")
	.dwattr $C$DW$316, DW_AT_location[DW_OP_regx 0x54]
$C$DW$317	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("TSCL")
	.dwattr $C$DW$317, DW_AT_location[DW_OP_regx 0x55]
$C$DW$318	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("TSCH")
	.dwattr $C$DW$318, DW_AT_location[DW_OP_regx 0x56]
$C$DW$319	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("ARP")
	.dwattr $C$DW$319, DW_AT_location[DW_OP_regx 0x57]
$C$DW$320	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("ILC")
	.dwattr $C$DW$320, DW_AT_location[DW_OP_regx 0x58]
$C$DW$321	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("RILC")
	.dwattr $C$DW$321, DW_AT_location[DW_OP_regx 0x59]
$C$DW$322	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("DNUM")
	.dwattr $C$DW$322, DW_AT_location[DW_OP_regx 0x5a]
$C$DW$323	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("SSR")
	.dwattr $C$DW$323, DW_AT_location[DW_OP_regx 0x5b]
$C$DW$324	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("GPLYA")
	.dwattr $C$DW$324, DW_AT_location[DW_OP_regx 0x5c]
$C$DW$325	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("GPLYB")
	.dwattr $C$DW$325, DW_AT_location[DW_OP_regx 0x5d]
$C$DW$326	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("TSR")
	.dwattr $C$DW$326, DW_AT_location[DW_OP_regx 0x5e]
$C$DW$327	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("ITSR")
	.dwattr $C$DW$327, DW_AT_location[DW_OP_regx 0x5f]
$C$DW$328	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("NTSR")
	.dwattr $C$DW$328, DW_AT_location[DW_OP_regx 0x60]
$C$DW$329	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("EFR")
	.dwattr $C$DW$329, DW_AT_location[DW_OP_regx 0x61]
$C$DW$330	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("ECR")
	.dwattr $C$DW$330, DW_AT_location[DW_OP_regx 0x62]
$C$DW$331	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("IERR")
	.dwattr $C$DW$331, DW_AT_location[DW_OP_regx 0x63]
$C$DW$332	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("DMSG")
	.dwattr $C$DW$332, DW_AT_location[DW_OP_regx 0x64]
$C$DW$333	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("CMSG")
	.dwattr $C$DW$333, DW_AT_location[DW_OP_regx 0x65]
$C$DW$334	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("DT_DMA_ADDR")
	.dwattr $C$DW$334, DW_AT_location[DW_OP_regx 0x66]
$C$DW$335	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("DT_DMA_DATA")
	.dwattr $C$DW$335, DW_AT_location[DW_OP_regx 0x67]
$C$DW$336	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("DT_DMA_CNTL")
	.dwattr $C$DW$336, DW_AT_location[DW_OP_regx 0x68]
$C$DW$337	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("TCU_CNTL")
	.dwattr $C$DW$337, DW_AT_location[DW_OP_regx 0x69]
$C$DW$338	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("RTDX_REC_CNTL")
	.dwattr $C$DW$338, DW_AT_location[DW_OP_regx 0x6a]
$C$DW$339	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("RTDX_XMT_CNTL")
	.dwattr $C$DW$339, DW_AT_location[DW_OP_regx 0x6b]
$C$DW$340	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("RTDX_CFG")
	.dwattr $C$DW$340, DW_AT_location[DW_OP_regx 0x6c]
$C$DW$341	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("RTDX_RDATA")
	.dwattr $C$DW$341, DW_AT_location[DW_OP_regx 0x6d]
$C$DW$342	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("RTDX_WDATA")
	.dwattr $C$DW$342, DW_AT_location[DW_OP_regx 0x6e]
$C$DW$343	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("RTDX_RADDR")
	.dwattr $C$DW$343, DW_AT_location[DW_OP_regx 0x6f]
$C$DW$344	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("RTDX_WADDR")
	.dwattr $C$DW$344, DW_AT_location[DW_OP_regx 0x70]
$C$DW$345	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("MFREG0")
	.dwattr $C$DW$345, DW_AT_location[DW_OP_regx 0x71]
$C$DW$346	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("DBG_STAT")
	.dwattr $C$DW$346, DW_AT_location[DW_OP_regx 0x72]
$C$DW$347	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("BRK_EN")
	.dwattr $C$DW$347, DW_AT_location[DW_OP_regx 0x73]
$C$DW$348	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("HWBP0_CNT")
	.dwattr $C$DW$348, DW_AT_location[DW_OP_regx 0x74]
$C$DW$349	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("HWBP0")
	.dwattr $C$DW$349, DW_AT_location[DW_OP_regx 0x75]
$C$DW$350	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("HWBP1")
	.dwattr $C$DW$350, DW_AT_location[DW_OP_regx 0x76]
$C$DW$351	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("HWBP2")
	.dwattr $C$DW$351, DW_AT_location[DW_OP_regx 0x77]
$C$DW$352	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("HWBP3")
	.dwattr $C$DW$352, DW_AT_location[DW_OP_regx 0x78]
$C$DW$353	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("OVERLAY")
	.dwattr $C$DW$353, DW_AT_location[DW_OP_regx 0x79]
$C$DW$354	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("PC_PROF")
	.dwattr $C$DW$354, DW_AT_location[DW_OP_regx 0x7a]
$C$DW$355	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("ATSR")
	.dwattr $C$DW$355, DW_AT_location[DW_OP_regx 0x7b]
$C$DW$356	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("TRR")
	.dwattr $C$DW$356, DW_AT_location[DW_OP_regx 0x7c]
$C$DW$357	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("TCRR")
	.dwattr $C$DW$357, DW_AT_location[DW_OP_regx 0x7d]
$C$DW$358	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("DESR")
	.dwattr $C$DW$358, DW_AT_location[DW_OP_regx 0x7e]
$C$DW$359	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("DETR")
	.dwattr $C$DW$359, DW_AT_location[DW_OP_regx 0x7f]
$C$DW$360	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("CIE_RETA")
	.dwattr $C$DW$360, DW_AT_location[DW_OP_regx 0xe4]
	.dwendtag $C$DW$CU

