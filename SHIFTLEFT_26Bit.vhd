----------------------------------------------------------------------------------
-- Create Date:    19:20:23 02/09/2016 
-- Module Name:    SHIFTLEFT_26Bit - Behavioral 
----------------------------------------------------------------------------------
----------------------------------------------------------------------------------
-- LIBRARIES / PACKAGES
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

----------------------------------------------------------------------------------
-- ENTITY
----------------------------------------------------------------------------------
ENTITY SHIFTLEFT_26Bit IS
	PORT(
		i  : IN  STD_LOGIC_VECTOR(25 DOWNTO 0);
		o  : OUT  STD_LOGIC_VECTOR(25 DOWNTO 0)
	);
END SHIFTLEFT_26Bit;
----------------------------------------------------------------------------------
-- ARCHITECTURE
----------------------------------------------------------------------------------
ARCHITECTURE Behavioral OF SHIFTLEFT_26Bit IS
SIGNAL wire : STD_LOGIC_VECTOR(25 DOWNTO 0);
BEGIN
	PROCESS(i)BEGIN
		wire <= std_logic_vector(unsigned(i) sll 1);
	END PROCESS;
	o <= wire;
END Behavioral;

