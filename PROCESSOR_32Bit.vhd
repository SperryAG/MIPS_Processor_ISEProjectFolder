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
		t_pc_out           : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		t_adder_out        : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		t_rom_out          : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		t_muxA_out         : OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
		t_contRegDst_out   : OUT STD_LOGIC;
		t_contBranch_out   : OUT STD_LOGIC;
		t_contMemToReg_out : OUT STD_LOGIC;
		t_contFunc_out     : OUT STD_LOGIC_VECTOR(5 DOWNTO 0);
		t_contMemWrite_out : OUT STD_LOGIC;
		t_contALUSrc_out   : OUT STD_LOGIC;
		t_contRegWrite_out : OUT STD_LOGIC;
		t_regData1_out     : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		t_regData2_out     : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		t_signExtend_out   : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		t_muxB_out         : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		t_alu_out          : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		t_ram_out          : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		t_muxC_out         : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END PROCESSOR_32Bit;
----------------------------------------------------------------------------------
-- ARCHITECTURE
----------------------------------------------------------------------------------
ARCHITECTURE Behavioral OF PROCESSOR_32Bit IS
--WIRING HERE--
    SIGNAL w00 : STD_LOGIC_VECTOR(31 DOWNTO 0) := "00000000000000000000000000000001"; -- 1
	 SIGNAL w01 : STD_LOGIC_VECTOR(31 DOWNTO 0); -- Adder <-> ProgramCounter
    SIGNAL w02 : STD_LOGIC_VECTOR(31 DOWNTO 0); -- ProgramCounter <-> Adder/Instruction Memory
    SIGNAL w03 : STD_LOGIC_VECTOR(31 DOWNTO 0); -- Instruction Memory Out
    SIGNAL w04 : STD_LOGIC_VECTOR(4 DOWNTO 0);  -- MuxA <-> Register File (waddr)
    SIGNAL w05 : STD_LOGIC;                     -- Controller <-> MuxA (sel)
    SIGNAL w06 : STD_LOGIC;                     -- Controller <-> Branch
    SIGNAL w07 : STD_LOGIC;                     -- Controller <-> MuxC (sel)
    SIGNAL w08 : STD_LOGIC;                     -- Controller <-> Ram
    SIGNAL w09 : STD_LOGIC_VECTOR(5 DOWNTO 0);  -- Controller <-> ALU (function)
    SIGNAL w10 : STD_LOGIC;                     -- Controller <-> MuxB (sel)
    SIGNAL w11 : STD_LOGIC;                     -- Controller <-> Regsiter File (we)
    SIGNAL w12 : STD_LOGIC_VECTOR(31 DOWNTO 0); -- Register File <-> ALU (A)
    SIGNAL w13 : STD_LOGIC_VECTOR(31 DOWNTO 0); -- Register File <-> MuxB (d0) & RAM (datain)
    SIGNAL w14 : STD_LOGIC_VECTOR(31 DOWNTO 0); -- Sign Extend <-> MuxB (d1)
    SIGNAL w15 : STD_LOGIC_VECTOR(31 DOWNTO 0); -- MuxB <-> ALU (B)
    SIGNAL w16 : STD_LOGIC;                     -- ALU <-> Branch
    SIGNAL w17 : STD_LOGIC;                     -- ALU <-> Jump
    SIGNAL w18 : STD_LOGIC_VECTOR(31 DOWNTO 0); -- ALU <-> RAM (addrin) & MuxC (d1)
    SIGNAL w19 : STD_LOGIC_VECTOR(31 DOWNTO 0); -- RAM <-> MuxC (d0)
    SIGNAL w20 : STD_LOGIC_VECTOR(31 DOWNTO 0); -- MuxC <-> Register File (wdata)
	 -- Clock Signal
	 SIGNAL w21 : STD_LOGIC;
	 -- Reset Signal
	 SIGNAL w22 : STD_LOGIC;
BEGIN
--INSTANTIATIONS--
	
	--Instantiate PROGRAM COUNTER
	Inst_PROG_COUNTER_32Bit: PROG_COUNTER_32Bit
	PORT MAP(
		clk => w21,
		dataI => w01,
		dataO => w02
	);
	
   --Instantiate ADDER
	Inst_ADDER_32Bit_Unsigned: ADDER_32Bit_Unsigned 
	PORT MAP(
		pc  => w02,
		val => w00,
		o   => w01
	);
	
	--Instantiate ROM
	Inst_ROM_512x32Bit: ROM_512x32Bit 
	PORT MAP(
		addr => w02,
		dataIO => w03
	);
	
	-- Instantiate Preload
	--Inst_imem : imem
	--PORT MAP(
	--	a => w02(5 DOWNTO 0),
	--	rd => w03
	--);
	
   --Instantiate MUXA
	Inst_MUX_2to1_5Bit_A: MUX_2to1_5Bit 
	PORT MAP(
		d0 => w03(20 DOWNTO 16),
		d1 => w03(15 DOWNTO 11),
		sel => w05,
		o => w04
	);
    
   --Instantiate CONTROLLER 
	Inst_CONTROLLER_32Bit: CONTROLLER_32Bit 
	PORT MAP(
		Func => w03(5 DOWNTO 0),
		Op => w03(31 DOWNTO 26),
		MemToReg => w07,
		MemWrite => w08,
		Branch => w06,
		ALUControl => w09,
		ALUSrc => w10,
		RegDst => w05,
		RegWrite => w11
	);
    
   --Instantiate REGISTER FILE
	Inst_REGFILE_32BitX5Bit: REGFILE_32BitX5Bit
	PORT MAP(
		clk => w21,
		rst_s => w22,
		we => w11,
		raddr_1 => w03(25 DOWNTO 21),
		raddr_2 => w03(20 DOWNTO 16),
		waddr => w04,
		rdata_1 => w12,
		rdata_2 => w13,
		wdata => w20
	);
    
   --Instantiate SIGN EXTEND
	Inst_SIGNEXTEND_16to32Bit: SIGNEXTEND_16to32Bit 
	PORT MAP(
		i => w03(15 DOWNTO 0),
		o => w14
	);
    
   --Instantiate MUXB
	Inst_MUX_2to1_32Bit_B: MUX_2to1_32Bit 
	PORT MAP(
		d0 => w13,
		d1 => w14,
		sel => w10,
		o => w15
	);

	--Instantiate ALU
	Inst_ALU_32Bit: ALU_32Bit 
	PORT MAP(
		Func_in => w09,
		A_in => w12,
		B_in => w15,
		O_out => w18,
		Branch_out => w16,
		Jump_out => w17 
	);
	
   --Instantiate RAM
	Inst_RAM_512x32Bit: RAM_512x32Bit
	PORT MAP(
		clk => w21,
		we => w08,
		addr => w18,
		dataI => w13,
		dataO => w19
	);
	
	--Instantiate MUXC
	Inst_MUX_2to1_32Bit_C: MUX_2to1_32Bit 
	PORT MAP(
		d0 => w19,
		d1 => w18,
		sel => w07,
		o => w20
	);
	
	w21 <= ref_clk;
	w22 <= reset;
	--Testing
	t_pc_out <= w02;
	t_adder_out <= w01;
	t_rom_out <= w03;
	t_muxA_out <= w04;
	t_contRegDst_out <= w05;
	t_contBranch_out <= w06;
	t_contMemToReg_out <= w07;
	t_contFunc_out <= w09;
	t_contMemWrite_out <= w08;
	t_contALUSrc_out <= w10;
	t_contRegWrite_out <= w11;
	t_regData1_out <= w12;
	t_regData2_out <= w13;
	t_signExtend_out <= w14;
	t_muxB_out <= w15;
	t_alu_out <= w18;
	t_ram_out <= w19;
	t_muxC_out <= w20;
	
END Behavioral;

