----------------------------------------------------------------------------------
-- Create Date:    21:07:35 02/09/2016  
-- Module Name:    SHIFTRIGHTTWO_32Bit - Behavioral 
----------------------------------------------------------------------------------
----------------------------------------------------------------------------------
-- LIBRARIES / PACKAGES
----------------------------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

----------------------------------------------------------------------------------
-- ENTITY
----------------------------------------------------------------------------------
ENTITY SHIFTRIGHTTWO_32Bit IS
	PORT(
		i : IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
		o : OUT STD_LOGIC_VECTOR(31 DOWNTO 0) 
	);
END SHIFTRIGHTTWO_32Bit;
----------------------------------------------------------------------------------
-- ARCHITECTURE
----------------------------------------------------------------------------------
ARCHITECTURE Behavioral OF SHIFTRIGHTTWO_32Bit IS
SIGNAL wire : STD_LOGIC_VECTOR(31 DOWNTO 0);
BEGIN
	PROCESS(i)BEGIN
		wire <= std_logic_vector(unsigned(i) srl 2);
	END PROCESS;
	o <= wire;
END Behavioral;

