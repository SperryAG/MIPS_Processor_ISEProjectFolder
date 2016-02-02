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
    END COMPONENT;

 	--Outputs
   SIGNAL ref_clk_tb : STD_LOGIC := '0';
   SIGNAL reset_tb   : STD_LOGIC := '0';
	--TestSignals
	SIGNAL t_pc_out_tb           : STD_LOGIC_VECTOR(31 DOWNTO 0);
	SIGNAL t_adder_out_tb        : STD_LOGIC_VECTOR(31 DOWNTO 0);
	SIGNAL t_rom_out_tb          : STD_LOGIC_VECTOR(31 DOWNTO 0);
	SIGNAL t_muxA_out_tb         : STD_LOGIC_VECTOR(4 DOWNTO 0);
	SIGNAL t_contRegDst_out_tb   : STD_LOGIC;
	SIGNAL t_contBranch_out_tb   : STD_LOGIC;
	SIGNAL t_contMemToReg_out_tb : STD_LOGIC;
	SIGNAL t_contFunc_out_tb     : STD_LOGIC_VECTOR(5 DOWNTO 0);
	SIGNAL t_contMemWrite_out_tb : STD_LOGIC;
	SIGNAL t_contALUSrc_out_tb   : STD_LOGIC;
	SIGNAL t_contRegWrite_out_tb : STD_LOGIC;
	SIGNAL t_regData1_out_tb     : STD_LOGIC_VECTOR(31 DOWNTO 0);
	SIGNAL t_regData2_out_tb     : STD_LOGIC_VECTOR(31 DOWNTO 0);
	SIGNAL t_signExtend_out_tb   : STD_LOGIC_VECTOR(31 DOWNTO 0);
	SIGNAL t_muxB_out_tb         : STD_LOGIC_VECTOR(31 DOWNTO 0);
	SIGNAL t_alu_out_tb          : STD_LOGIC_VECTOR(31 DOWNTO 0);
	SIGNAL t_ram_out_tb          : STD_LOGIC_VECTOR(31 DOWNTO 0);
	SIGNAL t_muxC_out_tb         : STD_LOGIC_VECTOR(31 DOWNTO 0);

   -- Clock period definitions
   CONSTANT ref_clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: PROCESSOR_32Bit 
		PORT MAP (
			ref_clk => ref_clk_tb,
         reset => reset_tb,
			--Testing
			t_pc_out => t_pc_out_tb,
			t_adder_out => t_adder_out_tb,
			t_rom_out => t_rom_out_tb,
			t_muxA_out => t_muxA_out_tb,
			t_contRegDst_out => t_contRegDst_out_tb,
			t_contBranch_out => t_contBranch_out_tb,
			t_contMemToReg_out => t_contMemToReg_out_tb,
			t_contFunc_out => t_contFunc_out_tb,
			t_contMemWrite_out => t_contMemWrite_out_tb,
			t_contALUSrc_out => t_contALUSrc_out_tb,
			t_contRegWrite_out => t_contRegWrite_out_tb,
			t_regData1_out => t_regData1_out_tb,
			t_regData2_out => t_regData2_out_tb,
			t_signExtend_out => t_signExtend_out_tb,
			t_muxB_out => t_muxB_out_tb,
			t_alu_out => t_alu_out_tb,
			t_ram_out => t_ram_out_tb,
			t_muxC_out => t_muxC_out_tb
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
