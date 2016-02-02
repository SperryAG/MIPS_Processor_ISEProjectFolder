----------------------------------------------------------------------------------
-- Create Date:    18:47:55 01/16/2016 
-- Module Name:    PROG_COUNTER_32Bit - Behavioral 
----------------------------------------------------------------------------------
----------------------------------------------------------------------------------
-- LIBRARIES / PACKAGES
----------------------------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
----------------------------------------------------------------------------------
-- ENTITY
----------------------------------------------------------------------------------
ENTITY PROG_COUNTER_32Bit IS
	PORT(
		clk   : IN std_logic;
		dataI : IN std_logic_vector(31 DOWNTO 0);
		dataO : OUT std_logic_vector(31 DOWNTO 0)
	);
END PROG_COUNTER_32Bit;
----------------------------------------------------------------------------------
-- ARCHITECTURE
----------------------------------------------------------------------------------
ARCHITECTURE Behavioral OF PROG_COUNTER_32Bit IS
SIGNAL data : std_logic_vector(31 DOWNTO 0) := (OTHERS => '0');
BEGIN
	PROCESS (clk)
	BEGIN
		IF (clk'EVENT AND clk='1') THEN
			data <= dataI;
		END IF;
	END PROCESS;
	dataO <= data;
END Behavioral;
