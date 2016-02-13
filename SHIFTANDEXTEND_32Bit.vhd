
----------------------------------------------------------------------------------
-- Create Date:    21:45:18 02/09/2016 
-- Module Name:    SHIFTANDEXTEND_32Bit - Behavioral 
----------------------------------------------------------------------------------
----------------------------------------------------------------------------------
-- LIBRARIES / PACKAGES
----------------------------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
----------------------------------------------------------------------------------
-- ENTITY
----------------------------------------------------------------------------------
ENTITY SHIFTANDEXTEND_32Bit IS
	PORT(
		i : IN std_logic_vector(31 DOWNTO 0);
		o : OUT std_logic_vector(31 DOWNTO 0)
	);
END SHIFTANDEXTEND_32Bit;
----------------------------------------------------------------------------------
-- ARCHITECTURE
----------------------------------------------------------------------------------
ARCHITECTURE Behavioral OF SHIFTANDEXTEND_32Bit IS
SIGNAL temp : STD_LOGIC_VECTOR(31 DOWNTO 0) := (OTHERS => '0');
BEGIN
	PROCESS(i)
	BEGIN
		temp(31 DOWNTO 16) <= i(15 DOWNTO 0);
		temp(15 DOWNTO 0) <= (OTHERS => '0');
	END PROCESS;
	o <= temp;
END Behavioral;

