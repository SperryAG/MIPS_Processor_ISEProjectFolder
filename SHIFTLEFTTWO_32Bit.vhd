----------------------------------------------------------------------------------
-- Create Date:    01:05:31 02/13/2016 
-- Module Name:    SHIFTLEFTTWO_32Bit - Behavioral 
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- LIBRARIES / PACKAGES
----------------------------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
----------------------------------------------------------------------------------
-- ENTITY
----------------------------------------------------------------------------------
ENTITY SHIFTLEFTTWO_32Bit IS
	PORT(
		i : IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
		o : OUT STD_LOGIC_VECTOR(31 DOWNTO 0) 
	);
END SHIFTLEFTTWO_32Bit;
----------------------------------------------------------------------------------
-- ARCHITECTURE
----------------------------------------------------------------------------------
ARCHITECTURE Behavioral OF SHIFTLEFTTWO_32Bit IS
SIGNAL wire : STD_LOGIC_VECTOR(31 DOWNTO 0);
BEGIN
	PROCESS(i)BEGIN
		wire <= std_logic_vector(unsigned(i) sll 2);
	END PROCESS;
	o <= wire;
END Behavioral;

