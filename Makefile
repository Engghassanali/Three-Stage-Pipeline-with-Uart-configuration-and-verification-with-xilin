RTL_FILE1  = ALU
RTL_FILE2  = Branch
RTL_FILE3  = controller
RTL_FILE4  = csr_regfile
RTL_FILE5  = Data_memory
RTL_FILE6  = hazard_unit
RTL_FILE7  = Immediate_generator
RTL_FILE8  = instruction_memory
RTL_FILE9  = Ld_St_unit
RTL_FILE10 = mux
RTL_FILE11 = register_file
RTL_FILE12 = RISC_V
RTL_FILE13 = UART

TB_FILE1   = RISC_V_tb
TB_PATH    = sim/
RTL_PATH   = rtl/
WAVE_PATH  = docs/
WAVE_NAME  = dump

conv_to_machine:  #converts assembly code to machine code
    cd docs/assembly_to_machine/ && $(MAKE)   #this make does not call this makefile but in that folder

run_cli:
    xrun $(TB_PATH)$(TB_FILE1).sv $(RTL_PATH)$(RTL_FILE1).sv $(RTL_PATH)$(RTL_FILE2).sv $(RTL_PATH)$(RTL_FILE3).sv $(RTL_PATH)$(RTL_FILE4).sv $(RTL_PATH)$(RTL_FILE5).sv $(RTL_PATH)$(RTL_FILE6).sv $(RTL_PATH)$(RTL_FILE7).sv $(RTL_PATH)$(RTL_FILE8).sv $(RTL_PATH)$(RTL_FILE9).sv $(RTL_PATH)$(RTL_FILE10).sv $(RTL_PATH)$(RTL_FILE11).sv $(RTL_PATH)$(RTL_FILE12).sv $(RTL_PATH)$(RTL_FILE13).sv -timescale 1ns/1ps -access +rwc -disable_sem2009
run gui:
	xrun $(TB_PATH)$(TB_FILE1).sv $(RTL_PATH)$(RTL_FILE1).sv $(RTL_PATH)$(RTL_FILE2).sv $(RTL_PATH)$(RTL_FILE3).sv $(RTL_PATH)$(RTL_FILE4).sv $(RTL_PATH)$(RTL_FILE5).sv $(RTL_PATH)$(RTL_FILE6).sv $(RTL_PATH)$(RTL_FILE7).sv $(RTL_PATH)$(RTL_FILE8).sv $(RTL_PATH)$(RTL_FILE9).sv $(RTL_PATH)$(RTL_FILE10).sv $(RTL_PATH)$(RTL_FILE11).sv $(RTL_PATH)$(RTL_FILE12).sv $(RTL_PATH)$(RTL_FILE13).sv -timescale 1ns/1ps -access +rwc -gui -disable_sem2009
wave:
    gtkwave $(WAVE_PATH)$(WAVE_NAME).vcd