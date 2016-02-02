--------------------------------------------------------------------------------
-- Create Date:   15:03:05 01/16/2016
-- VHDL Test Bench Created by ISE for module: MUX_2to1_32Bit
--------------------------------------------------------------------------------
----------------------------------------------------------------------------------
-- LIBRARIES / PACKAGES
----------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
----------------------------------------------------------------------------------
-- ENTITY
----------------------------------------------------------------------------------
ENTITY MUX_2to1_32Bit_tb IS
END MUX_2to1_32Bit_tb;
----------------------------------------------------------------------------------
-- ARCHITECTURE
----------------------------------------------------------------------------------
ARCHITECTURE behavior OF MUX_2to1_32Bit_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT MUX_2to1_32Bit
    PORT(
         d0  : IN  std_logic_vector(31 downto 0);
         d1  : IN  std_logic_vector(31 downto 0);
         sel : IN  std_logic;
         o   : OUT std_logic_vector(31 downto 0)
    );
    END COMPONENT;
    
   --Inputs
   signal in_0 : std_logic_vector(31 downto 0) := (others => '0');
   signal in_1 : std_logic_vector(31 downto 0) := (others => '0');
   signal in_sel : std_logic := '0';

 	--Outputs
   signal out_o : std_logic_vector(31 downto 0);
	
BEGIN
	-- Instantiate the Unit Under Test (UUT)
   uut: MUX_2to1_32Bit PORT MAP (
          d0 => in_0,
          d1 => in_1,
          sel => in_sel,
          o => out_o
        );

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
      -- insert stimulus here
		in_0 <= (2 DOWNTO 0 => '1', OTHERS => '0');
		in_1 <= (31 DOWNTO 29 => '1', OTHERS => '0');
		in_sel <= '0';
		wait for 100 ns;
		in_sel <= '1';
		wait for 50 ns;
		in_sel <= '0';
      wait;
   end process;

END;
