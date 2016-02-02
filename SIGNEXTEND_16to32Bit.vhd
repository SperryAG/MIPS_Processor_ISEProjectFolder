----------------------------------------------------------------------------------
-- Create Date:    15:47:54 01/16/2016 
-- Module Name:    SIGNEXTEND_16to32Bit - Behavioral 
----------------------------------------------------------------------------------
----------------------------------------------------------------------------------
-- LIBRARIES / PACKAGES
----------------------------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
----------------------------------------------------------------------------------
-- ENTITY
----------------------------------------------------------------------------------
ENTITY SIGNEXTEND_16to32Bit IS
	PORT( 
		i : IN  STD_LOGIC_VECTOR(15 DOWNTO 0);
      o : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END SIGNEXTEND_16to32Bit;
----------------------------------------------------------------------------------
-- ARCHITECTURE
----------------------------------------------------------------------------------
ARCHITECTURE Behavioral OF SIGNEXTEND_16to32Bit IS
SIGNAL temp : STD_LOGIC_VECTOR(31 DOWNTO 0) := (OTHERS => '0');
BEGIN
	PROCESS(i)
	BEGIN
		IF i(15) = '0' THEN
			temp(31 DOWNTO 16) <= (OTHERS => '0');
		else
			temp(31 DOWNTO 16) <= (OTHERS => '1');
		END IF;
		temp(15 DOWNTO 0) <= i;
	END PROCESS;
	o <= temp;
END Behavioral;

