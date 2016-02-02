--------------------------------------------------------------------------------
-- Create Date:   16:19:16 01/16/2016
-- VHDL Test Bench Created by ISE for module: SIGNEXTEND_16to32Bit
--------------------------------------------------------------------------------
----------------------------------------------------------------------------------
-- LIBRARIES / PACKAGES
----------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
----------------------------------------------------------------------------------
-- ENTITY
----------------------------------------------------------------------------------
ENTITY SIGNEXTEND_16to32Bit_tb IS
END SIGNEXTEND_16to32Bit_tb;
----------------------------------------------------------------------------------
-- ARCHITECTURE
----------------------------------------------------------------------------------
ARCHITECTURE behavior OF SIGNEXTEND_16to32Bit_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT SIGNEXTEND_16to32Bit
    PORT(
         i : IN  std_logic_vector(15 downto 0);
         o : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;

   --Inputs
   signal in_i : std_logic_vector(15 downto 0) := (others => '0');
   signal out_o : std_logic_vector(31 downto 0) := (others => '0');
   
BEGIN
	-- Instantiate the Unit Under Test (UUT)
   uut: SIGNEXTEND_16to32Bit 
		PORT MAP(
          i => in_i,
          o => out_o
      );
		  
   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
      -- insert stimulus here
		in_i <= "1001011011100010";
		wait for 100 ns;
		in_i <= "0110100100011101";
      wait;
   end process;
END;
