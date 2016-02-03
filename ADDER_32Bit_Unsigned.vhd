----------------------------------------------------------------------------------
-- Create Date:    22:02:44 01/16/2016 
-- Module Name:    ADDER_32Bit_Unsigned - Behavioral 
----------------------------------------------------------------------------------
----------------------------------------------------------------------------------
-- LIBRARIES / PACKAGES
----------------------------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
----------------------------------------------------------------------------------
-- ENTITY
----------------------------------------------------------------------------------
ENTITY ADDER_32Bit_Unsigned IS
	PORT(
		pc  : IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
		val : IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
		o   : OUT STD_LOGIC_VECTOR(31 DOWNTO 0) 
	);
END ADDER_32Bit_Unsigned;
----------------------------------------------------------------------------------
-- ARCHITECTURE
----------------------------------------------------------------------------------
ARCHITECTURE Behavioral OF ADDER_32Bit_Unsigned IS
SIGNAL temp : STD_LOGIC_VECTOR(31 DOWNTO 0) := (OTHERS => '0');
BEGIN
	PROCESS(pc)
	BEGIN
		temp <= pc + val;
	END PROCESS;
	o <= temp;
END Behavioral;

