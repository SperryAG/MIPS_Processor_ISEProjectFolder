----------------------------------------------------------------------------------
-- Create Date:    22:06:29 02/09/2016 
-- Module Name:    SPLITTER_32Bit - Behavioral 
----------------------------------------------------------------------------------
----------------------------------------------------------------------------------
-- LIBRARIES / PACKAGES
----------------------------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
----------------------------------------------------------------------------------
-- LIBRARIES / PACKAGES
----------------------------------------------------------------------------------
ENTITY SPLITTER_32Bit IS
	PORT(
		i   : IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
		sel : IN  STD_LOGIC_VECTOR(1 DOWNTO 0);
		o   : OUT STD_LOGIC_VECTOR(31 DOWNTO 0) 
	);
END SPLITTER_32Bit;
----------------------------------------------------------------------------------
-- ARCHITECTURE
----------------------------------------------------------------------------------
ARCHITECTURE Behavioral OF SPLITTER_32Bit IS
SIGNAL temp : STD_LOGIC_VECTOR(31 DOWNTO 0) := (OTHERS => '0');
BEGIN
	PROCESS(i)
	BEGIN
		IF sel = "00" THEN
			temp <= i;
		ELSIF sel = "01" THEN
			temp <= i;
		ELSIF sel = "10" THEN
			temp <= i;
		ELSIF sel = "11" THEN
			temp <= i;
		END IF;
	END PROCESS;
	o <= temp;
END Behavioral;

