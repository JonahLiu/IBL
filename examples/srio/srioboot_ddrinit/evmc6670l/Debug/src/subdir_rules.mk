################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Each subdirectory must supply rules for building sources it contributes
src/srioboot_ddrinit.obj: /home/gtbldadm/ti/mcsdk_2_01_02_06/tools/boot_loader/examples/srio/srioboot_ddrinit/src/srioboot_ddrinit.c $(GEN_OPTS) $(GEN_SRCS)
	@echo 'Building file: $<'
	@echo 'Invoking: C6000 Compiler'
	"/home/gtbldadm/ti/TI_CGT_C6000_7.4.0/bin/cl6x" -mv6600 --abi=eabi -g --include_path="/home/gtbldadm/ti/TI_CGT_C6000_7.4.0/include" --include_path="/home/gtbldadm/ti/pdk_C6670_1_1_2_6/packages/ti/platform" --include_path="/home/gtbldadm/ti/pdk_C6670_1_1_2_6/packages" --include_path="/home/gtbldadm/ti/mcsdk_2_01_02_06/tools/boot_loader/examples/srio/srioboot_ddrinit/include" --define=_EVMC6670L_ --display_error_number --diag_warning=225 --preproc_with_compile --preproc_dependency="src/srioboot_ddrinit.pp" --obj_directory="src" $(GEN_OPTS__FLAG) "$(shell echo $<)"
	@echo 'Finished building: $<'
	@echo ' '


