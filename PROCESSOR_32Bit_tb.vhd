--------------------------------------------------------------------------------
-- Create Date:   14:18:09 01/24/2016
-- VHDL Test Bench Created by ISE for module: PROCESSOR_32Bit
--------------------------------------------------------------------------------
----------------------------------------------------------------------------------
-- LIBRARIES / PACKAGES
----------------------------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
----------------------------------------------------------------------------------
-- ENTITY
----------------------------------------------------------------------------------
ENTITY PROCESSOR_32Bit_tb IS
END PROCESSOR_32Bit_tb;
----------------------------------------------------------------------------------
-- ARCHITECTURE
----------------------------------------------------------------------------------
ARCHITECTURE behavior OF PROCESSOR_32Bit_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
    COMPONENT PROCESSOR_32Bit
		 PORT(
				ref_clk : IN  STD_LOGIC;
				reset   : IN  STD_LOGIC;
				-- Test Ports
				out_pc                    : OUT STD_LOGIC_VECTOR(31 DOWNTO 0); -- out_ProgramCounter
				out_adder_pc              : OUT STD_LOGIC_VECTOR(31 DOWNTO 0); -- out_Adder_PC
				out_rom                   : OUT STD_LOGIC_VECTOR(31 DOWNTO 0); -- out_Rom
				out_mux_jal               : OUT STD_LOGIC_VECTOR(4 DOWNTO 0);  -- out_Mux_JalControl
				out_mux_regdst            : OUT STD_LOGIC_VECTOR(4 DOWNTO 0);  -- out_Mux_RegDst
				out_mux_jaladdr           : OUT STD_LOGIC_VECTOR(4 DOWNTO 0);  -- out_Mux_JalAddrControl
				out_mux_jaldata           : OUT STD_LOGIC_VECTOR(31 DOWNTO 0); -- out_Mux_JalDataControl
				out_concatenate           : OUT STD_LOGIC_VECTOR(31 DOWNTO 0); -- out_Concatinate
				out_controller_jal        : OUT STD_LOGIC;                     -- out_Controller_JALControl
				out_controller_regdst     : OUT STD_LOGIC;                     -- out_Controller_RegDst
				out_controller_jaladdr    : OUT STD_LOGIC;                     -- out_Controller_JALAddrControl
				out_controller_jaldata    : OUT STD_LOGIC;                     -- out_Controller_JALDataControl
				out_controller_shiftvalue : OUT STD_LOGIC;                     -- out_Controller_ShiftValueControl
				out_controller_load       : OUT STD_LOGIC;                     -- out_Controller_LoadControl
				out_controller_jr         : OUT STD_LOGIC;                     -- out_Controller_JRControl
				out_controller_jumporjr   : OUT STD_LOGIC;                     -- out_Controller_JumpOrJRControl
				out_controller_lui        : OUT STD_LOGIC;                     -- out_Controller_LUIControl
				out_controller_branch     : OUT STD_LOGIC;                     -- out_Controller_Branch
				out_controller_memtoreg   : OUT STD_LOGIC;                     -- out_Controller_MemToReg
				out_controller_memwrite   : OUT STD_LOGIC;                     -- out_Controller_MemWrite
				out_controller_dsize      : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);  -- out_Controller_DSize
				out_controller_alu        : OUT STD_LOGIC_VECTOR(5 DOWNTO 0);  -- out_Controller_ALUControl
				out_controller_alusrc     : OUT STD_LOGIC;                     -- out_Controller_ALUSource
				out_controller_regwrite   : OUT STD_LOGIC;                     -- out_Controller_RegWrite
				out_regfile_rdata1        : OUT STD_LOGIC_VECTOR(31 DOWNTO 0); -- out_RegisterFile_RData1
				out_regfile_rdata2        : OUT STD_LOGIC_VECTOR(31 DOWNTO 0); -- out_RegisterFile_RData2
				out_signextend_a          : OUT STD_LOGIC_VECTOR(31 DOWNTO 0); -- out_SignExtendA
				out_signextend_b          : OUT STD_LOGIC_VECTOR(31 DOWNTO 0); -- out_SignExtendB
				out_mux_alusrc            : OUT STD_LOGIC_VECTOR(31 DOWNTO 0); -- out_Mux_ALUSrc
				out_mux_shiftvalue        : OUT STD_LOGIC_VECTOR(31 DOWNTO 0); -- out_Mux_ShiftValueControl
				out_shiftrighttwo         : OUT STD_LOGIC_VECTOR(31 DOWNTO 0); -- out_ShiftRightTwo
				out_alu_branch            : OUT STD_LOGIC;                     -- out_ALU_BranchOut
				out_alu                   : OUT STD_LOGIC_VECTOR(31 DOWNTO 0); -- out_ALU
				out_adder_jump            : OUT STD_LOGIC_VECTOR(31 DOWNTO 0); -- out_Adder_Jump
				out_mux_jump              : OUT STD_LOGIC_VECTOR(31 DOWNTO 0); -- out_Mux_JumpControl
				out_and                   : OUT STD_LOGIC;                     -- out_AND
				out_shiftandextend        : OUT STD_LOGIC_VECTOR(31 DOWNTO 0); -- out_ShiftAndExtend
				out_mux_jumporjr          : OUT STD_LOGIC_VECTOR(31 DOWNTO 0); -- out_Mux_JumpORJRControl
				out_mux_jr                : OUT STD_LOGIC_VECTOR(31 DOWNTO 0); -- out_Mux_JRControl
				out_ram                   : OUT STD_LOGIC_VECTOR(31 DOWNTO 0); -- out_Ram
				out_mux_lui               : OUT STD_LOGIC_VECTOR(31 DOWNTO 0); -- out_Mux_LUIControl
				out_mux_wb                : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)  -- out_Mux_WBControl
		 );
    END COMPONENT;

 	--Outputs
   SIGNAL ref_clk_tb : STD_LOGIC := '0';
   SIGNAL reset_tb   : STD_LOGIC := '0';
	--TestSignals
	SIGNAL out_pc_tb                    : STD_LOGIC_VECTOR(31 DOWNTO 0); -- out_ProgramCounter
	SIGNAL out_adder_pc_tb              : STD_LOGIC_VECTOR(31 DOWNTO 0); -- out_Adder_PC
	SIGNAL out_rom_tb                   : STD_LOGIC_VECTOR(31 DOWNTO 0); -- out_Rom
	SIGNAL out_mux_jal_tb               : STD_LOGIC_VECTOR(4 DOWNTO 0);  -- out_Mux_JalControl
	SIGNAL out_mux_regdst_tb            : STD_LOGIC_VECTOR(4 DOWNTO 0);  -- out_Mux_RegDst
	SIGNAL out_mux_jaladdr_tb           : STD_LOGIC_VECTOR(4 DOWNTO 0);  -- out_Mux_JalAddrControl
	SIGNAL out_mux_jaldata_tb           : STD_LOGIC_VECTOR(31 DOWNTO 0); -- out_Mux_JalDataControl
	SIGNAL out_concatenate_tb           : STD_LOGIC_VECTOR(31 DOWNTO 0); -- out_Concatinate
	SIGNAL out_controller_jal_tb        : STD_LOGIC;                     -- out_Controller_JALControl
	SIGNAL out_controller_regdst_tb     : STD_LOGIC;                     -- out_Controller_RegDst
	SIGNAL out_controller_jaladdr_tb    : STD_LOGIC;                     -- out_Controller_JALAddrControl
	SIGNAL out_controller_jaldata_tb    : STD_LOGIC;                     -- out_Controller_JALDataControl
	SIGNAL out_controller_shiftvalue_tb : STD_LOGIC;                     -- out_Controller_ShiftValueControl
	SIGNAL out_controller_load_tb       : STD_LOGIC;                     -- out_Controller_LoadControl
	SIGNAL out_controller_jr_tb         : STD_LOGIC;                     -- out_Controller_JRControl
	SIGNAL out_controller_jumporjr_tb   : STD_LOGIC;                     -- out_Controller_JumpOrJRControl
	SIGNAL out_controller_lui_tb        : STD_LOGIC;                     -- out_Controller_LUIControl
	SIGNAL out_controller_branch_tb     : STD_LOGIC;                     -- out_Controller_Branch
	SIGNAL out_controller_memtoreg_tb   : STD_LOGIC;                     -- out_Controller_MemToReg
	SIGNAL out_controller_memwrite_tb   : STD_LOGIC;                     -- out_Controller_MemWrite
	SIGNAL out_controller_dsize_tb      : STD_LOGIC_VECTOR(1 DOWNTO 0);  -- out_Controller_DSize
	SIGNAL out_controller_alu_tb        : STD_LOGIC_VECTOR(5 DOWNTO 0);  -- out_Controller_ALUControl
	SIGNAL out_controller_alusrc_tb     : STD_LOGIC;                     -- out_Controller_ALUSource
	SIGNAL out_controller_regwrite_tb   : STD_LOGIC;                     -- out_Controller_RegWrite
	SIGNAL out_regfile_rdata1_tb        : STD_LOGIC_VECTOR(31 DOWNTO 0); -- out_RegisterFile_RData1
	SIGNAL out_regfile_rdata2_tb        : STD_LOGIC_VECTOR(31 DOWNTO 0); -- out_RegisterFile_RData2
	SIGNAL out_signextend_a_tb          : STD_LOGIC_VECTOR(31 DOWNTO 0); -- out_SignExtendA
	SIGNAL out_signextend_b_tb          : STD_LOGIC_VECTOR(31 DOWNTO 0); -- out_SignExtendB
	SIGNAL out_mux_alusrc_tb            : STD_LOGIC_VECTOR(31 DOWNTO 0); -- out_Mux_ALUSrc
	SIGNAL out_mux_shiftvalue_tb        : STD_LOGIC_VECTOR(31 DOWNTO 0); -- out_Mux_ShiftValueControl
	SIGNAL out_shiftrighttwo_tb         : STD_LOGIC_VECTOR(31 DOWNTO 0); -- out_ShiftRightTwo
	SIGNAL out_alu_branch_tb            : STD_LOGIC;                     -- out_ALU_BranchOut
	SIGNAL out_alu_tb                   : STD_LOGIC_VECTOR(31 DOWNTO 0); -- out_ALU
	SIGNAL out_adder_jump_tb            : STD_LOGIC_VECTOR(31 DOWNTO 0); -- out_Adder_Jump
	SIGNAL out_mux_jump_tb              : STD_LOGIC_VECTOR(31 DOWNTO 0); -- out_Mux_JumpControl
	SIGNAL out_and_tb                   : STD_LOGIC;                     -- out_AND
	SIGNAL out_shiftandextend_tb        : STD_LOGIC_VECTOR(31 DOWNTO 0); -- out_ShiftAndExtend
	SIGNAL out_mux_jumporjr_tb          : STD_LOGIC_VECTOR(31 DOWNTO 0); -- out_Mux_JumpORJRControl
	SIGNAL out_mux_jr_tb                : STD_LOGIC_VECTOR(31 DOWNTO 0); -- out_Mux_JRControl
	SIGNAL out_ram_tb                   : STD_LOGIC_VECTOR(31 DOWNTO 0); -- out_Ram
	SIGNAL out_mux_lui_tb               : STD_LOGIC_VECTOR(31 DOWNTO 0); -- out_Mux_LUIControl
	SIGNAL out_mux_wb_tb                : STD_LOGIC_VECTOR(31 DOWNTO 0);  -- out_Mux_WBControl

   -- Clock period definitions
   CONSTANT ref_clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: PROCESSOR_32Bit 
		PORT MAP (
			ref_clk => ref_clk_tb,
         reset => reset_tb,
			--Testing
			out_pc => out_pc_tb,
			out_adder_pc => out_adder_pc_tb,
			out_rom => out_rom_tb,
			out_mux_jal => out_mux_jal_tb,
			out_mux_regdst => out_mux_regdst_tb,
			out_mux_jaladdr => out_mux_jaladdr_tb,
			out_mux_jaldata => out_mux_jaldata_tb,
			out_concatenate => out_concatenate_tb,
			out_controller_jal => out_controller_jal_tb,
			out_controller_regdst => out_controller_regdst_tb,
			out_controller_jaladdr => out_controller_jaladdr_tb,
			out_controller_jaldata => out_controller_jaldata_tb,
			out_controller_shiftvalue => out_controller_shiftvalue_tb,
			out_controller_load => out_controller_load_tb,
			out_controller_jr => out_controller_jr_tb,
			out_controller_jumporjr => out_controller_jumporjr_tb,
			out_controller_lui => out_controller_lui_tb,
			out_controller_branch => out_controller_branch_tb,
			out_controller_memtoreg => out_controller_memtoreg_tb,
			out_controller_memwrite => out_controller_memwrite_tb,
			out_controller_dsize => out_controller_dsize_tb,
			out_controller_alu => out_controller_alu_tb,
			out_controller_alusrc => out_controller_alusrc_tb,
			out_controller_regwrite => out_controller_regwrite_tb,
			out_regfile_rdata1 => out_regfile_rdata1_tb,
			out_regfile_rdata2 => out_regfile_rdata2_tb,
			out_signextend_a => out_signextend_a_tb,
			out_signextend_b => out_signextend_b_tb,
			out_mux_alusrc => out_mux_alusrc_tb,
			out_mux_shiftvalue => out_mux_shiftvalue_tb,
			out_shiftrighttwo => out_shiftrighttwo_tb,
			out_alu_branch => out_alu_branch_tb,
			out_alu => out_alu_tb,
			out_adder_jump => out_adder_jump_tb,
			out_mux_jump => out_mux_jump_tb,
			out_and => out_and_tb,
			out_shiftandextend => out_shiftandextend_tb,
			out_mux_jumporjr => out_mux_jumporjr_tb,
			out_mux_jr => out_mux_jr_tb,
			out_ram => out_ram_tb,
			out_mux_lui => out_mux_lui_tb,
			out_mux_wb => out_mux_wb_tb
		);

   -- Clock process definitions
   ref_clk_process :PROCESS
   BEGIN
		ref_clk_tb <= '0';
		WAIT FOR ref_clk_period/2;
		ref_clk_tb <= '1';
		WAIT FOR ref_clk_period/2;
   END PROCESS;

   -- Stimulus process
   stim_proc: PROCESS
   BEGIN
      -- hold reset state for 100 ns.
      WAIT FOR 50 ns;
		
   END PROCESS;

END;
