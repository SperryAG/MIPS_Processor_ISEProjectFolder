----------------------------------------------------------------------------------
-- Create Date:    13:06:22 01/18/2016 
-- Module Name:    PROCESSOR_32Bit - Behavioral 
----------------------------------------------------------------------------------
----------------------------------------------------------------------------------
-- LIBRARIES / PACKAGES
----------------------------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE WORK.PROCESSOR_PKG.ALL;
----------------------------------------------------------------------------------
-- ENTITY
----------------------------------------------------------------------------------
ENTITY PROCESSOR_32Bit IS
	PORT(
		ref_clk : IN std_logic;
		reset   : IN std_logic;
		-- Test Ports
		out_pc                    : OUT STD_LOGIC_VECTOR(31 DOWNTO 0); -- out_ProgramCounter
	   out_adder_pc              : OUT STD_LOGIC_VECTOR(31 DOWNTO 0); -- out_Adder_PC
	   out_rom                   : OUT STD_LOGIC_VECTOR(31 DOWNTO 0); -- out_Rom
		out_shiftleft             : OUT STD_LOGIC_VECTOR(25 DOWNTO 0); -- out_ShiftLeft
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
		out_controller_load       : OUT STD_LOGIC_vector(1 DOWNTO 0);  -- out_Controller_LoadControl
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
		out_splitter              : OUT STD_LOGIC_VECTOR(31 DOWNTO 0); -- out_Splitter
		out_mux_jumporjr          : OUT STD_LOGIC_VECTOR(31 DOWNTO 0); -- out_Mux_JumpORJRControl
		out_mux_jr                : OUT STD_LOGIC_VECTOR(31 DOWNTO 0); -- out_Mux_JRControl
		out_ram                   : OUT STD_LOGIC_VECTOR(31 DOWNTO 0); -- out_Ram
		out_mux_lui               : OUT STD_LOGIC_VECTOR(31 DOWNTO 0); -- out_Mux_LUIControl
		out_mux_wb                : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)  -- out_Mux_WBControl	
	);
END PROCESSOR_32Bit;
----------------------------------------------------------------------------------
-- ARCHITECTURE
----------------------------------------------------------------------------------
ARCHITECTURE Behavioral OF PROCESSOR_32Bit IS
--WIRING HERE--
    -- Clock Signal
	 SIGNAL wClk : STD_LOGIC;
	 -- Reset Signal
	 SIGNAL wRst : STD_LOGIC;
	 -- Special Signals
	 SIGNAL wLow       : STD_LOGIC_VECTOR(31 DOWNTO 0) := "00000000000000000000000000000000"; -- 0
	 SIGNAL wHigh      : STD_LOGIC_VECTOR(31 DOWNTO 0) := "00000000000000000000000000000001"; -- 1
	 SIGNAL wFour      : STD_LOGIC_VECTOR(31 DOWNTO 0) := "00000000000000000000000000000100"; -- 4
	 SIGNAL wThirtyOne : STD_LOGIC_VECTOR(4 DOWNTO 0) := "11111"; -- 31
	 
	 -- Common Signals
	 SIGNAL w01 : STD_LOGIC_VECTOR(31 DOWNTO 0); -- out_ProgramCounter
	 SIGNAL w02 : STD_LOGIC_VECTOR(31 DOWNTO 0); -- out_Adder_PC
	 SIGNAL w03 : STD_LOGIC_VECTOR(31 DOWNTO 0); -- out_Rom
	 SIGNAL w04 : STD_LOGIC_VECTOR(25 DOWNTO 0); -- out_ShiftLeft
	 SIGNAL w05 : STD_LOGIC_VECTOR(4 DOWNTO 0);  -- out_Mux_JalControl
	 SIGNAL w06 : STD_LOGIC_VECTOR(4 DOWNTO 0);  -- out_Mux_RegDst
	 SIGNAL w07 : STD_LOGIC_VECTOR(4 DOWNTO 0);  -- out_Mux_JalAddrControl
	 SIGNAL w08 : STD_LOGIC_VECTOR(31 DOWNTO 0); -- out_Mux_JalDataControl
	 SIGNAL w09 : STD_LOGIC_VECTOR(31 DOWNTO 0); -- out_Concatinate
	 SIGNAL w10 : STD_LOGIC;                     -- out_Controller_JALControl
	 SIGNAL w11 : STD_LOGIC;                     -- out_Controller_RegDst
	 SIGNAL w12 : STD_LOGIC;                     -- out_Controller_JALAddrControl
	 SIGNAL w13 : STD_LOGIC;                     -- out_Controller_JALDataControl
	 SIGNAL w14 : STD_LOGIC;                     -- out_Controller_ShiftValueControl
	 SIGNAL w15 : STD_LOGIC_vector(1 DOWNTO 0);  -- out_Controller_LoadControl
	 SIGNAL w16 : STD_LOGIC;                     -- out_Controller_JRControl
	 SIGNAL w17 : STD_LOGIC;                     -- out_Controller_JumpOrJRControl
	 SIGNAL w18 : STD_LOGIC;                     -- out_Controller_LUIControl
	 SIGNAL w19 : STD_LOGIC;                     -- out_Controller_Branch
	 SIGNAL w20 : STD_LOGIC;                     -- out_Controller_MemToReg
	 SIGNAL w21 : STD_LOGIC;                     -- out_Controller_MemWrite
	 SIGNAL w22 : STD_LOGIC_VECTOR(1 DOWNTO 0);  -- out_Controller_DSize
	 SIGNAL w23 : STD_LOGIC_VECTOR(5 DOWNTO 0);  -- out_Controller_ALUControl
	 SIGNAL w24 : STD_LOGIC;                     -- out_Controller_ALUSource
	 SIGNAL w25 : STD_LOGIC;                     -- out_Controller_RegWrite
	 SIGNAL w26 : STD_LOGIC_VECTOR(31 DOWNTO 0); -- out_RegisterFile_RData1
	 SIGNAL w27 : STD_LOGIC_VECTOR(31 DOWNTO 0); -- out_RegisterFile_RData2
	 SIGNAL w28 : STD_LOGIC_VECTOR(31 DOWNTO 0); -- out_SignExtendA
	 SIGNAL w29 : STD_LOGIC_VECTOR(31 DOWNTO 0); -- out_SignExtendB
	 SIGNAL w30 : STD_LOGIC_VECTOR(31 DOWNTO 0); -- out_Mux_ALUSrc
	 SIGNAL w31 : STD_LOGIC_VECTOR(31 DOWNTO 0); -- out_Mux_ShiftValueControl
	 SIGNAL w32 : STD_LOGIC_VECTOR(31 DOWNTO 0); -- out_ShiftRightTwo
	 SIGNAL w33 : STD_LOGIC;                     -- out_ALU_BranchOut
	 SIGNAL w34 : STD_LOGIC_VECTOR(31 DOWNTO 0); -- out_ALU
	 SIGNAL w35 : STD_LOGIC_VECTOR(31 DOWNTO 0); -- out_Adder_Jump
	 SIGNAL w36 : STD_LOGIC_VECTOR(31 DOWNTO 0); -- out_Mux_JumpControl
	 SIGNAL w37 : STD_LOGIC;                     -- out_AND
	 SIGNAL w38 : STD_LOGIC_VECTOR(31 DOWNTO 0); -- out_ShiftAndExtend
	 SIGNAL w39 : STD_LOGIC_VECTOR(31 DOWNTO 0); -- out_Splitter
	 SIGNAL w40 : STD_LOGIC_VECTOR(31 DOWNTO 0); -- out_Mux_JumpORJRControl
	 SIGNAL w41 : STD_LOGIC_VECTOR(31 DOWNTO 0); -- out_Mux_JRControl
	 SIGNAL w42 : STD_LOGIC_VECTOR(31 DOWNTO 0); -- out_Ram
	 SIGNAL w43 : STD_LOGIC_VECTOR(31 DOWNTO 0); -- out_Mux_LUIControl
	 SIGNAL w44 : STD_LOGIC_VECTOR(31 DOWNTO 0); -- out_Mux_WBControl
	 
BEGIN
--INSTANTIATIONS--
	
	--Instantiate PROGRAM COUNTER
	Inst_PROG_COUNTER_32Bit: PROG_COUNTER_32Bit
	PORT MAP(
		clk => wClk,
		dataI => w40,
		dataO => w01
	);
	
   --Instantiate PC ADDER
	Inst_ADDER_32Bit_Unsigned_PC: ADDER_32Bit_Unsigned 
	PORT MAP(
		pc  => w01,
		val => wFour,
		o   => w02
	);
	
	-- Instantiate ROM
	Inst_ROM_512x32Bit: ROM_512x32Bit 
	PORT MAP(
		addr => w01,
		dataIO => w03
	);
	
	-- Instantiate SHIFT LEFT
	Inst_SHIFTLEFT_26Bit: SHIFTLEFT_26Bit
	PORT MAP(
		i => w03(25 DOWNTO 0),
		o => w04
	);
	
	-- Instantiate MUX_JalControl
	Inst_MUX_2to1_5Bit_JalControl: MUX_2to1_5Bit 
	PORT MAP(
		d0 => w03(15 DOWNTO 11),
		d1 => wThirtyOne,
		sel => w10,
		o => w05
	);
	
   -- Instantiate MUX_RegDst
	Inst_MUX_2to1_5Bit_RegDst: MUX_2to1_5Bit 
	PORT MAP(
		d0 => w03(20 DOWNTO 16),
		d1 => w03(15 DOWNTO 11),
		sel => w11,
		o => w06
	);
	
	-- Instantiate MUX_JALAddrControl
	Inst_MUX_2to1_5Bit_JALAddrControl: MUX_2to1_5Bit 
	PORT MAP(
		d0 => w06,
		d1 => w05,
		sel => w12,
		o => w07
	);
	
	-- Instantiate MUX_JALDataControl
	Inst_MUX_2to1_32Bit_JALDataControl: MUX_2to1_32Bit 
	PORT MAP(
		d0 => w02,
		d1 => w39,
		sel => w13,
		o => w08
	);
	
	-- Instantiate Concatenate
	Inst_CONCATENATE_26to32Bit: CONCATENATE_26to32Bit 
	PORT MAP(
		in_main => w04,
		in_conc => w02(5 DOWNTO 0),
		o => w09
	);
    
   -- Instantiate CONTROLLER 
	Inst_CONTROLLER_32Bit: CONTROLLER_32Bit 
	PORT MAP(
		Func => w03(5 DOWNTO 0),
		Op => w03(31 DOWNTO 26),
		JALControl => w10,
		RegDst => w11,
	   JALAddrControl => w12,
		JALDataControl => w13,
		ShiftValueControl => w14,
		LoadControl => w15,
		JRControl => w16,
		JumpOrJRControl => w17,
		LUIControl => w18,
		Branch => w19,
		MemToReg => w20,
		MemWrite => w21,
		DSize => w22,
		ALUControl => w23,
		ALUSrc => w24,	
		RegWrite => w25
	);
    
   -- Instantiate REGISTER FILE
	Inst_REGFILE_32BitX5Bit: REGFILE_32BitX5Bit
	PORT MAP(
		clk => wClk,
		rst_s => wRst,
		we => w25,
		raddr_1 => w03(25 DOWNTO 21),
		raddr_2 => w03(20 DOWNTO 16),
		waddr => w07,
		rdata_1 => w26,
		rdata_2 => w27,
		wdata => w08
	);
   
	-- Instantiate SIGN EXTEND A 
	Inst_SIGNEXTEND_5to32Bit: SIGNEXTEND_5to32Bit 
	PORT MAP(
		i => w03(10 DOWNTO 6),
		o => w28
	);
	
   --Instantiate SIGN EXTEND B
	Inst_SIGNEXTEND_16to32Bit_B: SIGNEXTEND_16to32Bit 
	PORT MAP(
		i => w03(15 DOWNTO 0),
		o => w29
	);
    
   --Instantiate MUX_ALUSource
	Inst_MUX_2to1_32Bit_ALUSrc: MUX_2to1_32Bit 
	PORT MAP(
		d0 => w27,
		d1 => w29,
		sel => w24,
		o => w30
	);
	
   --Instantiate MUX_ShiftValue
	Inst_MUX_2to1_32Bit_ShiftValue: MUX_2to1_32Bit 
	PORT MAP(
		d0 => w26,
		d1 => w28,
		sel => w14,
		o => w31
	);

	 --Instantiate Shift Right Two
	Inst_SHIFTRIGHTTWO_32Bit: SHIFTRIGHTTWO_32Bit 
	PORT MAP(
		i => w29,
		o => w32
	);

	--Instantiate ALU
	Inst_ALU_32Bit: ALU_32Bit 
	PORT MAP(
		Func_in => w23,
		A_in => w31,
		B_in => w30,
		O_out => w34,
		Branch_out => w33
	);
	
	--Instantiate ADDER
	Inst_ADDER_32Bit_Unsigned_Jump: ADDER_32Bit_Unsigned 
	PORT MAP(
		pc  => w02,
		val => w32,
		o   => w35
	);
	
	--Instantiate MUX_JumpControl
	Inst_MUX_2to1_32Bit_JumpControl: MUX_2to1_32Bit 
	PORT MAP(
		d0 => w02,
		d1 => w35,
		sel => w37,
		o => w36
	);
	
	-- Instantiate AND
	Inst_AND_2to1_1Bit: AND_2to1_1Bit
	PORT MAP(
		a => w19,
		b => w33,
		o => w37
	);
	
	-- Instantiate Shift & Extend
	Inst_SHIFTANDEXTEND_32Bit: SHIFTANDEXTEND_32Bit
	PORT MAP(
		i => w34,
		o => w38
	);
	
	-- Instantiate Splitter
	Inst_SPLITTER_32Bit: SPLITTER_32Bit
	PORT MAP(
		i => w44,
		sel => w15,
		o => w39
	);
	
	--Instantiate MUX_JumpOrJRControl
	Inst_MUX_2to1_32Bit_JumpOrJRControl: MUX_2to1_32Bit 
	PORT MAP(
		d0 => w41,
		d1 => w36,
		sel => w17,
		o => w40
	);
	
	--Instantiate MUX_JRControl
	Inst_MUX_2to1_32Bit_JRControl: MUX_2to1_32Bit 
	PORT MAP(
		d0 => w09,
		d1 => w34,
		sel => w16,
		o => w41
	);
	
   --Instantiate RAM
	Inst_RAM_512x8Bit: RAM_512x8Bit
	PORT MAP(
		clk => wClk,
		dsize => w22,
		we => w21,
		addr => w34,
		dataI => w27,
		dataO => w42
	);
	
	--Instantiate MUX_LUIControl
	Inst_MUX_2to1_32Bit_LUIControl: MUX_2to1_32Bit 
	PORT MAP(
		d0 => w38,
		d1 => w34,
		sel => w18,
		o => w43
	);
	
	--Instantiate MUX_WBControl
	Inst_MUX_2to1_32Bit_WBControl: MUX_2to1_32Bit 
	PORT MAP(
		d0 => w43,
		d1 => w42,
		sel => w20,
		o => w44
	);
	
	wClk <= ref_clk;
	wRst <= reset;
	--Testing
	out_pc                    <= w01;
	out_adder_pc              <= w02;
	out_rom                   <= w03;
	out_shiftleft             <= w04;
	out_mux_jal               <= w05;
	out_mux_regdst            <= w06;
	out_mux_jaladdr           <= w07;
	out_mux_jaldata           <= w08;
	out_concatenate           <= w09;
	out_controller_jal        <= w10;
	out_controller_regdst     <= w11;
	out_controller_jaladdr    <= w12;
	out_controller_jaldata    <= w13;
	out_controller_shiftvalue <= w14;
	out_controller_load       <= w15;
	out_controller_jr         <= w16;
	out_controller_jumporjr   <= w17;
	out_controller_lui        <= w18;
	out_controller_branch     <= w19;
	out_controller_memtoreg   <= w20;
	out_controller_memwrite   <= w21;
	out_controller_dsize      <= w22;
	out_controller_alu        <= w23;
	out_controller_alusrc     <= w24;
	out_controller_regwrite   <= w25;
	out_regfile_rdata1        <= w26;
	out_regfile_rdata2        <= w27;
	out_signextend_a          <= w28;
	out_signextend_b          <= w29;
	out_mux_alusrc            <= w30;
	out_mux_shiftvalue        <= w31;
	out_shiftrighttwo         <= w32;
	out_alu_branch            <= w33;
	out_alu                   <= w34;
	out_adder_jump            <= w35;
	out_mux_jump              <= w36;
	out_and                   <= w37;
	out_shiftandextend        <= w38;
	out_splitter              <= w39;
	out_mux_jumporjr          <= w40;
	out_mux_jr                <= w41;
	out_ram                   <= w42;
	out_mux_lui               <= w43;
	out_mux_wb                <= w44;
	
END Behavioral;

