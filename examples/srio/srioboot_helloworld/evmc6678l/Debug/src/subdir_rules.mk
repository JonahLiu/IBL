################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Each subdirectory must supply rules for building sources it contributes
src/srioboot_helloworld.obj: /home/gtbldadm/ti/mcsdk_2_01_02_06/tools/boot_loader/examples/srio/srioboot_helloworld/src/srioboot_helloworld.c $(GEN_OPTS) $(GEN_SRCS)
	@echo 'Building file: $<'
	@echo 'Invoking: C6000 Compiler'
	"/home/gtbldadm/ti/TI_CGT_C6000_7.4.0/bin/cl6x" -mv6600 --abi=eabi -g --include_path="/home/gtbldadm/ti/TI_CGT_C6000_7.4.0/include" --include_path="/home/gtbldadm/ti/pdk_C6678_1_1_2_6/packages/ti/platform" --include_path="/home/gtbldadm/ti/pdk_C6678_1_1_2_6/packages" --define=_EVMC6678L_ --display_error_number --diag_warning=225 --preproc_with_compile --preproc_dependency="src/srioboot_helloworld.pp" --obj_directory="src" $(GEN_OPTS__FLAG) "$(shell echo $<)"
	@echo 'Finished building: $<'
	@echo ' '


