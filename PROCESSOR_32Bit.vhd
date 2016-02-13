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
	 SIGNAL w04 : STD_LOGIC_VECTOR(4 DOWNTO 0);  -- out_Mux_JalControl
	 SIGNAL w05 : STD_LOGIC_VECTOR(4 DOWNTO 0);  -- out_Mux_RegDst
	 SIGNAL w06 : STD_LOGIC_VECTOR(4 DOWNTO 0);  -- out_Mux_JalAddrControl
	 SIGNAL w07 : STD_LOGIC_VECTOR(31 DOWNTO 0); -- out_Mux_JalDataControl
	 SIGNAL w08 : STD_LOGIC_VECTOR(31 DOWNTO 0); -- out_Concatenate
	 SIGNAL w09 : STD_LOGIC;                     -- out_Controller_JALControl
	 SIGNAL w10 : STD_LOGIC;                     -- out_Controller_RegDst
	 SIGNAL w11 : STD_LOGIC;                     -- out_Controller_JALAddrControl
	 SIGNAL w12 : STD_LOGIC;                     -- out_Controller_JALDataControl
	 SIGNAL w13 : STD_LOGIC;                     -- out_Controller_ShiftValueControl
	 SIGNAL w14 : STD_LOGIC;                     -- out_Controller_LoadControl
	 SIGNAL w15 : STD_LOGIC;                     -- out_Controller_JRControl
	 SIGNAL w16 : STD_LOGIC;                     -- out_Controller_JumpOrJRControl
	 SIGNAL w17 : STD_LOGIC;                     -- out_Controller_LUIControl
	 SIGNAL w18 : STD_LOGIC;                     -- out_Controller_Branch
	 SIGNAL w19 : STD_LOGIC;                     -- out_Controller_MemToReg
	 SIGNAL w20 : STD_LOGIC;                     -- out_Controller_MemWrite
	 SIGNAL w21 : STD_LOGIC_VECTOR(1 DOWNTO 0);  -- out_Controller_DSize
	 SIGNAL w22 : STD_LOGIC_VECTOR(5 DOWNTO 0);  -- out_Controller_ALUControl
	 SIGNAL w23 : STD_LOGIC;                     -- out_Controller_ALUSource
	 SIGNAL w24 : STD_LOGIC;                     -- out_Controller_RegWrite
	 SIGNAL w25 : STD_LOGIC_VECTOR(31 DOWNTO 0); -- out_RegisterFile_RData1
	 SIGNAL w26 : STD_LOGIC_VECTOR(31 DOWNTO 0); -- out_RegisterFile_RData2
	 SIGNAL w27 : STD_LOGIC_VECTOR(31 DOWNTO 0); -- out_SignExtendA
	 SIGNAL w28 : STD_LOGIC_VECTOR(31 DOWNTO 0); -- out_SignExtendB
	 SIGNAL w29 : STD_LOGIC_VECTOR(31 DOWNTO 0); -- out_Mux_ALUSrc
	 SIGNAL w30 : STD_LOGIC_VECTOR(31 DOWNTO 0); -- out_Mux_ShiftValueControl
	 SIGNAL w31 : STD_LOGIC_VECTOR(31 DOWNTO 0); -- out_ShiftLeftTwo
	 SIGNAL w32 : STD_LOGIC;                     -- out_ALU_BranchOut
	 SIGNAL w33 : STD_LOGIC_VECTOR(31 DOWNTO 0); -- out_ALU
	 SIGNAL w34 : STD_LOGIC_VECTOR(31 DOWNTO 0); -- out_Adder_Jump
	 SIGNAL w35 : STD_LOGIC_VECTOR(31 DOWNTO 0); -- out_Mux_JumpControl
	 SIGNAL w36 : STD_LOGIC;                     -- out_AND
	 SIGNAL w37 : STD_LOGIC_VECTOR(31 DOWNTO 0); -- out_ShiftAndExtend
	 SIGNAL w38 : STD_LOGIC_VECTOR(31 DOWNTO 0); -- out_Splitter
	 SIGNAL w39 : STD_LOGIC_VECTOR(31 DOWNTO 0); -- out_Mux_JumpORJRControl
	 SIGNAL w40 : STD_LOGIC_VECTOR(31 DOWNTO 0); -- out_Mux_JRControl
	 SIGNAL w41 : STD_LOGIC_VECTOR(31 DOWNTO 0); -- out_Ram
	 SIGNAL w42 : STD_LOGIC_VECTOR(31 DOWNTO 0); -- out_Mux_LUIControl
	 SIGNAL w43 : STD_LOGIC_VECTOR(31 DOWNTO 0); -- out_Mux_WBControl
	 
BEGIN
--INSTANTIATIONS--
	
	--Instantiate PROGRAM COUNTER
	Inst_PROG_COUNTER_32Bit: PROG_COUNTER_32Bit
	PORT MAP(
		clk => wClk,
		dataI => w39,
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
	
	-- Instantiate MUX_JalControl
	Inst_MUX_2to1_5Bit_JalControl: MUX_2to1_5Bit 
	PORT MAP(
		d0 => w03(15 DOWNTO 11),
		d1 => wThirtyOne,
		sel => w10,
		o => w04
	);
	
   -- Instantiate MUX_RegDst
	Inst_MUX_2to1_5Bit_RegDst: MUX_2to1_5Bit 
	PORT MAP(
		d0 => w03(20 DOWNTO 16),
		d1 => w03(15 DOWNTO 11),
		sel => w10,
		o => w05
	);
	
	-- Instantiate MUX_JALAddrControl
	Inst_MUX_2to1_5Bit_JALAddrControl: MUX_2to1_5Bit 
	PORT MAP(
		d0 => w05,
		d1 => w04,
		sel => w11,
		o => w06
	);
	
	-- Instantiate MUX_JALDataControl
	Inst_MUX_2to1_32Bit_JALDataControl: MUX_2to1_32Bit 
	PORT MAP(
		d0 => w02,
		d1 => w43,
		sel => w12,
		o => w07
	);
	
	-- Instantiate Concatenate
	Inst_CONCATENATE_26to32Bit: CONCATENATE_26to32Bit 
	PORT MAP(
		in_main => w03(25 DOWNTO 0),
		in_conc => w02(31 DOWNTO 28),
		o => w08
	);
    
   -- Instantiate CONTROLLER 
	Inst_CONTROLLER_32Bit: CONTROLLER_32Bit 
	PORT MAP(
		Func => w03(5 DOWNTO 0),
		Op => w03(31 DOWNTO 26),
		JALControl => w09,
		RegDst => w10,
	   JALAddrControl => w11,
		JALDataControl => w12,
		ShiftValueControl => w13,
		LoadControl => w14,
		JRControl => w15,
		JumpOrJRControl => w16,
		LUIControl => w17,
		Branch => w18,
		MemToReg => w19,
		MemWrite => w20,
		DSize => w21,
		ALUControl => w22,
		ALUSrc => w23,	
		RegWrite => w24
	);
    
   -- Instantiate REGISTER FILE
	Inst_REGFILE_32BitX5Bit: REGFILE_32BitX5Bit
	PORT MAP(
		clk => wClk,
		rst_s => wRst,
		we => w24,
		raddr_1 => w03(25 DOWNTO 21),
		raddr_2 => w03(20 DOWNTO 16),
		waddr => w06,
		rdata_1 => w25,
		rdata_2 => w26,
		wdata => w07
	);
   
	-- Instantiate SIGN EXTEND A 
	Inst_SIGNEXTEND_5to32Bit: SIGNEXTEND_5to32Bit 
	PORT MAP(
		i => w03(10 DOWNTO 6),
		o => w27
	);
	
   --Instantiate SIGN EXTEND B
	Inst_SIGNEXTEND_16to32Bit_B: SIGNEXTEND_16to32Bit 
	PORT MAP(
		i => w03(15 DOWNTO 0),
		o => w28
	);
    
   --Instantiate MUX_ALUSource
	Inst_MUX_2to1_32Bit_ALUSrc: MUX_2to1_32Bit 
	PORT MAP(
		d0 => w26,
		d1 => w28,
		sel => w23,
		o => w29
	);
	
   --Instantiate MUX_ShiftValue
	Inst_MUX_2to1_32Bit_ShiftValue: MUX_2to1_32Bit 
	PORT MAP(
		d0 => w25,
		d1 => w27,
		sel => w13,
		o => w30
	);

	 --Instantiate Shift Left Two
	Inst_SHIFTLEFTTWO_32Bit: SHIFTLEFTTWO_32Bit 
	PORT MAP(
		i => w28,
		o => w31
	);

	--Instantiate ALU
	Inst_ALU_32Bit: ALU_32Bit 
	PORT MAP(
		Func_in => w22,
		A_in => w30,
		B_in => w29,
		O_out => w33,
		Branch_out => w32
	);
	
	--Instantiate ADDER
	Inst_ADDER_32Bit_Unsigned_Jump: ADDER_32Bit_Unsigned 
	PORT MAP(
		pc  => w02,
		val => w31,
		o   => w34
	);
	
	--Instantiate MUX_JumpControl
	Inst_MUX_2to1_32Bit_JumpControl: MUX_2to1_32Bit 
	PORT MAP(
		d0 => w02,
		d1 => w34,
		sel => w36,
		o => w35
	);
	
	-- Instantiate AND
	Inst_AND_2to1_1Bit: AND_2to1_1Bit
	PORT MAP(
		a => w18,
		b => w32,
		o => w36
	);
	
	-- Instantiate Shift & Extend
	Inst_SHIFTANDEXTEND_32Bit: SHIFTANDEXTEND_32Bit
	PORT MAP(
		i => w33,
		o => w37
	);
	
	--Instantiate MUX_JumpOrJRControl
	Inst_MUX_2to1_32Bit_JumpOrJRControl: MUX_2to1_32Bit 
	PORT MAP(
		d0 => w40,
		d1 => w35,
		sel => w16,
		o => w39
	);
	
	--Instantiate MUX_JRControl
	Inst_MUX_2to1_32Bit_JRControl: MUX_2to1_32Bit 
	PORT MAP(
		d0 => w08,
		d1 => w33,
		sel => w15,
		o => w40
	);
	
   --Instantiate RAM
	Inst_RAM_512x8Bit: RAM_512x8Bit
	PORT MAP(
		clk => wClk,
		dsize => w21,
		sign => w14,
		we => w20,
		addr => w33,
		dataI => w26,
		dataO => w41
	);
	
	--Instantiate MUX_LUIControl
	Inst_MUX_2to1_32Bit_LUIControl: MUX_2to1_32Bit 
	PORT MAP(
		d0 => w37,
		d1 => w33,
		sel => w17,
		o => w42
	);
	
	--Instantiate MUX_WBControl
	Inst_MUX_2to1_32Bit_WBControl: MUX_2to1_32Bit 
	PORT MAP(
		d0 => w42,
		d1 => w41,
		sel => w19,
		o => w43
	);
	
	wClk <= ref_clk;
	wRst <= reset;
	--Testing
	out_pc                    <= w01;
	out_adder_pc              <= w02;
	out_rom                   <= w03;
	out_mux_jal               <= w04;
	out_mux_regdst            <= w05;
	out_mux_jaladdr           <= w06;
	out_mux_jaldata           <= w07;
	out_concatenate           <= w08;
	out_controller_jal        <= w09;
	out_controller_regdst     <= w10;
	out_controller_jaladdr    <= w11;
	out_controller_jaldata    <= w12;
	out_controller_shiftvalue <= w13;
	out_controller_load       <= w14;
	out_controller_jr         <= w15;
	out_controller_jumporjr   <= w16;
	out_controller_lui        <= w17;
	out_controller_branch     <= w18;
	out_controller_memtoreg   <= w19;
	out_controller_memwrite   <= w20;
	out_controller_dsize      <= w21;
	out_controller_alu        <= w22;
	out_controller_alusrc     <= w23;
	out_controller_regwrite   <= w24;
	out_regfile_rdata1        <= w25;
	out_regfile_rdata2        <= w26;
	out_signextend_a          <= w27;
	out_signextend_b          <= w28;
	out_mux_alusrc            <= w29;
	out_mux_shiftvalue        <= w30;
	out_shiftrighttwo         <= w31;
	out_alu_branch            <= w32;
	out_alu                   <= w33;
	out_adder_jump            <= w34;
	out_mux_jump              <= w35;
	out_and                   <= w36;
	out_shiftandextend        <= w37;
	out_splitter              <= w38;
	out_mux_jumporjr          <= w39;
	out_mux_jr                <= w40;
	out_ram                   <= w41;
	out_mux_lui               <= w42;
	out_mux_wb                <= w43;
	
END Behavioral;

