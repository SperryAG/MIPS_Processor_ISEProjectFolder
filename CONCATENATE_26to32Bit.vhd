----------------------------------------------------------------------------------
-- Create Date:    20:23:01 02/09/2016 
-- Module Name:    CONCATENATE_26to32Bit - Behavioral 
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
ENTITY CONCATENATE_26to32Bit IS
	PORT(
		in_main : IN  STD_LOGIC_VECTOR(25 DOWNTO 0);
		in_conc : IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
		o       : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END CONCATENATE_26to32Bit;
----------------------------------------------------------------------------------
-- ARCHITECTURE
----------------------------------------------------------------------------------
ARCHITECTURE Behavioral OF CONCATENATE_26to32Bit IS
SIGNAL wire : STD_LOGIC_VECTOR(31 DOWNTO 0);
BEGIN
	PROCESS(in_main,in_conc) BEGIN
		wire <=  in_conc & in_main & "00";
	END PROCESS;
		o <= wire;
END Behavioral;

