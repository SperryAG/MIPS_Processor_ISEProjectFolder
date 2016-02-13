---------------------------------------------------------------------------------- 
-- Create Date:    19:46:28 02/12/2016 
-- Module Name:    SIGNEXTEND_5to32Bit - Behavioral 
----------------------------------------------------------------------------------
----------------------------------------------------------------------------------
-- LIBRARIES / PACKAGES
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
----------------------------------------------------------------------------------
-- ARCHITECTURE
----------------------------------------------------------------------------------
ENTITY SIGNEXTEND_5to32Bit IS
	PORT( 
		i : IN  STD_LOGIC_VECTOR(4 DOWNTO 0);
      o : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END SIGNEXTEND_5to32Bit;
----------------------------------------------------------------------------------
-- ARCHITECTURE
----------------------------------------------------------------------------------
ARCHITECTURE Behavioral OF SIGNEXTEND_5to32Bit IS
SIGNAL temp : STD_LOGIC_VECTOR(31 DOWNTO 0) := (OTHERS => '0');
BEGIN
	PROCESS(i)
	BEGIN
		IF i(4) = '0' THEN
			temp(31 DOWNTO 5) <= (OTHERS => '0');
		else
			temp(31 DOWNTO 5) <= (OTHERS => '1');
		END IF;
		temp(4 DOWNTO 0) <= i;
	END PROCESS;
	o <= temp;
END Behavioral;


